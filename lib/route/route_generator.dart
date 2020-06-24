import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_password/module/generate_password/features/generate_password/page/generate_password_page.dart';
import 'package:my_password/module/home/features/home/page/home_page.dart';
import 'package:my_password/module/my_passwords/features/my_passwords_list/page/my_passwords_list_page.dart';
import 'package:my_password/route/error_page_not_found.dart';
import 'package:my_password/route/route_consts.dart';

class RouteGenerator {
  Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case HomeRoute:
        return MaterialPageRoute(builder: (context) => HomePage());
        break;
      case MyPasswordRoute:
        return MaterialPageRoute(builder: (context) => MyPasswordListPage());
        break;
      case GeneratePasswordRoute:
        return MaterialPageRoute(builder: (context) => GeneratePasswordPage());
        break;
      default:
        return MaterialPageRoute(builder: (context) => ErrorPageNotFound());
    }
  }
}
