import 'package:equatable/equatable.dart';

abstract class SelectEvent extends Equatable {
  @override
  List<Object?> get props => [];
}


class SelectGetEvent extends SelectEvent{}