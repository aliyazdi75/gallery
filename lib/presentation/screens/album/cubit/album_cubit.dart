import 'package:bloc/bloc.dart';
import 'package:gallery_service/gallery_service.dart';

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
