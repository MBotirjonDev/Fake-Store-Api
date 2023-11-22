import 'package:equatable/equatable.dart';
import 'package:onlineshop/models/get_category.dart';

abstract class CategoryState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CategoryInitial extends CategoryState {}

class CategoryLoading extends CategoryState {}

class CategoryLoaded extends CategoryState {
  final List<CategoryModel> getData;

  CategoryLoaded({required this.getData});
}
