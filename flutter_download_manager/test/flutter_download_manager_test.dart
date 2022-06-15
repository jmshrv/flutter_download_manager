import 'package:flutter_download_manager/models.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_download_manager/flutter_download_manager.dart';

Future<void> main() async {
  final flutterDownloadManager = await FlutterDownloadManager.init(
    dbPath: "/tmp/",
    test: true,
  );

  test("Add a download to the database and retrieve it", () async {
    final download = Download(
        urlPath: Uri.file("/totally/real/path/file.txt"), extraData: "hello");

    await flutterDownloadManager.addDownload(download);

    final retrievedDownload =
        await flutterDownloadManager.getDownload(download.id);

    expect(retrievedDownload, download);
  });

  test("Getting a non-existant download returns null", () async {
    final retrievedDownload = await flutterDownloadManager.getDownload(12345);

    expect(retrievedDownload, null);
  });
}
