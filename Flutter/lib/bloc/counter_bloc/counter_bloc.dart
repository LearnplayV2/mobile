import 'package:bloc/bloc.dart';
import 'package:learnplay/bloc/counter_bloc/counter_event.dart';
import 'package:learnplay/bloc/counter_bloc/counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {

  CounterBloc() : super(CounterState(count: 0)) {
    on<IncrementCounterEvent>(_increment);
  }

  void _increment(
    IncrementCounterEvent event,
    Emitter emit
  ) {
    emit(state.copyWith(count: state.count + 1));
  }

}