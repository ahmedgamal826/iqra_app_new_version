import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iqra_app_new_version_22/cubit/ahades%20bloc/ahades_cubit.dart';
import 'package:iqra_app_new_version_22/cubit/ahades%20bloc/ahades_states.dart';

class PageAhadesDetails extends StatefulWidget {
  final int id;
  final String title;

  const PageAhadesDetails({Key? key, required this.id, required this.title})
      : super(key: key);

  @override
  PageAhadesDetailsState createState() => PageAhadesDetailsState();
}

class PageAhadesDetailsState extends State<PageAhadesDetails> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AhadesCubit()..loadSectionAhadesDetails(widget.id),
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
        body: BlocBuilder<AhadesCubit, AhadesStates>(
          builder: (context, state) {
            if (state is AhadesLoading) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.green,
                ),
              );
            } else if (state is AhadesSectionDetailsLoaded) {
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
                            subtitle: Card(
                              color: Colors.white,
                              elevation: 8,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(
                                    8.0), // إضافة مسافة داخلية
                                child: Text(
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
                            // subtitle: Container(
                            //   decoration: BoxDecoration(
                            //     color: Colors.orangeAccent.withOpacity(0.1),
                            //     border: Border.all(
                            //       color: Colors.green,
                            //       width: 1.5,
                            //     ),
                            //     borderRadius: BorderRadius.circular(7),
                            //     shape: BoxShape.rectangle,
                            //   ),
                            //   child: Text(
                            //     "${sectionDetails[index].content}",
                            //     textDirection: TextDirection.rtl,
                            //     textAlign: TextAlign.center,
                            //     style: const TextStyle(
                            //         fontSize: 24,
                            //         fontWeight: FontWeight.bold,
                            //         color: Colors.black),
                            //   ),
                            // ),
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
            } else if (state is AhadesError) {
              return Center(child: Text('Error: ${state.message}'));
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
