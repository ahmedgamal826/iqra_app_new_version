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
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7),
        ),
        child: Container(
          //  margin: const EdgeInsets.only(top: 12.0),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            //  border: Border.all(color: Colors.black, width: 1.5),
            borderRadius: BorderRadius.circular(7),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/prophet.png'),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    model.name!,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize:
                          MediaQuery.of(context).size.width * 0.05, // حجم متغير
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),
              ],
            ),
          ),
        ),
      ));
}
