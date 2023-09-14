import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:netflix/domain/core/failures/main_failure.dart';
import 'package:netflix/domain/downloads/i_downloads_repos.dart';
import 'package:netflix/domain/downloads/models/downloads.dart';
part 'downloads_event.dart';
part 'downloads_state.dart';

part 'downloads_bloc.freezed.dart';

@injectable
class DownloadsBloc extends Bloc<DownloadsEvent, DownloadsState> {
  final IDownloadsRepo _downloadsRepo;

  DownloadsBloc(this._downloadsRepo) : super(DownloadsState.initial()) {
    on<_GetDownloadImage>((event, emit) async {
      //emiting the api call
      emit(
        state.copyWith(
          isLoading: true,
          downloadsFailureOrSuccessOption: none(),
        ),
      );
      //fetching the api
      final Either<MainFailure, List<Downloads>> downlaodsOption =
          await _downloadsRepo.getDownloadImages();
      log(downlaodsOption.toString());

      emit(
        downlaodsOption.fold(
          (failure) => state.copyWith(
            isLoading: false,
            downloadsFailureOrSuccessOption: some(
              left(failure),
            ),
          ),
          (success) => state.copyWith(
            isLoading: false,
            downloads: success,
            downloadsFailureOrSuccessOption: some(
              Right(success),
            ),
          ),
        ),
      );
    });
  }
}
