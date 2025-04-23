import 'package:dartz/dartz.dart';
import 'package:footballer/core/error/failure.dart';
import 'package:footballer/features/football/domain/entities/match_entity.dart';

abstract interface class FootBallRepo{

  Future<Either<Failure,List<Matches>>> getTodayMatches();
}