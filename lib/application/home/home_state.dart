part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    required String stateid,
    required List<HotAndNewData> pastYearMovieList,
    required List<HotAndNewData> trendingMovieList,
    required List<HotAndNewData> tenseDramaMovieList,
    required List<HotAndNewData> southIndianMovieList,
    required List<HotAndNewData> trendingTvList,
    required bool isError,
    required bool isLoading,
  }) = _Initial;

  factory HomeState.initial() => HomeState(
      stateid: '0',
      pastYearMovieList: [],
      trendingMovieList: [],
      tenseDramaMovieList: [],
      southIndianMovieList: [],
      trendingTvList: [],
      isError: false,
      isLoading: false);
}
