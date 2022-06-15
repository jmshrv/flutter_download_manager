import 'package:flutter/foundation.dart';
import 'package:isar/isar.dart';

import 'models.dart';

class Database {
  final Isar _isar;

  Database._(this._isar);

  static Future<Database> init(
      {required String dbPath, bool test = false}) async {
    if (test) {
      await Isar.initializeIsarCore(download: true);
    }

    final isar = await Isar.open(
      schemas: [DownloadSchema, DownloadGroupSchema],
      directory: dbPath,
      inspector: !test && kDebugMode,
    );

    return Database._(isar);
  }

  Future<void> add(Download download) async {
    await _isar.writeTxn((isar) async => await isar.downloads.put(download));
  }

  Future<Download?> get(int id) async {
    return await _isar.txn<Download?>((isar) => isar.downloads.get(id));
  }
}
