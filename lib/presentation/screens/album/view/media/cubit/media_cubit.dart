import 'package:bloc/bloc.dart';

class MediaCubit extends Cubit<int> {
  MediaCubit(int initialScrollIndex) : super(initialScrollIndex);

  void next() => emit(state + 1);

  void previous() => emit(state - 1);

  void jump(int index) => emit(index);
}
