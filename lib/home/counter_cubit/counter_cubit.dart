import 'package:basketball_counter/home/counter_cubit/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterInitial());

  void increment(String teamName, int increaseBy) {
    if (teamName == 'A') {
      emit(
        CounterIncrementState(
          counterA: state.counterA + increaseBy,
          counterB: state.counterB,
        ),
      );
    } else {
      emit(
        CounterIncrementState(
          counterA: state.counterA,
          counterB: state.counterB + increaseBy,
        ),
      );
    }
  }

  void reset() => emit(CounterInitial());
}
