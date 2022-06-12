import 'package:example/test_class.dart';
import 'package:flutter/material.dart';
import 'package:flutter_download_manager/flutter_download_manager.dart';
import 'package:flutter_download_manager/models.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: TestWidget(),
    );
  }
}

class TestWidget extends StatefulWidget {
  const TestWidget({Key? key}) : super(key: key);

  @override
  State<TestWidget> createState() => _TestWidgetState();
}

class _TestWidgetState extends State<TestWidget> {
  final _testWidgetFuture = _test();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: _testWidgetFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return const Text('Done');
        } else {
          return const Text('Loading');
        }
      },
    );
  }
}

Future<void> _test() async {
  final downloader = await FlutterDownloadManager.init();
  final testDl =
      Download(urlPath: "notaurl", extraData: TestClass("Hello World"));

  await downloader.addDownload(testDl);
}
