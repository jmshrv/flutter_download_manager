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
  int id = Isar.autoIncrement;

  /// The URL path where the file is to be downloaded. Note that this is not an
  /// absolute path which Flutter can natively handle.
  @UriConverter()
  final Uri urlPath;

  /// Extra metadata that may be required. It's probably a good idea to use JSON
  /// here.
  final String? extraData;

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
    this.extraData,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Download &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          urlPath == other.urlPath &&
          extraData == other.extraData &&
          isExplicit == other.isExplicit;

  @override
  int get hashCode =>
      id.hashCode ^ urlPath.hashCode ^ extraData.hashCode ^ isExplicit.hashCode;
}

@Collection()
class DownloadGroup {
  int id = Isar.autoIncrement;

  /// Extra metadata that may be required. It's probably a good idea to use JSON
  /// here.
  final String? extraData;

  /// Whether or not the group was explicitly downloaded. If true, the group
  /// will not be culled when it has no groups/downloads that depend on it.
  bool isExplicit;

  final dependencies = IsarLinks<Download>();

  @Backlink(to: "dependencies")
  final dependedBy = IsarLinks<Download>();

  final dependenciesGroups = IsarLinks<DownloadGroup>();

  @Backlink(to: "dependenciesGroups")
  final dependedByGroups = IsarLinks<DownloadGroup>();

  DownloadGroup({
    this.isExplicit = true,
    this.extraData,
  });
}
