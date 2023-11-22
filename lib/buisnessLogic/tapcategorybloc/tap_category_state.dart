import 'package:equatable/equatable.dart';
import 'package:onlineshop/models/filter_category_model.dart';

abstract class TapFilterState extends Equatable {
  @override
  List<Object?> get props => [];
}

class TapFilterInitial extends TapFilterState {}

class TapFilterLoading extends TapFilterState {}

class TapFilterLoaded extends TapFilterState {
  final List<CategoryTapModel> getFilter;

  TapFilterLoaded({required this.getFilter});
  
}
