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
        backgroundColor: Colors.white,
        appBar: AppBar(
          iconTheme: const IconThemeData(
            size: 30,
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
          backgroundColor: Colors.green,
        ),
        body: BlocBuilder<StoriesCubit, StoriesStates>(
          builder: (context, state) {
            if (state is StoriesLoading) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.green,
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
              return ListView.builder(
                reverse: false,
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: ListTile(
                          title: SelectableText(
                            textAlign: TextAlign.center,
                            "${sectionDetails[index].reference}",
                            textDirection: TextDirection.rtl,
                            style: const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          contentPadding: EdgeInsets.all(10),
                          subtitle: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border:
                                  Border.all(color: Colors.green, width: 1.5),
                              borderRadius: BorderRadius.circular(7),
                              // color: const Color(0xffD4BEB0),
                              shape: BoxShape.rectangle,
                            ),
                            child: SelectableText(
                              "${sectionDetails[index].content}",
                              textDirection: TextDirection.rtl,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Divider(
                        indent: 25,
                        endIndent: 25,
                        color: Colors.green,
                        thickness: 3,
                      )
                    ],
                  );
                },
                itemCount: sectionDetails.length,
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
