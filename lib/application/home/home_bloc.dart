import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/domain/core/failures/main_failure.dart';
import 'package:netflix/domain/hot_and_new_resp/hot_and_new_service.dart';

import '../../domain/hot_and_new_resp/model/hot_and_new_resp.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HotAndNewService _homeService;
  HomeBloc(this._homeService) : super(HomeState.initial()) {
    //getting homeScreen Data
    on<GetHomeScreenData>((event, emit) async {
      //send loading to UI
      emit(state.copyWith(isError: false, isLoading: true));

      //get data

      final _movieResult = await _homeService.getHotAndNewMovieData();
      final _tvResult = await _homeService.getHotAndNewTvData();

      //transform data
      final _state1 = _movieResult.fold((MainFailure failure) {
        return HomeState(
          stateid: DateTime.now().millisecondsSinceEpoch.toString(),
          pastYearMovieList: [],
          trendingMovieList: [],
          tenseDramaMovieList: [],
          southIndianMovieList: [],
          trendingTvList: [],
          isError: true,
          isLoading: false,
        );
      }, (HotAndNewResp resp) {
        //this is used because to shuffle the result
        final pastYear = resp.results;
        final trending = resp.results;
        final dramas = resp.results;
        final southIndian = resp.results;

        pastYear.shuffle;
        trending.shuffle;
        dramas.shuffle;
        southIndian.shuffle;

        return HomeState(
            stateid: DateTime.now().millisecondsSinceEpoch.toString(),
            pastYearMovieList: pastYear,
            trendingMovieList: trending,
            tenseDramaMovieList: dramas,
            southIndianMovieList: southIndian,
            trendingTvList: state.trendingTvList,
            isError: false,
            isLoading: false);
      });

      //send to UI
      emit(_state1);

      final _state2 = _tvResult.fold((MainFailure failure) {
        return HomeState(
          stateid: DateTime.now().millisecondsSinceEpoch.toString(),
          pastYearMovieList: [],
          trendingMovieList: [],
          tenseDramaMovieList: [],
          southIndianMovieList: [],
          trendingTvList: [],
          isError: true,
          isLoading: false,
        );
        ////continue  with 18 min
      }, (HotAndNewResp resp) {
        final top10List = resp.results;

        return HomeState(
            stateid: DateTime.now().millisecondsSinceEpoch.toString(),
            pastYearMovieList: state.pastYearMovieList,
            trendingMovieList: top10List,
            tenseDramaMovieList: state.tenseDramaMovieList,
            southIndianMovieList: state.southIndianMovieList,
            trendingTvList: top10List,
            isError: false,
            isLoading: false);
      });
      emit(_state2);
    });
  }
}
