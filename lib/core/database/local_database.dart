import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
//Aca importamos la colección

class LocalDatabase {
  late final Isar _isar;
  bool _isInitialized = false;

  Isar get db => _isInitialized ? _isar : throw IsarError('Isar not initialized');

  Future<void> initialize() async{
    if(_isInitialized) throw IsarError('Isar has already been initialized.');

    final directory = await getApplicationDocumentsDirectory();

    // _isar = await Isar.open([MovieDetailCollectionSchema], directory.path);

    _isInitialized = true;
  }
}