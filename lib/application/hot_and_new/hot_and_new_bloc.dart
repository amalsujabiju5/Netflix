import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/domain/core/failures/main_failure.dart';
import 'package:netflix/domain/hot_and_new_resp/hot_and_new_service.dart';

import '../../domain/hot_and_new_resp/model/hot_and_new_resp.dart';

part 'hot_and_new_event.dart';
part 'hot_and_new_state.dart';
part 'hot_and_new_bloc.freezed.dart';

@injectable
class HotAndNewBloc extends Bloc<HotAndNewEvent, HotAndNewState> {
  final HotAndNewService _hotAndNewService;
  HotAndNewBloc(this._hotAndNewService) : super(HotAndNewState.initial()) {
    //data for the coming soon

    /**
     //get hot and new movie data
     */
    on<LoadDataInComingSoon>((event, emit) async {
//sending loading to UI
      emit(const HotAndNewState(
          comingSoonList: [],
          everyOneIsWatchingList: [],
          isLoading: true,
          hasError: false));

//get data from remote
      final _result = await _hotAndNewService.getHotAndNewMovieData();

//data to state
      final newState = _result.fold((MainFailure f) {
        return const HotAndNewState(
            comingSoonList: [],
            everyOneIsWatchingList: [],
            isLoading: false,
            hasError: true);
      }, (HotAndNewResp r) {
        return HotAndNewState(
            comingSoonList: r.results,
            everyOneIsWatchingList: state.everyOneIsWatchingList,
            isLoading: false,
            hasError: false);
      });

      //showing to the UI
      emit(newState);
    });

    /**
     //get hot and new tv data
     */
    on<LoadDataInEveryoneIsWatching>((event, emit) {});
  }
}
