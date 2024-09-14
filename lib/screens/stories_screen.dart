import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:iqra_app_new_version_22/models/stories_model.dart';
import 'package:iqra_app_new_version_22/screens/stories_details_screen.dart';

class StoriesScreen extends StatefulWidget {
  const StoriesScreen({Key? key}) : super(key: key);

  @override
  State<StoriesScreen> createState() => _StoriesScreenState();
}

class _StoriesScreenState extends State<StoriesScreen> {
  List<StoriesModel> sections = [];

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
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Image.asset(
              'assets/images/stories_icon.png',
              width: 50,
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
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.builder(
          itemCount: sections.length,
          physics: const BouncingScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12.0,
            mainAxisSpacing: 12.0,
            childAspectRatio: 1.0,
          ),
          itemBuilder: (context, index) =>
              buildSectionItem(model: sections[index]),
        ),
      ),
      // body: Padding(
      //   padding: const EdgeInsets.all(12.0),
      //   child: ListView.builder(
      //     itemBuilder: (context, index) =>
      //         buildSectionItem(model: sections[index]),
      //     itemCount: sections.length,
      //     physics: const BouncingScrollPhysics(),
      //   ),
      // ),
    );
  }

  // Widget buildSectionItem({required StoriesModel model}) {
  //   return InkWell(
  //     onTap: () {
  //       Navigator.of(context).push(
  //         MaterialPageRoute(
  //           builder: (context) => StoriesDetailsScreen(
  //             id: model.id!,
  //             title: model.name!,
  //           ),
  //         ),
  //       );
  //     },
  //     child: Column(
  //       children: [
  //         Container(
  //           margin: const EdgeInsets.only(top: 12.0),
  //           width: double.infinity,
  //           height: 100,
  //           decoration: BoxDecoration(
  //             color: model.id! % 2 == 0 ? Colors.brown : Colors.brown.shade400,
  //             borderRadius: BorderRadius.circular(50),
  //           ),
  //           child: Column(
  //             children: [
  //               Image.asset(
  //                 'assets/images/قصة_موسى_عليه_السلام.jpg',
  //                 fit: BoxFit.cover,
  //               ),
  //             ],
  //           ),
  //         ),
  //         Text(
  //           "${model.name}",
  //           style: const TextStyle(
  //             fontSize: 27,
  //             color: Colors.white,
  //             fontWeight: FontWeight.bold,
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  Widget buildSectionItem({required StoriesModel model}) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => StoriesDetailsScreen(
              id: model.id!,
              title: model.name!,
            ),
          ),
        );
      },
      child: ListView(
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 12.0),
            width: double.infinity,
            height: 100,
            decoration: BoxDecoration(
              color: model.id! % 2 == 0 ? Colors.brown : Colors.brown.shade400,
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: AssetImage('${model.icon}'),
                fit: BoxFit.cover, // لضمان أن الصورة تملأ الحاوية بالكامل
              ),
            ),
          ),
          Text(
            "${model.name}",
            style: const TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  loadSections() async {
    DefaultAssetBundle.of(context)
        .loadString("assets/database/stories_db.json")
        .then((data) {
      var response = json.decode(data);
      // print(response);
      response.forEach((section) {
        //print(section["name"]);
        StoriesModel _section = StoriesModel.fromJson(section);
        sections.add(_section); // sections ==> List
      });
      setState(() {}); // to feel Scaffold with the new data
    }).catchError((error) {
      print(error);
    });
  }
}
