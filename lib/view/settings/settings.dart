
import 'package:flutter/material.dart';

import '../../services/componets/componets.dart';
import '../../services/local/cache_helper.dart';
import '../auth/logIn/login.dart';

class ShopSettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        CacheHelper.removeData(
          key: 'userToken',
        ).then((value) {
          navigateTo(
            context: context,
            widget: LoginScreen(),
          );
        });
      },
      child: Text(
        'logout',
      ),
    );
  }
}