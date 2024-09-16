import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iqra_app_new_version_22/cubit/stories%20bloc/stories_cubit.dart';
import 'package:iqra_app_new_version_22/screens/Stories%20Screens/stories_details_screen.dart';
import 'package:iqra_app_new_version_22/screens/Stories%20Screens/stories_screen.dart';

class StoriesParentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StoriesCubit()..loadSectionStoriesDetails(1),
      child: Scaffold(
        body: Navigator(
          onGenerateRoute: (settings) {
            switch (settings.name) {
              case '/home':
                return MaterialPageRoute(
                  builder: (context) => StoriesScreen(),
                );
              case '/details':
                final args = settings.arguments as Map<String, dynamic>;
                return MaterialPageRoute(
                  builder: (context) => StoriesDetailsScreen(
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
