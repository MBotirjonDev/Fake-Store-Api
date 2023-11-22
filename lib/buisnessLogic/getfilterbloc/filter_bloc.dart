import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onlineshop/buisnessLogic/getfilterbloc/filter_event.dart';
import 'package:onlineshop/buisnessLogic/getfilterbloc/filter_state.dart';
import 'package:onlineshop/repositories/get_category_model.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc() : super(CategoryInitial()) {
    on((event, emit) async {
      try {
        emit(CategoryInitial());
        emit(CategoryLoading());
        final category = await GetCategory().getCategory();
        emit(CategoryLoaded(getData: category));
      } catch (e) {
        print("Xato bloc");
      }
    });
  }
}
