part of 'auth_bloc.dart';

abstract class AuthEvent {}

/// Dipanggil saat app pertama kali berjalan untuk memantau auth state
class AuthStarted extends AuthEvent {}

/// Dipanggil saat user berhasil login / sudah login
class AuthLoggedIn extends AuthEvent {
  final User user;
  AuthLoggedIn(this.user);
}

/// Dipanggil saat user logout
class AuthLoggedOut extends AuthEvent {}

/// Dipanggil dari LoginPage untuk proses login
class AuthLoginRequested extends AuthEvent {
  final String email;
  final String password;
  AuthLoginRequested({required this.email, required this.password});
}

/// Dipanggil dari LoginPage untuk proses daftar
class AuthRegisterRequested extends AuthEvent {
  final String email;
  final String password;
  AuthRegisterRequested({required this.email, required this.password});
}

/// Dipanggil dari halaman utama untuk logout
class AuthSignOutRequested extends AuthEvent {}
