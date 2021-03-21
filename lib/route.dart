import 'package:flutter/cupertino.dart';
import 'package:http_request/screen/gallery_screen.dart';
import 'package:http_request/screen/home_screen.dart';


class RouteGenerator {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/gallery':
        return CupertinoPageRoute(
          builder: (context) => Galleryscreen(),
        );
        break;
      
      default:
        return CupertinoPageRoute(
          builder: (context) => Homescreen(),
        );
    }
  }
}