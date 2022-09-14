part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class SignOutRequested extends AuthEvent {}

class GoogleSignInRequested extends AuthEvent {}
