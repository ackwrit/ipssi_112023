import 'package:permission_handler/permission_handler.dart';

class MyPermissionPhoto {
  init() async {
    PermissionStatus status = await Permission.photos.status;
  }
}
