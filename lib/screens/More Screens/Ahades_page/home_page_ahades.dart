import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:iqra_app_new_version_22/models/ahades_model.dart';
import 'package:iqra_app_new_version_22/screens/More%20Screens/Ahades_page/page_ahades_details.dart';

class HomePageAhades extends StatefulWidget {
  const HomePageAhades({Key? key}) : super(key: key);

  @override
  State<HomePageAhades> createState() => _AzkarHomePageState();
}

class _AzkarHomePageState extends State<HomePageAhades> {
  List<AhadesModel> sections = [];

  @override
  void initState() {
    super.initState();
    loadSections();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
          size: 30,
        ),
        elevation: 0,
        backgroundColor: Colors.brown,
        actions: [
          Image.asset(
            'assets/images/prophet_mosque.png',
            width: 50,
          ),
        ],
        title: const Text(
          "الأحاديث الشريفة ",
          style: TextStyle(
              fontFamily: 'Tajawal',
              fontSize: 30,
              color: Colors.white,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView.builder(
          itemBuilder: (context, index) =>
              buildSectionItem(model: sections[index]),
          itemCount: sections.length,
          physics: const BouncingScrollPhysics(),
        ),
      ),
    );
  }

  Widget buildSectionItem({required AhadesModel model}) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => PageAhadesDetails(
                  id: model.id!,
                  title: model.name!,
                )));
      },
      child: Container(
        margin: const EdgeInsets.only(top: 12.0),
        width: double.infinity,
        height: 100,
        decoration: BoxDecoration(
          color: model.id! % 2 == 0 ? Colors.brown : Colors.brown.shade400,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Center(
          child: Text(
            "${model.name}",
            style: const TextStyle(
              fontSize: 27,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  loadSections() async {
    DefaultAssetBundle.of(context)
        .loadString("assets/database/ahades_db.json")
        .then((data) {
      var response = json.decode(data);
      // print(response);
      response.forEach((section) {
        //print(section["name"]);
        AhadesModel _section = AhadesModel.fromJson(section);
        sections.add(_section); // sections ==> List
      });
      setState(() {}); // to feel Scaffold with the new data
    }).catchError((error) {
      print(error);
    });
  }
}
