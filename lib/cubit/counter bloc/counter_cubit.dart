import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iqra_app_new_version_22/cubit/counter%20bloc/counter_tasbih_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CounterTasbihCubit extends Cubit<CounterTasbihCubitState> {
  CounterTasbihCubit() : super(CounterTasbihInitialState()) {
    loadCounter();
  }

  void incrementValue() {
    final newCounter = state.counterTasbih + 1;
    emit(IncrementCounterTasbihState(newCounter));
    saveCounter(newCounter);
  }

  void zeroValue() {
    emit(ZeroCounterTasbihState(0));
    saveCounter(0);
  }

  Future<void> saveCounter(int counter) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('counterTasbih', counter);
  }

  Future<void> loadCounter() async {
    final prefs = await SharedPreferences.getInstance();
    final counter = prefs.getInt('counterTasbih') ?? 0;
    emit(CounterTasbihCubitState(counterTasbih: counter));
  }
}
