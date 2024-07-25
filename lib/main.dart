import 'package:flutter/material.dart';
import 'package:my_blog/core/theme/theme.dart';
import 'package:my_blog/init_dependencies.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_blog/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:my_blog/features/auth/presentation/pages/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (_) => serviceLocator<AuthBloc>(),
      )
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Blog',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkThemeMode,
      home: const LoginPage(),
    );
  }
}
