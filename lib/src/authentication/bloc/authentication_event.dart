part of 'authentication_bloc.dart';

sealed class AuthenticationEvent {
  const AuthenticationEvent();
}

final class AuthenticationSubscriptionRequested extends AuthenticationEvent {
  @override
  String toString() => 'AuthenticationSubscriptionRequested';
}

final class AuthenticationLogoutPressed extends AuthenticationEvent {
  @override
  String toString() => 'AuthenticationLogoutPressed';
}
