part of 'fast_laugh_bloc.dart';

@freezed
class FastLaughState with _$FastLaughState {
  //the things we needed in the fast Laugh page
  const factory FastLaughState({
    required List<Downloads> videoList,
    required bool isLoading,
    required bool isError,
  }) = _Initial;

//the value in the initial stage
  factory FastLaughState.initial() =>
      const FastLaughState(videoList: [], isLoading: true, isError: false);
}
