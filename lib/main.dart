import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/app.dart';
import 'package:ecommerce_app/core/utils/observer.dart';
import 'package:flutter/material.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(const EcommerceApp());
}
