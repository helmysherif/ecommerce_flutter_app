import 'package:flutter/material.dart';

import '../../../login/domain/entities/login_entity.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen(this.loginEntity, {super.key});

  LoginEntity loginEntity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("hello ${loginEntity.user.name}"),
      ),
    );
  }
}
