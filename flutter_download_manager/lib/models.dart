import 'package:isar/isar.dart';

part 'models.g.dart';

class UriConverter extends TypeConverter<Uri, String> {
  const UriConverter();

  @override
  Uri fromIsar(String object) => Uri.parse(object);

  @override
  String toIsar(Uri object) => object.toString();
}

/// An item to be downloaded
@Collection()
class Download {
  final int id = Isar.autoIncrement;

  /// The URL path where the file is to be downloaded. Note that this is not an
  /// absolute path which Flutter can natively handle.
  @UriConverter()
  final Uri urlPath;

  /// Extra metadata that may be required.
  final Map extraData = {};

  /// Whether or not the file was explicitly downloaded. If true, the download
  /// will not be culled when it has no groups/downloads that depend on it.
  bool isExplicit;

  @Backlink(to: "dependencies")
  final dependedBy = IsarLinks<Download>();

  final dependencies = IsarLinks<Download>();

  final dependedByGroups = IsarLinks<DownloadGroup>();

  Download({
    required this.urlPath,
    this.isExplicit = true,
  });
}

@Collection()
class DownloadGroup {
  final int id = Isar.autoIncrement;

  /// Extra metadata that may be required.
  final Map extraData = {};

  /// Whether or not the group was explicitly downloaded. If true, the group
  /// will not be culled when it has no groups/downloads that depend on it.
  bool isExplicit;

  final children = IsarLinks<Download>();

  @Backlink(to: "children")
  final dependedByGroups = IsarLinks<DownloadGroup>();

  DownloadGroup({
    this.isExplicit = true,
  });
}
