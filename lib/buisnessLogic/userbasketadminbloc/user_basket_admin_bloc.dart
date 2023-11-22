import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onlineshop/buisnessLogic/userbasketadminbloc/user_basket_admin_event.dart';
import 'package:onlineshop/buisnessLogic/userbasketadminbloc/user_basket_admin_state.dart';
import 'package:onlineshop/repositories/user_basket_repo.dart';

class UserByBasketAdminBloc
    extends Bloc<UserBasketAdminEvent, UserBasketAdminState> {
  UserByBasketAdminBloc() : super(UserBasketAdminInitial()) {
    on((event, emit) async {
      try {
        emit(UserBasketAdminLoading());
        final getData =
            await UserBasketAdminRepository().getUserBasketAdminFetch();
        emit(UserBasketAdminLoaded(getdata: getData));
      } catch (e) {
        throw Exception(e.toString());
      }
    });
  }
}
