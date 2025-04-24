import 'package:dartz/dartz.dart';
import 'package:footballer/core/error/failure.dart';
import 'package:footballer/features/auth/domain/entity/user_entity.dart';

abstract interface class UserRepo {

  Future<Either<Failure, UserEntity>> loginEmail({
    required String email, required String password
  });
  Future<Either<Failure, UserEntity>> registerEmail(
    {
      required String username, required String email, required String password
    }
  );
}
