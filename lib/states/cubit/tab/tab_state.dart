abstract class TabState {}

class TabChanged extends TabState {
  final int index;
  TabChanged(this.index);
}
