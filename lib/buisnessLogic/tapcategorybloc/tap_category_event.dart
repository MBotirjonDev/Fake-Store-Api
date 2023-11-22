import 'package:equatable/equatable.dart';

abstract class TapFilterEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetFilterEvent extends TapFilterEvent{}

