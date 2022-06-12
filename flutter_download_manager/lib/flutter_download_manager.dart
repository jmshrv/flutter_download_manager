library flutter_download_manager;

import 'package:path_provider/path_provider.dart';

import 'database.dart';
import 'models.dart';

class FlutterDownloadManager {
  final Database _db;

  FlutterDownloadManager._(this._db);

  static Future<FlutterDownloadManager> init({String? dbPath}) async {
    dbPath ??= (await getApplicationSupportDirectory()).path;

    final db = await Database.init(dbPath);

    return FlutterDownloadManager._(db);
  }

  Future<void> addDownload(Download download) async {
    await _db.add(download);
  }
}
