import 'package:equatable/equatable.dart';

abstract class GetProductEvent extends Equatable {
  @override
  List<Object> props = [];
}

class GetAllProduct extends GetProductEvent {}
