import 'package:equatable/equatable.dart';
import 'package:onlineshop/models/user_by_basket_model.dart';

abstract class UserBasketAdminState extends Equatable {
   @override
  List<Object?> get props => [];
}

class UserBasketAdminInitial extends UserBasketAdminState {}

class UserBasketAdminLoading extends UserBasketAdminState {}

class UserBasketAdminLoaded extends UserBasketAdminState {
  final List<UserBybasketModel> getdata;

  UserBasketAdminLoaded({required this.getdata});
}
