import 'package:dartz/dartz.dart';
import 'package:footballer/core/error/failure.dart';

abstract interface class UseCase<SuccesType, Params> {
  Future<Either<Failure,SuccesType>> call(Params params);
}

class NoParams{

}