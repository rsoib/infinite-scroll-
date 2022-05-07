import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:test_flutter_project/models/guide.dart';

part 'guide_event.dart';
part 'guide_state.dart';

class GuideBloc extends Bloc<GuideEvent, GuideState> {
  GuideBloc({required this.httpClient}) : super(GuideState()) {
    on<GuideLoader>(_onGuideLoader);
  }

  final http.Client httpClient;

  Future<void> _onGuideLoader(GuideLoader event, Emitter<GuideState> emit) async {
    if (state.allDataReceived) return;
    try {
      if (state.status == GuideStatus.initial) {
        final guides = await _fetchPosts();
        return emit(state.copyWith(
          status: GuideStatus.success,
          guides: guides,
          allDataReceived: false,
        ));
      }
      final guides = await _fetchPosts(state.guides.length);
      emit(guides.isEmpty ? state.copyWith(allDataReceived: true)  : state.copyWith(
        status: GuideStatus.success,
        guides: List.of(state.guides)..addAll(guides),
        allDataReceived: false,
      ));
    } catch (_) {
      emit(state.copyWith(status: GuideStatus.error));
    }
  }
}
