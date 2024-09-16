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
    child: Container(
      margin: const EdgeInsets.only(top: 12.0),
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
              style: const TextStyle(
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
