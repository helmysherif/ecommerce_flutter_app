import 'package:ecommerce_app/core/error/failures.dart';
import 'package:ecommerce_app/features/login/domain/entities/login_entity.dart';

abstract class LoginStates {}

class LoginInitState extends LoginStates {}

class LoginSuccessState extends LoginStates {
  LoginEntity loginEntity;

  LoginSuccessState(this.loginEntity);
}

class LoginLoadingState extends LoginStates {}

class LoginErrorState extends LoginStates {
  Failures failures;

  LoginErrorState(this.failures);
}
