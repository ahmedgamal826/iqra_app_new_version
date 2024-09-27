import 'package:flutter/material.dart';
import 'package:iqra_app_new_version_22/widgets/qiblah_widgets/qiblah_error.dart';
import 'package:iqra_app_new_version_22/widgets/qiblah_widgets/qiblah_permission.dart';
import 'package:permission_handler/permission_handler.dart';

class QiblahScreen extends StatefulWidget {
  const QiblahScreen({super.key});

  @override
  State<QiblahScreen> createState() => _QiblahScreenState();
}

class _QiblahScreenState extends State<QiblahScreen> {
  Future<bool> getPermission() async {
    if (await Permission.location.serviceStatus.isEnabled) {
      var status = await Permission.location.status;
      if (status.isGranted) {
        return true;
      } else {
        final result = await Permission.location.request();
        return result == PermissionStatus.granted;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: getPermission(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            backgroundColor: Colors.brown,
            body: Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            ),
          );
        } else if (snapshot.hasData && snapshot.data == true) {
          return QiblahPermission();
        } else {
          // In case the geographic location is not activated
          return const QiblahError();
        }
      },
    );
  }
}
