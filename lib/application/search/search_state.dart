part of 'search_bloc.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState(

      //list of search result

      {
    required List<SearchResultData> searchResultList,

    //this is for the idle list
    required List<Downloads> idleList,
    required bool isLoading,
    required bool isError,
  }) = _SearchState;

  factory SearchState.initial() => const SearchState(
        searchResultList: [],
        idleList: [],
        isLoading: false,
        isError: false,
      );
}
