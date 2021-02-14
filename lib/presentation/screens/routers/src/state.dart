import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import 'routes.dart';

class GalleryRoutersState extends ChangeNotifier with EquatableMixin {
  static GalleryRoutersState _instance;

  factory GalleryRoutersState() {
    _instance ??= GalleryRoutersState._();
    return _instance;
  }

  GalleryRoutersState._() : _galleryPath = RootPagePath.rootRoute;

  List<String> _albumsPath = <String>[];
  String _galleryPath;
  String _fileName;
  bool _show404 = false;

  String get galleryPath => _galleryPath;

  List<String> get albumsPath => _albumsPath;

  String get fileName => _fileName;

  bool get show404 => _show404;

  set galleryPath(String galleryPath) {
    _galleryPath = galleryPath;
    notifyListeners();
  }

  void pushAlbumPath(String albumPath) {
    if (!_albumsPath.contains(albumPath)) {
      _albumsPath = List.of(_albumsPath)..add(albumPath);
      notifyListeners();
    }
  }

  void popAlbumPath() {
    if (_albumsPath.isNotEmpty) {
      _albumsPath = List.of(_albumsPath)..removeLast();
      notifyListeners();
    }
  }

  void replaceAlbumPath(String albumPath) {
    if (_albumsPath.isNotEmpty) {
      _albumsPath = List.of(_albumsPath)..removeLast();
      _albumsPath = List.of(_albumsPath)..add(albumPath);
      notifyListeners();
    }
  }

  set fileName(String fileName) {
    _fileName = fileName;
    notifyListeners();
  }

  set show404(bool show404) {
    _show404 = show404;
    notifyListeners();
  }

  @override
  List<Object> get props {
    return [_albumsPath, _galleryPath, _fileName, _show404];
  }
}
