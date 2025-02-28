import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iqra_app_new_version_22/cubit/azkar%20bloc/azkar_cubit.dart';
import 'package:iqra_app_new_version_22/models/sectiom_model.dart';
import 'package:iqra_app_new_version_22/screens/Azkar_page/section_azkar_detail_screen.dart';

Widget buildSectionItem(
    {required AzkarModel model, required BuildContext context}) {
  final azkarCubit = BlocProvider.of<AzkarCubit>(context);

  return InkWell(
    onTap: () {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => BlocProvider.value(
                value: azkarCubit,
                child: SectionAzkarDetailScreen(
                  id: model.id!,
                  title: model.name!,
                ),
              )));
    },
    child: Card(
      color: Colors.white,
      elevation: 7,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // الصورة
          ClipRRect(
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(15),
            ),
            child: Image.asset(
              model.icon!,

              height: MediaQuery.of(context).size.height * 0.1,
              // fit: BoxFit.cover,
            ),
          ),

          // الاسم تحت الصورة
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              model.name!,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.05,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
