class CounterTasbihCubitState {
  final int counterTasbih;

  CounterTasbihCubitState({required this.counterTasbih});
}

class CounterTasbihInitialState extends CounterTasbihCubitState {
  CounterTasbihInitialState() : super(counterTasbih: 0);
}

class IncrementCounterTasbihState extends CounterTasbihCubitState {
  IncrementCounterTasbihState(int incrementValue)
      : super(counterTasbih: incrementValue);
}

class ZeroCounterTasbihState extends CounterTasbihCubitState {
  ZeroCounterTasbihState(int counter) : super(counterTasbih: counter);
}
