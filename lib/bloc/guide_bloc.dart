import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:test_flutter_project/models/guide.dart';
import 'package:stream_transform/stream_transform.dart';


part 'guide_event.dart';
part 'guide_state.dart';

const _guideLimit = 15;

class GuideBloc extends Bloc<GuideEvent, GuideState> {
  GuideBloc({required this.httpClient}) : super(GuideState()) {
    on<GuideLoader>(_onGuideLoader);
  }

  final http.Client httpClient;

  Future<void> _onGuideLoader(GuideLoader event, Emitter<GuideState> emit) async {
    if (state.allDataReceived) return;
    try {
      if (state.status == GuideStatus.initial) {

        final guides = await _getGuides();
        return emit(state.copyWith(
          status: GuideStatus.success,
          guides: guides,
          allDataReceived: false,
        ));
      }
      final guides = await _getGuides(state.guides.length);
      emit(guides.isEmpty ? state.copyWith(allDataReceived: true)  : state.copyWith(
        status: GuideStatus.success,
        guides: List.of(state.guides)..addAll(guides),
        allDataReceived: false,
      ));
    } catch (_er) {
      print('EERRROR ${_er.toString()}');
      emit(state.copyWith(status: GuideStatus.error));
    }
  }

  Future<List<Guide>> _getGuides([int startIndex = 0]) async {
    print('2ssss');
    List<Guide> guidesList = [];
    print('Full url https://guidebook.com/service/v2/upcomingGuides?limit=$_guideLimit');
    final response =  await http.get(
        Uri.parse('https://guidebook.com/service/v2/upcomingGuides?limit=$_guideLimit'),
    );
    if (response.statusCode == 200) {
      final body = json.decode(response.body.toString())['data'];
      for (Map i in body) {
        guidesList.add(Guide.fromJson(i));
      }
      return guidesList;
    }
    throw Exception('error get guides');
  }
}
