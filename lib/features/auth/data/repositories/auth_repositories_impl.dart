import 'package:fpdart/fpdart.dart';
import 'package:my_blog/core/error/exceptions.dart';
import 'package:my_blog/core/error/failures.dart';
import 'package:my_blog/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:my_blog/features/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;
  const AuthRepositoryImpl(this.authRemoteDataSource);

  @override
  Future<Either<Failure, String>> loginWithEmailPassword({
    required String email,
    required String password,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> signupWithEmailPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final userId = await authRemoteDataSource.signupWithEmailPassword(
        name: name,
        email: email,
        password: password,
      );
      return right(userId);
    } on ServerExceptions catch (e) {
      return left(Failure(e.message));
    }
  }
}
