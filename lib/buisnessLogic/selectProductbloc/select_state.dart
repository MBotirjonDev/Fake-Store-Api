import 'package:equatable/equatable.dart';
import 'package:onlineshop/models/select_product_model.dart';

abstract class SelectState extends Equatable {
  @override
  List<Object?> get props => [];
}

class SelectInitial extends SelectState {}

class SelectLoading extends SelectState {}

class SelectLoaded extends SelectState {
  final List<SelectProductModel> selsectPro;

  SelectLoaded({required this.selsectPro});
}
