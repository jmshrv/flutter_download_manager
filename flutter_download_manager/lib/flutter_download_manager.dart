library flutter_download_manager;

import 'package:path_provider/path_provider.dart';

import 'database.dart';
import 'models.dart';

class FlutterDownloadManager {
  final Database _db;

  FlutterDownloadManager._(this._db);

  static Future<FlutterDownloadManager> init(
      {String? dbPath, bool test = false}) async {
    dbPath ??= (await getApplicationSupportDirectory()).path;

    final db = await Database.init(dbPath: dbPath, test: test);

    return FlutterDownloadManager._(db);
  }

  /// Deletes the download DB. This is used for testing.
  Future<void> deleteDb() async {
    await _db.deleteDb();
  }

  Future<void> addDownload(Download download) async {
    await _db.addDownload(download);
  }

  Future<void> addAllDownloads(List<Download> downloads) async {
    await _db.addAllDownloads(downloads);
  }

  Future<void> addDownloadGroup(DownloadGroup downloadGroup) async =>
      await _db.addDownloadGroup(downloadGroup);

  Future<void> addAllDownloadGroups(List<DownloadGroup> downloadGroups) async =>
      await _db.addAllDownloadGroups(downloadGroups);

  Future<Download?> getDownload(int id) async {
    return await _db.getDownload(id);
  }

  Future<List<Download?>> getAllDownloads(List<int> ids) async {
    return await _db.getAllDownloads(ids);
  }

  Future<DownloadGroup?> getDownloadGroup(int id) async {
    return await _db.getDownloadGroup(id);
  }

  Future<List<DownloadGroup?>> getAllDownloadGroups(List<int> ids) async {
    return await _db.getAllDownloadGroups(ids);
  }

  /// Link [to] downloads to the given [from] download
  Future<void> addDownloadDownloadLinks(
          Download from, Set<Download> to) async =>
      await _db.addDownloadDownloadLinks(from, to);

  /// Link [to] download groups to the given [from] download
  Future<void> addDownloadDownloadGroupLinks(
          Download from, Set<DownloadGroup> to) async =>
      await _db.addDownloadDownloadGroupLinks(from, to);

  /// Link [to] downloads to the given [from] download group
  Future<void> addDownloadGroupDownloadLinks(
          DownloadGroup from, Set<Download> to) async =>
      await _db.addDownloadGroupDownloadLinks(from, to);

  /// Link [to] download groups to the given [from] download group
  Future<void> addDownloadGroupDownloadGroupLinks(
          DownloadGroup from, Set<DownloadGroup> to) async =>
      await _db.addDownloadGroupDownloadGroupLinks(from, to);
}
