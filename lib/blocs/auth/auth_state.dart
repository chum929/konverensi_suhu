part of 'auth_bloc.dart';

abstract class AuthState {}

/// State awal, belum diketahui status loginnya
class AuthInitial extends AuthState {}

/// Sedang memproses (login / daftar / logout)
class AuthLoading extends AuthState {}

/// User sudah terautentikasi
class AuthAuthenticated extends AuthState {
  final User user;
  AuthAuthenticated(this.user);
}

/// User belum login / sudah logout
class AuthUnauthenticated extends AuthState {}

/// Terjadi error saat login / daftar
class AuthError extends AuthState {
  final String message;
  AuthError(this.message);
}
