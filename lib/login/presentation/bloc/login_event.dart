part of 'login_bloc.dart';

/*
 * Это простой абстрактный класс, который можно расширить для других событий.
 */
@immutable
abstract class LoginEvent {
  const LoginEvent();
}

class LoginButtonTappedEvent extends LoginEvent {}

class ShowSnackBarButtonTappedEvent extends LoginEvent {}
