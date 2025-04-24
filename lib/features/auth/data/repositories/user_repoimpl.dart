import 'package:dartz/dartz.dart';
import 'package:footballer/core/error/failure.dart';
import 'package:footballer/core/error/server_exception.dart';
import 'package:footballer/features/auth/data/remote/authremote.dart';
import 'package:footballer/features/auth/domain/entity/user_entity.dart';
import 'package:footballer/features/auth/domain/repositories/user_repo.dart';

class UserRepoImpl implements UserRepo{

  final AuthRemote authRemote;

  UserRepoImpl({required this.authRemote});


  @override
  Future<Either<Failure, UserEntity>> loginEmail({required String email, required String password}) async {
    try {
      final res = await authRemote.loginEmail(email: email, password: password);
      return right(res);
    }  on ServerException catch (e){
       throw(left(Failure(e.message)));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> registerEmail({required String username, required String email, required String password}) async {
    try {
      final res = await authRemote.registerEmail(username: username, email: email, password: password);
      return right(res);
    }  on ServerException catch (e){
       throw(left(Failure(e.message)));
    }
  }

}