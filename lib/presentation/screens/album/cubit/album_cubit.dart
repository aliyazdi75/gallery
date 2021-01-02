import 'package:bloc/bloc.dart';
import 'package:ceit_alumni/data/models/gallery/index.dart';

class GalleryCubit extends Cubit<List<Album>> {
  GalleryCubit() : super([]);

  void push(Album album) {
    state.add(album);
    emit(state);
  }

  void remove() {
    state.removeLast();
    emit(state);
  }
}
