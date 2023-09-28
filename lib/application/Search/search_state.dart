part of 'search_bloc.dart';

class SearchState {
  final List<SearchResultData> searchResultList;

  final bool isLoading;
  final bool isError;

  SearchState({
    required this.searchResultList,
    required this.isLoading,
    required this.isError,
  });

  factory SearchState.initial() {
    return SearchState(
      searchResultList: [],
      isLoading: false,
      isError: false,
    );
  }
}
