import 'package:flutter/material.dart';

Widget undefinedRoute() => const Scaffold(
      body: Center(
        child: Text("Undefined Route"),
      ),
    );

Widget defaultFormField(
        {required TextEditingController controller,
        required String label,
        required Function validate,
        bool isPassword = false}) =>
    TextFormField(
      controller: controller,
      validator: (value) {
        return validate(value);
      },
      obscureText: isPassword,
      decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: label,
          border: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(12))),
    );
