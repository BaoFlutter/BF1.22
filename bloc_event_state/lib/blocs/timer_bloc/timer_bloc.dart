import 'dart:async';
import 'package:bloc_event_state/ticker.dart';
import 'timer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TimerBloc extends Bloc<TimerEvent, TimerState> {
  static int _initDuration = 60 ;
  final Ticker _ticker;

  StreamSubscription<int>? _timerSubscription;

  TimerBloc({required Ticker ticker}) :
        _ticker = ticker,
        super(InitialState(_initDuration)){
    on<StartEvent>(_onStarted);
    on<RunEvent>(_onRun);
    on<PauseEvent>(_onPaused);
    on<ResumeEvent>(_onResume);
    on<ResetEvent>(_onReset);
  }

  // Với StartEvent
  void _onStarted(StartEvent event, Emitter<TimerState> emit){
    emit(RunningState(event.duration));
    _timerSubscription?.cancel();
    _timerSubscription = _ticker.tick(ticks: event.duration).listen((duration) => add(RunEvent(duration)));
  }

  // RunEvent
  void _onRun(RunEvent event, Emitter<TimerState> emit)
  {
    emit(
        event.duration > 0 ?
        RunningState(event.duration):
        CompletedState()
    );
  }
  // Pause Event
  void _onPaused(PauseEvent event, Emitter<TimerState> emit)
  {
    if(state is RunningState){
      _timerSubscription?.pause();
      emit(PauseState(state.duration));
    }

  }

  //Resume Event
  void _onResume(ResumeEvent event, Emitter<TimerState> emit)
  {
    if(state is PauseState){
      _timerSubscription?.resume();
      emit(RunningState(state.duration));
    }
  }

  // Reset Event
  void _onReset(ResetEvent event , Emitter<TimerState> emit){
    _timerSubscription?.cancel();
    emit(InitialState(_initDuration));

  }

  @override
  Future<void> close() {
    // TODO: implement close
    _timerSubscription?.cancel();
    return super.close();

  }





}