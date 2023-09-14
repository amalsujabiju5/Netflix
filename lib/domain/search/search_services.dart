import 'package:dartz/dartz.dart';
import 'package:netflix/domain/core/failures/main_failure.dart';
import 'package:netflix/domain/search/model/search_resp/search_resp.dart';

abstract class SearchService {
  //here there will be two thing either failure or response'

  Future<Either<MainFailure, SearchResp>> searchMovies({
    required String movieQuery,
  });
}
