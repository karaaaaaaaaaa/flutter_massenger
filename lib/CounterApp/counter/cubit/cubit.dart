import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messanger/CounterApp/counter/cubit/states.dart';

class CubitCounter extends Cubit<CounterStates> {
  CubitCounter(initialState) : super(CounterinitalStates());
  static CubitCounter get(context) => BlocProvider.of(context);
  int count = 0;
  void plus() {
    count++;
    emit(CounterPlass_States(count));
  }
    void minis() {
    count--;
    emit(CounterMINIS_States());
  }
}

// class CubitCounter extends Cubit<CounterStates>{
//   CubitCounter(initialState) : super(CounterInitialState());
//   static CubitCounter get(context)=>BlocProvider.of(context);
//   int counter = 0;
//   void minus(){
//     counter--;
//     emit(CounterMinusState(counter));
//   }
//   void plus(){
//     counter++;
//     emit(CounterPlusState(counter));
//   }
// }