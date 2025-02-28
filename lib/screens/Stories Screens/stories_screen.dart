import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iqra_app_new_version_22/cubit/stories%20bloc/stories_cubit.dart';
import 'package:iqra_app_new_version_22/cubit/stories%20bloc/stories_states.dart';
import 'package:iqra_app_new_version_22/models/stories_model.dart';
import 'package:iqra_app_new_version_22/widgets/stories_widgets/section_stories_item.dart';

class StoriesScreen extends StatelessWidget {
  const StoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Call the Cubit's method to load the initial data if needed
    final storiesCubit = context.read<StoriesCubit>();
    storiesCubit.loadSectionsFromFile(); // تحميل البيانات من الملف

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
          size: 30,
        ),
        elevation: 0,
        backgroundColor: Colors.green,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Image.asset(
              'assets/images/stories_icon.png',
              color: Colors.white,
              width: 45,
            ),
          ),
        ],
        title: const Text(
          "قصص اسلامية",
          style: TextStyle(
              fontFamily: 'Tajawal',
              fontSize: 30,
              color: Colors.white,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: BlocListener<StoriesCubit, StoriesStates>(
        listener: (context, state) {
          if (state is StoriesError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Error: ${state.message}')),
            );
          }
        },
        child: BlocBuilder<StoriesCubit, StoriesStates>(
          builder: (context, state) {
            if (state is StoriesLoading) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.green,
                ),
              );
            } else if (state is StoriesSectionsLoaded) {
              return Padding(
                padding: const EdgeInsets.all(12.0),
                child: GridView.builder(
                  itemCount: state.Storiessections.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12.0,
                    mainAxisSpacing: 12.0,
                    childAspectRatio: 1.0,
                  ),
                  itemBuilder: (context, index) => buildSectionStoriesItem(
                      model: state.Storiessections[index], context: context),
                ),
              );
            }

            // return Padding(
            //   padding: const EdgeInsets.all(12.0),
            //   child: ListView.builder(
            //     itemBuilder: (context, index) => buildSectionStoriesItem(
            //         model: state.Storiessections[index], context: context),
            //     itemCount: state.Storiessections.length,
            //     physics: const BouncingScrollPhysics(),
            //   ),
            // );
            else if (state is StoriesError) {
              return Center(child: Text('Error: ${state.message}'));
            }

            // عرض البيانات المخزنة مؤقتاً في SharedPreferences
            final cachedData = BlocProvider.of<StoriesCubit>(context);

            return FutureBuilder<String?>(
              future: cachedData.getCachedData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.green,
                    ),
                  );
                } else if (snapshot.hasData && snapshot.data != null) {
                  final List<dynamic> jsonList = json.decode(snapshot.data!);
                  final List<StoriesModel> sections = jsonList
                      .map((json) => StoriesModel.fromJson(json))
                      .toList();

                  return Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: ListView.builder(
                      itemBuilder: (context, index) => buildSectionStoriesItem(
                          model: sections[index], context: context),
                      itemCount: sections.length,
                      physics: const BouncingScrollPhysics(),
                    ),
                  );
                } else {
                  return const Center(
                    child: Text('لم يتم العثور على بيانات'),
                  );
                }
              },
            );
          },
        ),
      ),
    );
  }
}
