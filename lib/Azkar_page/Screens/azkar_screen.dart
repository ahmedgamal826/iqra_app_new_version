import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:iqra_app_new_version_22/Azkar_page/Screens/section_detail_screen.dart';
import 'package:iqra_app_new_version_22/Azkar_page/model_section_ahaes/sectiom_model.dart';

class AzkarHomePage extends StatefulWidget {
  const AzkarHomePage({Key? key}) : super(key: key);

  @override
  State<AzkarHomePage> createState() => _AzkarHomePageState();
}

class _AzkarHomePageState extends State<AzkarHomePage> {
  List<AzkarModel> sections = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadSections();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Image.asset(
          'assets/images/azkar.jpg',
          width: 30,
        ),
        title: Text(
          "أذكار المسلم ",
          style: TextStyle(
              fontFamily: 'Tajawal',
              fontSize: 30,
              color: Colors.brown,
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
          physics: BouncingScrollPhysics(),
        ),
      ),
    );
  }

  Widget buildSectionItem({required AzkarModel model}) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => SectionDetailScreen(
                  id: model.id!,
                  title: model.name!,
                )));
      },
      child: Container(
        margin: EdgeInsets.only(top: 12.0),
        width: double.infinity,
        height: 100,
        decoration: BoxDecoration(
          color: model.id! % 2 == 0 ? Colors.brown : Colors.brown.shade400,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Image.asset(
                '${model.icon}',
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Text(
                "${model.name}",
                style: TextStyle(
                  fontSize: 23,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  loadSections() async {
    DefaultAssetBundle.of(context)
        .loadString("assets/database/sections_db.json")
        .then((data) {
      var response = json.decode(data);
      // print(response);
      response.forEach((section) {
        //print(section["name"]);
        AzkarModel _section = AzkarModel.fromJson(section);
        sections.add(_section); // sections ==> List
      });
      setState(() {}); // to feel Scaffold with the new data
    }).catchError((error) {
      print(error);
    });
  }
}
