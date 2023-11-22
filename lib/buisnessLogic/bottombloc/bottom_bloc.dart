import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onlineshop/buisnessLogic/bottombloc/bottom_event.dart';
import 'package:onlineshop/buisnessLogic/bottombloc/bottom_state.dart';

class BottomBloc extends Bloc<BottomEvent, BottomState> {
  BottomBloc() : super(const BottomInitial(tabIndex: 0)) {
    on<BottomEvent>((event, emit) {
      if (event is TabChange) {
        print(event.tabIndex);
        emit(BottomInitial(tabIndex: event.tabIndex));
      }
    });
  }
}
