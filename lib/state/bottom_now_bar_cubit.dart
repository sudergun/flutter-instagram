import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'bottom_now_bar_state.dart';

class BottomNowBarCubit extends Cubit<BottomNowBarState> {
  BottomNowBarCubit() : super(BottomNowBarState(a: 0));

  onTop(value) {
    emit(BottomNowBarState(a: value));
  }
}
