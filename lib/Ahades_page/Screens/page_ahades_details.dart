import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:iqra_app_new_version_22/Ahades_page/models/ahades_details_model.dart';

class PageAhadesDetails extends StatefulWidget {
  final int id;
  final String title;

  const PageAhadesDetails({Key? key, required this.id, required this.title})
      : super(key: key);

  @override
  State<PageAhadesDetails> createState() => _SectionDetailScreenState();
}

class _SectionDetailScreenState extends State<PageAhadesDetails> {
  List<AhadesDetailsModel> sectionDetails = [];
  int currentIndexPage = 0;

  int counter = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadDetailSections();
  }

  @override
  Widget build(BuildContext context) {
    // int count = 0;
    return Scaffold(
      backgroundColor: Color(0xffE6DECB),
      appBar: AppBar(
        iconTheme: IconThemeData(size: 35, color: Colors.white),
        centerTitle: true,
        title: Text(
          "${widget.title}",
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
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
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0xffD4BEB0),
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
                Divider(
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
        .loadString("assets/database/ahades_details_db.json")
        .then((data) {
      var response = json.decode(data);
      // print(response);
      response.forEach((section) {
        //print(section["name"]);
        AhadesDetailsModel _sectionDetail =
            AhadesDetailsModel.fromJson(section);

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
