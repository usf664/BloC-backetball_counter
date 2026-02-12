part of 'counter_cubit.dart';

abstract class CounterState {
  final int counterA;
  final int counterB;

  const CounterState({required this.counterA, required this.counterB});
}

class CounterInitial extends CounterState {
  const CounterInitial({super.counterA = 0, super.counterB = 0});
}

class CounterIncrementState extends CounterState {
  const CounterIncrementState({
    required super.counterA,
    required super.counterB,
  });
}
