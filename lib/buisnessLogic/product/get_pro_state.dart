import 'package:equatable/equatable.dart';
import 'package:onlineshop/models/get_product_model.dart';

abstract class GetProductState extends Equatable {
  @override
  List<Object> props = [];
}

class GetProductInitial extends GetProductState {}

class GetProductLoading extends GetProductState {}

class GetProductLoaded extends GetProductState {
  final List<GetProductModel> getDataALL;

  GetProductLoaded({required this.getDataALL});
}
