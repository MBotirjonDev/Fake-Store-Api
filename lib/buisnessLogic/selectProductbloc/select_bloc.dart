import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onlineshop/buisnessLogic/selectProductbloc/select_event.dart';
import 'package:onlineshop/buisnessLogic/selectProductbloc/select_state.dart';
import 'package:onlineshop/models/select_product_model.dart';
import 'package:onlineshop/repositories/select_product_repository.dart';

class SelectBloc extends Bloc<SelectEvent, SelectState> {
  SelectBloc() : super(SelectInitial()) {
    on<SelectEvent>((event, emit) async {
      try {
        emit(SelectLoading());
        print("ishladi");

        final getSelect = await SelectProRepository().selectProFetch();
        print(getSelect);

        print("ishladi");
        emit(SelectLoaded(selsectPro: getSelect));
      } catch (e) {
        print("Xato Bloc");
        throw Exception(e);
      }
    });
  }
}

// class SelectBloc extends Bloc<SelectEvent, SelectState> {
//   SelectBloc() : super(SelectInitial()) {
//     on<SelectEvent>((event, emit) async {
//       try {
//         emit(SelectLoading());
//         final getSelect = await SelectProRepository().selectProFetch();
//         emit(SelectLoaded(selsectPro: getSelect));
//         print("ishladi");
//       } catch (e, stackTrace) {
//         print("Xato Bloc: $e");
        // emit(SelectError(errorMessage: "Xatolik yuz berdi: $e"));
//       }
//     });
//   }
// }
