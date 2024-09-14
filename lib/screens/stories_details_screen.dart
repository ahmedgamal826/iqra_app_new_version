import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:iqra_app_new_version_22/models/ahades_details_model.dart';
import 'package:iqra_app_new_version_22/models/stories_details_model.dart';

class StoriesDetailsScreen extends StatefulWidget {
  final int id;
  final String title;

  const StoriesDetailsScreen({Key? key, required this.id, required this.title})
      : super(key: key);

  @override
  State<StoriesDetailsScreen> createState() =>
      _StoriesDetailsScreenScreenState();
}

class _StoriesDetailsScreenScreenState extends State<StoriesDetailsScreen> {
  List<StoriesDetailsModel> sectionDetails = [];
  int currentIndexPage = 0;

  int counter = 0;

  @override
  void initState() {
    super.initState();
    loadDetailSections();
  }

  @override
  Widget build(BuildContext context) {
    // int count = 0;
    return Scaffold(
      backgroundColor: const Color(0xffE6DECB),
      appBar: AppBar(
        iconTheme: const IconThemeData(size: 35, color: Colors.white),
        centerTitle: true,
        title: Text(
          "${widget.title}",
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.brown,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView.builder(
          itemBuilder: (context, index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Column(
                    children: [
                      Text(
                        "${sectionDetails[index].reference}",
                        textDirection: TextDirection.rtl,
                        textAlign: TextAlign.end,
                        style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
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
                    ],
                  ),
                ),
                const Divider(
                  color: Colors.black,
                  thickness: 2,
                  height: 30,
                )
              ],
            );
          },
          itemCount: sectionDetails.length,
        ),
      ),
    );
  }

  loadDetailSections() async {
    sectionDetails = [];
    DefaultAssetBundle.of(context)
        .loadString("assets/database/stories_db_details.json")
        .then((data) {
      var response = json.decode(data);
      // print(response);
      response.forEach((section) {
        //print(section["name"]);
        StoriesDetailsModel _sectionDetail =
            StoriesDetailsModel.fromJson(section);

        // print(_sectionDetail.sectionId);   // Error : sectionID = null

        if (_sectionDetail.sectionId == widget.id) {
          sectionDetails.add(_sectionDetail); // sections ==> List
        }
      });
      setState(() {}); // to feel Scaffold with the new data
    }).catchError((error) {
      print(error);
    });
  }
}
