
abstract class BottomEvent {}

class TabChange extends BottomEvent {
  final int tabIndex;

  TabChange({required this.tabIndex});
}