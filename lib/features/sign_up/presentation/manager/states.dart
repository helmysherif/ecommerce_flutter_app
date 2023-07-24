import 'package:ecommerce_app/core/error/failures.dart';
import 'package:ecommerce_app/features/sign_up/domain/entities/SignUpEntity.dart';

abstract class SignUpStates {}

class SignUpInitState extends SignUpStates {}

class SignUpSuccessState extends SignUpStates {
  SignUpEntity signUpEntity;

  SignUpSuccessState(this.signUpEntity);
}

class SignUpLoadingState extends SignUpStates {}

class SignUpErrorState extends SignUpStates {
  Failures failures;

  SignUpErrorState(this.failures);
}
