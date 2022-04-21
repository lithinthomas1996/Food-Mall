import 'package:equatable/equatable.dart';

abstract class TimerState extends Equatable {
  @override
  List<Object> get props => [];
}
class TimerInitial extends TimerState {}
class TimerRefreshState extends TimerState {}

class TimerUpdateState extends TimerState {
  final int? seconds;
  TimerUpdateState({required this.seconds});
}
class TimerExpireState extends TimerState {}