import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iqra_app_new_version_22/cubit/ahades%20bloc/ahades_cubit.dart';
import 'package:iqra_app_new_version_22/screens/More%20Screens/Ahades_page/home_page_ahades.dart';
import 'package:iqra_app_new_version_22/screens/More%20Screens/Ahades_page/page_ahades_details.dart';

class AhadesParentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AhadesCubit()..loadSectionAhadesDetails(1),
      child: Scaffold(
        body: Navigator(
          onGenerateRoute: (settings) {
            switch (settings.name) {
              case '/home':
                return MaterialPageRoute(
                  builder: (context) => HomePageAhades(),
                );
              case '/details':
                final args = settings.arguments as Map<String, dynamic>;
                return MaterialPageRoute(
                  builder: (context) => PageAhadesDetails(
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
