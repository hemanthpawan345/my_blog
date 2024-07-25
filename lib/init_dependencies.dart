import 'package:get_it/get_it.dart';
import 'package:my_blog/core/secrets/app_secrets.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:my_blog/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:my_blog/features/auth/domain/usecases/user_sign_up.dart';
import 'package:my_blog/features/auth/domain/repository/auth_repository.dart';
import 'package:my_blog/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:my_blog/features/auth/data/repositories/auth_repositories_impl.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  _initAuth();
  final supabase = await Supabase.initialize(
    url: AppSecrets.supabaseUrl,
    anonKey: AppSecrets.supabaseAnonKey,
  );
  serviceLocator.registerLazySingleton(() => supabase.client);
}

void _initAuth() {
  serviceLocator.registerFactory<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(
      serviceLocator<SupabaseClient>(),
    ),
  );

  serviceLocator.registerFactory<AuthRepository>(
    () => AuthRepositoryImpl(
      serviceLocator(),
    ),
  );

  serviceLocator.registerFactory(
    () => UserSignUp(
      serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton(
    () => AuthBloc(
      userSignUp: serviceLocator(),
    ),
  );
}
