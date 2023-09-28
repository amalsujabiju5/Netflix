import 'package:amazon/core/failures/main_failures.dart';
import 'package:amazon/domain/search/models/search_resp/search_resp.dart';
import 'package:dartz/dartz.dart';

abstract class SerachService {
  Future<Either<MainFailure, SearchResp>> searchMovies(
      {required String movieQuery});
}
