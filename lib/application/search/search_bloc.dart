import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/domain/core/failures/main_failure.dart';
import 'package:netflix/domain/downloads/i_downloads_repos.dart';
import 'package:netflix/domain/downloads/models/downloads.dart';
import 'package:netflix/domain/search/model/search_resp/search_resp.dart';
import 'package:netflix/domain/search/search_services.dart';

part 'search_event.dart';
part 'search_state.dart';
part 'search_bloc.freezed.dart';

@injectable
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final IDownloadsRepo _downloadService;
  final SearchService _searchService;
  SearchBloc(this._downloadService, this._searchService)
      : super(SearchState.initial()) {
    //this is the for the idle state

    on<Initialize>((event, emit) async {
      if (state.idleList.isNotEmpty) {
        emit(SearchState(
          searchResultList: [],
          idleList: state.idleList,
          isLoading: false,
          isError: false,
        ));
        return;
      }
      //when the screen is loading the search results, idle list , error and is loading

      emit(const SearchState(
        searchResultList: [],
        idleList: [],
        isLoading: true,
        isError: false,
      ));

      // get trending when initialise
      final _result = await _downloadService.getDownloadImages();
      final _state = _result.fold(
        (MainFailure f) {
          //if it is the failure then emit will be
          return const SearchState(
            searchResultList: [],
            idleList: [],
            isLoading: false,
            isError: true,
          );
        },
        (List<Downloads> list) {
          //if there is no error then the state will be
          return SearchState(
            searchResultList: [],
            idleList: list,
            isLoading: false,
            isError: false,
          );
        },
      );

      //show the movie
      emit(_state);
    });

    on<SearchMovie>((event, emit) async {
      //call search movie
      log('Searching for ${event.movieQuery}');

//when the search screen is loading the error and all the details wil be  nothig
      emit(const SearchState(
        searchResultList: [],
        idleList: [],
        isLoading: true,
        isError: false,
      ));
      final _result =
          await _searchService.searchMovies(movieQuery: event.movieQuery);

      //folding the final state
      final _state = _result.fold((MainFailure f) {
        //if it is the failure then emit will be
        return const SearchState(
          searchResultList: [],
          idleList: [],
          isLoading: false,
          isError: true,
        );
      }, (SearchResp r) {
        return SearchState(
          searchResultList: r.results,
          idleList: [],
          isLoading: false,
          isError: false,
        );
      });
      //show the movie in UI
      emit(_state);
    });
  }
}
