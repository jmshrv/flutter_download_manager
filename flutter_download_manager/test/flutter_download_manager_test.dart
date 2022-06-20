import 'package:flutter_download_manager/models.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_download_manager/flutter_download_manager.dart';

Future<void> main() async {
  late FlutterDownloadManager flutterDownloadManager;

  setUpAll(() {
    return FlutterDownloadManager.init(
      dbPath: "/tmp/",
      test: true,
    ).then((value) => flutterDownloadManager = value);
  });

  tearDownAll(() {
    return flutterDownloadManager.deleteDb();
  });

  test("Add a download to the database and retrieve it", () async {
    final download = Download(
        urlPath: Uri.file("/totally/real/path/file.txt"), extraData: "hello");

    await flutterDownloadManager.addDownload(download);

    final retrievedDownload =
        await flutterDownloadManager.getDownload(download.id);

    expect(retrievedDownload, download);
  });

  test("Add multiple downloads and retrieve them", () async {
    final downloads = [
      Download(
          urlPath: Uri.file("/totally/real/path/file.txt"), extraData: "1"),
      Download(
          urlPath: Uri.file("/totally/real/path/file.txt"), extraData: "2"),
      Download(
          urlPath: Uri.file("/totally/real/path/file.txt"), extraData: "3"),
    ];

    await flutterDownloadManager.addAllDownloads(downloads);

    final retrievedDownloads = await flutterDownloadManager
        .getAllDownloads(downloads.map((d) => d.id).toList());

    expect(retrievedDownloads, downloads);
  });

  test("Getting a non-existant download returns null", () async {
    final retrievedDownload = await flutterDownloadManager.getDownload(12345);

    expect(retrievedDownload, null);
  });

  group("Relations", () {
    group("DL/DL", () {
      test("Adding a DL/DL relation", () async {
        final downloadFrom = Download(
            urlPath: Uri.file("/totally/real/path/file.txt"),
            extraData: "hello");

        final downloadTo = Download(
            urlPath: Uri.file("/totally/real/path/file.txt"),
            extraData: "hello again");

        await flutterDownloadManager
            .addAllDownloads([downloadFrom, downloadTo]);

        await flutterDownloadManager
            .addDownloadDownloadLinks(downloadFrom, {downloadTo});

        expect(downloadFrom.dependencies.contains(downloadTo), true);
      });
    });

    group("DL/Group", () {
      test("Adding a DL/Group relation", () async {
        final downloadFrom = Download(
            urlPath: Uri.file("/totally/real/path/file.txt"),
            extraData: "hello");

        final downloadGroupTo = DownloadGroup(extraData: "hello again");

        await flutterDownloadManager.addDownload(downloadFrom);
        await flutterDownloadManager.addDownloadGroup(downloadGroupTo);

        await flutterDownloadManager
            .addDownloadDownloadGroupLinks(downloadFrom, {downloadGroupTo});

        expect(downloadFrom.dependenciesGroups.contains(downloadGroupTo), true);
      });
    });

    group("Group/DL", () {
      test("Adding a Group/DL relation", () async {
        final downloadGroupFrom = DownloadGroup(extraData: "hello");

        final downloadTo = Download(
            urlPath: Uri.file("/totally/real/path/file.txt"),
            extraData: "hello again");

        await flutterDownloadManager.addDownloadGroup(downloadGroupFrom);
        await flutterDownloadManager.addDownload(downloadTo);

        await flutterDownloadManager
            .addDownloadGroupDownloadLinks(downloadGroupFrom, {downloadTo});

        expect(downloadGroupFrom.dependencies.contains(downloadTo), true);
      });
    });

    group("Group/Group", () {
      test("Adding a Group/Group relation", () async {
        final downloadGroupFrom = DownloadGroup(extraData: "hello");

        final downloadGroupTo = DownloadGroup(extraData: "hello again");

        await flutterDownloadManager.addDownloadGroup(downloadGroupFrom);
        await flutterDownloadManager.addDownloadGroup(downloadGroupTo);

        await flutterDownloadManager.addDownloadGroupDownloadGroupLinks(
            downloadGroupFrom, {downloadGroupTo});

        expect(downloadGroupFrom.dependenciesGroups.contains(downloadGroupTo),
            true);
      });
    });
  });
}
