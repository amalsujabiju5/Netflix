import 'package:amazon/domain/core/api_end_points.dart';
import 'package:amazon/domain/search/models/search_resp/search_resp.dart';
import 'package:amazon/core/failures/main_failures.dart';
import 'package:amazon/domain/search/search_services.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'dart:developer';

import 'package:injectable/injectable.dart';

@LazySingleton(as: SerachService)
class SearchImpl implements SerachService {
  @override
  Future<Either<MainFailure, SearchResp>> searchMovies(
      {required String movieQuery}) async {
    try {
      final Response response =
          await Dio(BaseOptions()).get(ApiEndPoints.search, queryParameters: {
        'query': movieQuery,
      });
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = SearchResp.fromJson(response.data);
        return Right(result);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      log(e.toString());
      return const Left(MainFailure.clientFailure());
    }
  }
}
