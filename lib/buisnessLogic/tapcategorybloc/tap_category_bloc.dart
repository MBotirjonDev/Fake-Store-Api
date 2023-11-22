import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:onlineshop/buisnessLogic/tapcategorybloc/tap_category_event.dart';
import 'package:onlineshop/buisnessLogic/tapcategorybloc/tap_category_state.dart';
import 'package:onlineshop/repositories/get_filter_repo.dart';
import 'package:onlineshop/screens/filter/filter_page.dart';

class TapFilterBloc extends Bloc<TapFilterEvent, TapFilterState> {
  TapFilterBloc() : super(TapFilterInitial()) {
    on(
      (event, emit) async {
        try {
          emit(TapFilterLoading());
          final filterGet = await FilterCategoryRepository().getFilter();
          emit(TapFilterLoaded(getFilter: filterGet));
          print("ishladi");
        } catch (e) {
          print("Xato bloc");
        }
      },
    );
  }
}
