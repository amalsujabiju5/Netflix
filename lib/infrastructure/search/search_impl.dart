import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/domain/search/model/search_resp/search_resp.dart';
import 'package:netflix/domain/core/failures/main_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:netflix/domain/search/search_services.dart';
import 'dart:developer';

import '../../domain/core/api_end_points.dart';

@LazySingleton(as: SearchService)
class SearchImpl implements SearchService {
  @override
  Future<Either<MainFailure, SearchResp>> searchMovies(
      {required String movieQuery}) async {
    try {
      final response =
          await Dio(BaseOptions()).get(ApiEndPoints.search, queryParameters: {
        'query': movieQuery,
      });

//add toString when using log if the expectd reult is not coming
      log(response.data.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = SearchResp.fromJson(response.data);
        return Right(result);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      return const Left(MainFailure.clientFailure());
    }
  }
}
