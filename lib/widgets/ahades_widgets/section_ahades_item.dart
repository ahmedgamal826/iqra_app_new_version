import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iqra_app_new_version_22/cubit/ahades%20bloc/ahades_cubit.dart';
import 'package:iqra_app_new_version_22/models/ahades_model.dart';
import 'package:iqra_app_new_version_22/screens/More%20Screens/Ahades_page/page_ahades_details.dart';

Widget buildSectionAhadesItem(
    {required AhadesModel model, required BuildContext context}) {
  final ahadesCubit = BlocProvider.of<AhadesCubit>(context);

  return InkWell(
    onTap: () {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => BlocProvider.value(
                value: ahadesCubit,
                child: PageAhadesDetails(
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
        color: Colors.brown,
        border: Border.all(color: Colors.black, width: 1.5),
        // color: model.id! % 2 == 0 ? Colors.brown : Colors.brown.shade400,
        borderRadius: BorderRadius.circular(7),
      ),
      child: Center(
        child: Text(
          textAlign: TextAlign.center,
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
