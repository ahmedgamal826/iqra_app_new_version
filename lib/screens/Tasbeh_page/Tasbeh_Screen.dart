import 'package:flutter/material.dart';

class Tasbeh_screen extends StatefulWidget {
  const Tasbeh_screen({super.key});

  @override
  State<Tasbeh_screen> createState() => _Tasbeh_screenState();
}

class _Tasbeh_screenState extends State<Tasbeh_screen> {
  int counter = 0;
  int allCounter = 0;
  List<String> statments = [
    'صلى على النبى',
    'سبحان الله',
    'الحمدلله',
    'الله اكبر',
    'أَستغفرُ الله',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'السبحه الالكترونيه',
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.brown, fontSize: 30
              // fontFamily: 'Rakkas',
              ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.brown,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: Image.asset(
                      'assets/images/silent-mode.png',
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.brown,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: Image.asset(
                      color: Colors.white,
                      'assets/images/speaker-silent-outline-with-a-cross.png',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Center(
              child: CircleAvatar(
                radius: 150,
                backgroundColor: Colors.brown,
                child: Text(
                  '$counter',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    // fontFamily: 'Rakkas',
                  ),
                ),
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            width: 295,
            height: 50,
            margin: const EdgeInsets.symmetric(vertical: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.brown,
            ),
            child: Text(
              '$allCounter  مجموع التسبحات',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,

                // fontFamily: 'Rakkas',
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      counter = 0;
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: 138,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.brown,
                    ),
                    child: const Text(
                      'تصفير',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,

                        // fontFamily: 'Rakkas',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      counter++;
                      allCounter++;
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: 138,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.brown,
                    ),
                    child: const Text(
                      'تسبيحه',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold
                          // fontFamily: 'Rakkas',
                          ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
