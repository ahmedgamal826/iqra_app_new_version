import 'package:flutter/material.dart';
import 'package:iqra_app_new_version_22/screens/home_page.dart';

class CloseDialogButton extends StatelessWidget {
  const CloseDialogButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.brown,
      ),
      onPressed: () {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => HomePageAppApp(
              suraJsonData: '',
            ),
          ),
          (route) => false, // Remove all previous routes
        );
      },
      child: const Text(
        'إغلاق',
        style: TextStyle(
          fontSize: 25,
          color: Colors.white,
        ),
      ),
    );
  }
}
