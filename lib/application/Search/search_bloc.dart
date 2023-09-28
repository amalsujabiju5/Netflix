import 'package:amazon/domain/search/models/search_resp/search_resp.dart';
import 'package:amazon/domain/search/search_services.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SerachService _serachService;
  SearchBloc(this._serachService) : super(SearchState.initial()) {
    on<SearchMovieEvent>((event, emit) {
      //call searchMovie APi
      _serachService.searchMovies(movieQuery: event.movieQuery);

      //show to UI
    });
  }
}
