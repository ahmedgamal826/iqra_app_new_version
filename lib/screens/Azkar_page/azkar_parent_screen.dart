import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iqra_app_new_version_22/cubit/azkar%20bloc/azkar_cubit.dart';
import 'package:iqra_app_new_version_22/screens/Azkar_page/azkar_screen.dart';
import 'package:iqra_app_new_version_22/screens/Azkar_page/section_azkar_detail_screen.dart';

class AzkarParentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AzkarCubit()..loadSectionDetails(1),
      child: Scaffold(
        body: Navigator(
          onGenerateRoute: (settings) {
            switch (settings.name) {
              case '/home':
                return MaterialPageRoute(
                  builder: (context) => AzkarHomePage(),
                );
              case '/details':
                final args = settings.arguments as Map<String, dynamic>;
                return MaterialPageRoute(
                  builder: (context) => SectionAzkarDetailScreen(
                    id: args['id'],
                    title: args['title'],
                  ),
                );
              default:
                return null;
            }
          },
        ),
      ),
    );
  }
}
