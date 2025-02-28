import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iqra_app_new_version_22/cubit/stories%20bloc/stories_cubit.dart';
import 'package:iqra_app_new_version_22/models/stories_model.dart';
import 'package:iqra_app_new_version_22/screens/Stories%20Screens/stories_details_screen.dart';

Widget buildSectionStoriesItem(
    {required StoriesModel model, required BuildContext context}) {
  final storiesCubit = BlocProvider.of<StoriesCubit>(context);

  double screenHeight = MediaQuery.of(context).size.height;

  return InkWell(
    onTap: () {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => BlocProvider.value(
                value: storiesCubit,
                child: StoriesDetailsScreen(
                  id: model.id!,
                  title: model.name!,
                ),
              )));
    },
    child: Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 12.0),
          width: double.infinity,
          height: screenHeight * 0.11,
          decoration: BoxDecoration(
            color: model.id! % 2 == 0 ? Colors.green : Colors.brown.shade400,
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: AssetImage('${model.icon}'),
              fit: BoxFit.cover,
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
        const SizedBox(
          height: 10,
        )
      ],
    ),
  );
}
