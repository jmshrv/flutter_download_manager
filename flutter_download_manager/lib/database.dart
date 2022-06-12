import 'package:isar/isar.dart';

import 'models.dart';

class Database {
  final Isar _isar;

  Database._(this._isar);

  static Future<Database> init(String dbPath) async {
    final isar = await Isar.open(
      schemas: [DownloadSchema],
      directory: dbPath,
      inspector: true,
    );

    return Database._(isar);
  }

  Future<void> add(Download download) async {
    await _isar.writeTxn(
        (isar) async => download.id = await isar.downloads.put(download));
  }
}
