import 'package:dartz/dartz.dart';
import 'package:footballer/core/error/failure.dart';
import 'package:footballer/core/usecase/usecase.dart';
import 'package:footballer/features/football/domain/entities/match_entity.dart';
import 'package:footballer/features/football/domain/repositories/footballrepo.dart';

class GetTodayMatchesUseCase implements UseCase<List<Matches>, NoParams>{

  final FootBallRepo footBallRepo;

  GetTodayMatchesUseCase(this.footBallRepo);
  @override
  Future<Either<Failure, List<Matches>>> call(NoParams params) async {
    return await footBallRepo.getTodayMatches();
  }

}