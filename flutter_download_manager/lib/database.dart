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

  //
  // CREATE
  //

  Future<void> deleteDb() async {
    await _isar.close(deleteFromDisk: true);
  }

  Future<void> addDownload(Download download) async {
    await _isar.writeTxn((isar) async => await isar.downloads.put(download));
  }

  Future<void> addAllDownloads(List<Download> downloads) async {
    await _isar
        .writeTxn((isar) async => await isar.downloads.putAll(downloads));
  }

  Future<void> addDownloadGroup(DownloadGroup downloadGroup) async {
    await _isar
        .writeTxn((isar) async => await isar.downloadGroups.put(downloadGroup));
  }

  Future<void> addAllDownloadGroups(List<DownloadGroup> downloadGroups) async {
    await _isar.writeTxn(
        (isar) async => await isar.downloadGroups.putAll(downloadGroups));
  }

  //
  // GET
  //

  Future<Download?> getDownload(int id) async {
    return await _isar.txn<Download?>((isar) => isar.downloads.get(id));
  }

  Future<List<Download?>> getAllDownloads(List<int> ids) async {
    return await _isar
        .txn<List<Download?>>((isar) => isar.downloads.getAll(ids));
  }

  Future<DownloadGroup?> getDownloadGroup(int id) async {
    return await _isar
        .txn<DownloadGroup?>((isar) => isar.downloadGroups.get(id));
  }

  Future<List<DownloadGroup?>> getAllDownloadGroups(List<int> ids) async {
    return await _isar
        .txn<List<DownloadGroup?>>((isar) => isar.downloadGroups.getAll(ids));
  }

  //
  // LINKS
  //

  /// Link [to] downloads to the given [from] download
  Future<void> addDownloadDownloadLinks(Download from, Set<Download> to) async {
    from.dependencies.addAll(to);
    await _isar.writeTxn((isar) async => await from.dependencies.save());
  }

  /// Link [to] download groups to the given [from] download
  Future<void> addDownloadDownloadGroupLinks(
      Download from, Set<DownloadGroup> to) async {
    from.dependenciesGroups.addAll(to);
    await _isar.writeTxn((isar) async => await from.dependenciesGroups.save());
  }

  /// Link [to] downloads to the given [from] download group
  Future<void> addDownloadGroupDownloadLinks(
      DownloadGroup from, Set<Download> to) async {
    from.dependencies.addAll(to);
    await _isar.writeTxn((isar) async => await from.dependencies.save());
  }

  /// Link [to] download groups to the given [from] download group
  Future<void> addDownloadGroupDownloadGroupLinks(
      DownloadGroup from, Set<DownloadGroup> to) async {
    from.dependenciesGroups.addAll(to);
    await _isar.writeTxn((isar) async => await from.dependenciesGroups.save());
  }
}
