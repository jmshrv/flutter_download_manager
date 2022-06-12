import 'package:isar/isar.dart';

part 'models.g.dart';

/// An item to be downloaded
@Collection()
class Download<T extends TypeConverter> {
  int id = Isar.autoIncrement;

  /// The URL path where the file is to be downloaded. Note that this is not an
  /// absolute path which Flutter can natively handle.
  final String urlPath;

  /// Extra metadata that may be required.
  final T? extraData;

  Download({
    this.extraData,
    required this.urlPath,
  });
}
