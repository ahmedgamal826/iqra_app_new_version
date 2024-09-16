import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iqra_app_new_version_22/cubit/tasbih%20bloc/counter_tasbih_cubit.dart';
import 'package:iqra_app_new_version_22/cubit/tasbih%20bloc/counter_tasbih_state.dart';
import 'package:iqra_app_new_version_22/widgets/tasbih%20widgets/custom_circle_avatar.dart';

class AzkarTasbihScreen extends StatefulWidget {
  const AzkarTasbihScreen({super.key});

  @override
  State<AzkarTasbihScreen> createState() => _AzkarTasbihScreenState();
}

class _AzkarTasbihScreenState extends State<AzkarTasbihScreen> {
  int counterTasbih = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Image.asset(
              'assets/images/ramadan.png',
              color: Colors.white,
              width: 35,
            ),
          ),
        ],
        centerTitle: true,
        backgroundColor: Colors.brown,
        title: const Text(
          'المسبحة الإلكترونية',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(children: [
              Container(
                width: 130,
                height: 170,
                decoration: const BoxDecoration(
                    color: Colors.brown,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50))),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 50, left: 50),
                child: CustomcircleAvatar(radius: 15),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 120, left: 50),
                child: CustomcircleAvatar(radius: 15),
              )
            ]),
            Stack(alignment: Alignment.topCenter, children: [
              Container(
                width: 300,
                height: 270,
                decoration: BoxDecoration(
                    color: Colors.brown,
                    borderRadius: BorderRadius.circular(60)),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Container(
                  width: 250,
                  height: 100,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25)),
                  child:
                      BlocBuilder<CounterTasbihCubit, CounterTasbihCubitState>(
                    builder: (context, state) {
                      return Center(
                          child: Text(
                        '${state.counterTasbih}',
                        style: TextStyle(fontSize: 50),
                      ));
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 150, left: 160),
                child: CustomcircleAvatar(
                  radius: 20,
                  onTab: () {
                    setState(() {
                      print("dgdf");
                      AwesomeDialog(
                        context: context,
                        title: 'هل أنت متأكد أنك تريد إعادة تعيين العداد؟',
                        width: 400,
                        btnOkText: 'نعم',
                        btnCancelText: 'لا',
                        buttonsTextStyle:
                            TextStyle(fontSize: 30, color: Colors.white),
                        btnCancelOnPress: () {},
                        btnOkOnPress: () {
                          setState(() {
                            context.read<CounterTasbihCubit>().zeroValue();
                          });
                        },
                      )..show();
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 160),
                child: CustomcircleAvatar(
                  radius: 50,
                  onTab: () {
                    setState(() {
                      context.read<CounterTasbihCubit>().incrementValue();
                    });
                  },
                ),
              )
            ]),
            Stack(alignment: Alignment.center, children: [
              Container(
                width: 130,
                height: 120,
                decoration: BoxDecoration(
                    color: Colors.brown,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50))),
              ),
              CircleAvatar(
                radius: 15,
                backgroundColor: Colors.white,
              )
            ]),
          ],
        ),
      ),
    );
  }
}


















 // show dialog
  // void _showDialog(BuildContext context) {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: Text('سيتم إعادة تعيين العداد؟'),
  //         content: Text(
  //           'هل أنت متأكد أنك تريد إعادة تعيين العداد؟',
  //           style: TextStyle(fontSize: 20),
  //         ),
  //         actions: <Widget>[
  //           Padding(
  //             padding: const EdgeInsets.symmetric(horizontal: 20),
  //             child: Row(
  //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //               children: [
  //                 TextButton(
  //                   onPressed: () {
  //                     Navigator.of(context).pop();
  //                   },
  //                   child: Text(
  //                     'إلغاء',
  //                     style: TextStyle(fontSize: 20),
  //                   ),
  //                 ),
  //                 TextButton(
  //                   onPressed: () {
  //                     setState(() {
  //                       counterTasbih = 0;
  //                       Navigator.of(context).pop();
  //                     });
  //                   },
  //                   child: Text(
  //                     'نعم',
  //                     style: TextStyle(fontSize: 20),
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }