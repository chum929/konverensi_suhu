import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'blocs/auth/auth_bloc.dart';
import 'firebase_options.dart';
import 'pages/konversi_suhu_page.dart';
import 'pages/login_page.dart';
import 'providers/suhu_provider.dart';
import 'services/auth_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // Provider untuk konversi suhu
        ChangeNotifierProvider(create: (_) => SuhuProvider()),

        // BLoC untuk autentikasi Firebase
        BlocProvider(
          create: (_) => AuthBloc(authService: AuthService())
            ..add(AuthStarted()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Konversi Suhu',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
          useMaterial3: true,
        ),
        home: const AuthWrapper(),
      ),
    );
  }
}

/// Widget yang memantau AuthState dan menentukan halaman mana yang ditampilkan
class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthAuthenticated) {
          return KonversiSuhuPage();
        }
        // AuthInitial, AuthUnauthenticated, AuthError → tampilkan LoginPage
        return const LoginPage();
      },
    );
  }
}
