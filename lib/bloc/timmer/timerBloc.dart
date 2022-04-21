

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_test_appp/bloc/timmer/timerEvent.dart';
import 'package:my_test_appp/bloc/timmer/timerState.dart';


class TimerBloc extends Bloc<TimerEvent, TimerState> {
  TimerBloc() : super(TimerInitial()){
    on<TimerUpdate>((event, emit) => emit(TimerUpdateState(seconds: event.seconds)));
    on<TimerRefreshEvent>((event, emit) => emit(TimerRefreshState()));
  }
}