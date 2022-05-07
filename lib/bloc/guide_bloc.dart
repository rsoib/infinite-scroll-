import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'guide_event.dart';
part 'guide_state.dart';

class GuideBloc extends Bloc<GuideEvent, GuideState> {
  GuideBloc() : super(GuideInitial()) {
    on<GuideEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
