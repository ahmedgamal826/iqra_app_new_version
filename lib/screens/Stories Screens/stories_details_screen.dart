import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iqra_app_new_version_22/cubit/stories%20bloc/stories_cubit.dart';
import 'package:iqra_app_new_version_22/cubit/stories%20bloc/stories_states.dart';

class StoriesDetailsScreen extends StatefulWidget {
  final int id;
  final String title;

  const StoriesDetailsScreen({Key? key, required this.id, required this.title})
      : super(key: key);

  @override
  PageAhadesDetailsState createState() => PageAhadesDetailsState();
}

class PageAhadesDetailsState extends State<StoriesDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StoriesCubit()..loadSectionStoriesDetails(widget.id),
      child: Scaffold(
        backgroundColor: const Color(0xffE6DECB),
        appBar: AppBar(
          iconTheme: const IconThemeData(
            size: 35,
            color: Colors.white,
          ),
          centerTitle: true,
          title: Text(
            widget.title,
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.brown,
        ),
        body: BlocBuilder<StoriesCubit, StoriesStates>(
          builder: (context, state) {
            if (state is StoriesLoading) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.brown,
                ),
              );
            } else if (state is StoriesSectionDetailsLoaded) {
              final sectionDetails = state.sectionDetails
                  .where((detail) => detail.sectionId == widget.id)
                  .toList();
              if (sectionDetails.isEmpty) {
                return const Center(
                  child: Text(
                    'No details available for this section.',
                  ),
                );
              }
              return Padding(
                padding: const EdgeInsets.all(12.0),
                child: ListView.builder(
                  reverse: false,
                  itemBuilder: (context, index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: ListTile(
                            title: Text(
                              textAlign: TextAlign.center,
                              "${sectionDetails[index].reference}",
                              textDirection: TextDirection.rtl,
                              style: const TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: const Color(0xffD4BEB0),
                                shape: BoxShape.rectangle,
                              ),
                              child: Text(
                                "${sectionDetails[index].content}",
                                textDirection: TextDirection.rtl,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Divider(
                          color: Colors.black,
                          thickness: 3,
                        )
                      ],
                    );
                  },
                  itemCount: sectionDetails.length,
                ),
              );
            } else if (state is StoriesError) {
              return Center(child: Text('Error: ${state.message}'));
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
