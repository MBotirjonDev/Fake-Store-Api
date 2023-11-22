import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onlineshop/buisnessLogic/product/get_pro_event.dart';
import 'package:onlineshop/buisnessLogic/product/get_pro_state.dart';
import 'package:onlineshop/repositories/get_product_repository.dart';

class GetProductBloc extends Bloc<GetProductEvent, GetProductState> {
  GetProductBloc() : super(GetProductInitial()) {
    on((event, emit) async {
      try {
        emit(GetProductLoading());
        final getDataF = await GetProductRepository().getProFetch();
        emit(GetProductLoaded(getDataALL: getDataF));
      } catch (e) {
        print("Xato bloc");
      }
    });
  }
}
