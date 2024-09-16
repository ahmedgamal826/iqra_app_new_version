import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iqra_app_new_version_22/cubit/azkar%20bloc/azkar_cubit.dart';
import 'package:iqra_app_new_version_22/cubit/azkar%20bloc/azkar_states.dart';

class SectionAzkarDetailScreen extends StatefulWidget {
  final int id;
  final String title;

  const SectionAzkarDetailScreen(
      {Key? key, required this.id, required this.title})
      : super(key: key);

  @override
  _SectionDetailScreenState createState() => _SectionDetailScreenState();
}

class _SectionDetailScreenState extends State<SectionAzkarDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AzkarCubit()..loadSectionDetails(widget.id),
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
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.brown,
        ),
        body: BlocBuilder<AzkarCubit, AzkarState>(
          builder: (context, state) {
            if (state is AzkarLoading) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.brown,
                ),
              );
            } else if (state is AzkarSectionDetailsLoaded) {
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
                            title: Text(
                              "${sectionDetails[index].reference}",
                              textDirection: TextDirection.rtl,
                              style: const TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.brown,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Text(
                                    '${index + 1} / ${sectionDetails.length}',
                                    style: const TextStyle(
                                      fontSize: 30,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    int count = int.parse(
                                        sectionDetails[index].count.toString());
                                    if (count > 0) {
                                      count--;
                                      sectionDetails[index].count =
                                          count.toString();
                                    }

                                    if (count == 0 &&
                                        index == sectionDetails.length - 1) {
                                      showAwesomeDialog();
                                    }
                                  });
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  decoration: BoxDecoration(
                                    color: Colors.brown,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: sectionDetails[index].count == '0'
                                        ? const Icon(
                                            Icons.check,
                                            size: 38,
                                            color: Colors.white,
                                          )
                                        : Text(
                                            '${sectionDetails[index].count}',
                                            style: const TextStyle(
                                              fontSize: 30,
                                              color: Colors.white,
                                            ),
                                          ),
                                  ),
                                ),
                              ),
                            ],
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
            } else if (state is AzkarError) {
              return Center(child: Text('Error: ${state.message}'));
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }

  void showAwesomeDialog() {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.success,
      title: 'تقبل الله منا ومنكم صالح الأعمال',
      btnOkOnPress: () {
        Navigator.pop(context);
      },
    )..show();
  }
}
