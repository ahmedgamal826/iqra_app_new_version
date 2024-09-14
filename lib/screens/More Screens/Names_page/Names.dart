import 'package:flutter/material.dart';
import 'package:iqra_app_new_version_22/models/listofnames.dart';

class Names extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
          size: 30,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              'assets/images/allah.png',
              color: Colors.white,
            ),
          ),
        ],
        centerTitle: true,
        backgroundColor: Colors.brown,
        title: const Text(
          'أسماء الله الحسنى',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            // fontFamily: 'Rakkas',
            fontSize: 30,
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Container(
            width: 250,
            height: 100,
            padding: const EdgeInsets.symmetric(horizontal: 21),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.brown,
            ),
            child: const Text(
              'الله',
              style: TextStyle(
                  fontSize: 60, fontFamily: 'Rakkas', color: Colors.white),
            ),
          ),
          Expanded(
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: GridView.builder(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.all(8),
                itemCount: nameList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 4,
                ),
                itemBuilder: (context, index) {
                  listOfNames names = nameList[index];
                  return Container(
                    padding: const EdgeInsets.symmetric(horizontal: 21),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.brown,
                    ),
                    child: Text(
                      names.text,
                      style: const TextStyle(
                          fontSize: 26,
                          fontFamily: 'Rakkas',
                          color: Colors.white),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
