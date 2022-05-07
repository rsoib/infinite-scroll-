part of 'guide_bloc.dart';

@immutable
abstract class GuideEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GuideLoader extends GuideEvent {}
