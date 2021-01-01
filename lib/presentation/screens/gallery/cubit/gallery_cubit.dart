import 'package:bloc/bloc.dart';

class GalleryCubit extends Cubit<int> {
  GalleryCubit(int initialScrollIndex) : super(initialScrollIndex);

  void next() => emit(state + 1);

  void previous() => emit(state - 1);
  void jump(int index) => emit(index);
}
