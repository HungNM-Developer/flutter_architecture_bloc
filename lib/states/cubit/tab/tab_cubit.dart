import 'package:bloc/bloc.dart';

import 'tab_state.dart';

class TabCubit extends Cubit<TabState> {
  TabCubit({int index = 1}) : super(TabChanged(index));

  int _selectedIndex = 1;
  int get selectedIndex => _selectedIndex;
  set selectedIndex(int index) {
    if (_selectedIndex == index) return;
    _selectedIndex = index;
    emit(TabChanged(_selectedIndex));
  }
}
