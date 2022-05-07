part of 'guide_bloc.dart';

@immutable
// abstract class GuideState {}

enum GuideStatus { initial, success, error }

class GuideState extends Equatable {

  const GuideState({
    this.status = GuideStatus.initial,
    this.guides = const <Guide>[],
    this.allDataReceived = false,
  });

  final GuideStatus status;
  final List<Guide> guides;
  final bool allDataReceived;

  GuideState copyWith({ GuideStatus? status, List<Guide>? guides, bool? allDataReceived}) {
    return GuideState(
      status: status ?? this.status,
      guides: guides ?? this.guides,
      allDataReceived: allDataReceived ?? this.allDataReceived,
    );
  }

  @override
  String toString() {
    return '''PostState { status: $status, hasReachedMax: $allDataReceived, posts: ${guides.length} }''';
  }

  @override
  List<Object> get props => [status, guides, allDataReceived];
}
