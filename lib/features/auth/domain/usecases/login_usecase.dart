import 'package:dartz/dartz.dart';
import 'package:footballer/core/error/failure.dart';
import 'package:footballer/core/usecase/usecase.dart';
import 'package:footballer/features/auth/domain/entity/user_entity.dart';
import 'package:footballer/features/auth/domain/repositories/user_repo.dart';

class LoginUseCase implements UseCase<UserEntity,LoginUseCaseParams>{

  final UserRepo userRepo;

  LoginUseCase({required this.userRepo});

  @override
  Future<Either<Failure, UserEntity>> call(LoginUseCaseParams params)  async {
    return await userRepo.loginEmail(email: params.email, password: params.password);
  }

}

class LoginUseCaseParams{
  final String email;
  final String password;

  LoginUseCaseParams({required this.email, required this.password});
}