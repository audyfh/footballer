import 'package:bloc/bloc.dart';
import 'package:footballer/core/usecase/usecase.dart';
import 'package:footballer/features/football/domain/entities/match_entity.dart';
import 'package:footballer/features/football/domain/usecases/get_todaymatches_usecase.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {

  final GetTodayMatchesUseCase _getTodayMatchesUseCase;
  HomeBloc({
    required GetTodayMatchesUseCase getTodayMatchesUseCase,
  }) : _getTodayMatchesUseCase = getTodayMatchesUseCase,
  super(HomeInitial()) {

    on<GetTodayMatches>((event, emit) async {
      emit(HomeLoading());
      final res = await _getTodayMatchesUseCase(NoParams());
      res.fold(
        (l) => emit(HomeError(l.message)),
        (r) => emit(HomeSuccess(r))
      );
    });
  }
}
