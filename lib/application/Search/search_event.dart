part of 'search_bloc.dart';

abstract class SearchEvent {}

class SearchMovieEvent extends SearchEvent {
  final String movieQuery;
  SearchMovieEvent(this.movieQuery);
}
