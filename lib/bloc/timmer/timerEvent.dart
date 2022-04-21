import 'package:equatable/equatable.dart';

abstract class TimerEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetTimer extends TimerEvent {}

class TimerUpdate extends TimerEvent {
  final int seconds;
  TimerUpdate({required this.seconds});
}
class TimerExpire extends TimerEvent {}
class TimerRefreshEvent extends TimerEvent {}