// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, unused_local_variable

extension GetDownloadCollection on Isar {
  IsarCollection<Download> get downloads => getCollection();
}

const DownloadSchema = CollectionSchema(
  name: 'Download',
  schema:
      '{"name":"Download","idName":"id","properties":[{"name":"isExplicit","type":"Bool"},{"name":"urlPath","type":"String"}],"indexes":[],"links":[{"name":"dependedByGroups","target":"DownloadGroup"},{"name":"dependencies","target":"Download"}]}',
  idName: 'id',
  propertyIds: {'isExplicit': 0, 'urlPath': 1},
  listProperties: {},
  indexIds: {},
  indexValueTypes: {},
  linkIds: {'dependedByGroups': 0, 'dependencies': 1, 'dependedBy': 2},
  backlinkLinkNames: {'dependedBy': 'dependencies'},
  getId: _downloadGetId,
  getLinks: _downloadGetLinks,
  attachLinks: _downloadAttachLinks,
  serializeNative: _downloadSerializeNative,
  deserializeNative: _downloadDeserializeNative,
  deserializePropNative: _downloadDeserializePropNative,
  serializeWeb: _downloadSerializeWeb,
  deserializeWeb: _downloadDeserializeWeb,
  deserializePropWeb: _downloadDeserializePropWeb,
  version: 3,
);

int? _downloadGetId(Download object) {
  if (object.id == Isar.autoIncrement) {
    return null;
  } else {
    return object.id;
  }
}

List<IsarLinkBase> _downloadGetLinks(Download object) {
  return [object.dependedByGroups, object.dependencies, object.dependedBy];
}

const _downloadUriConverter = UriConverter();

void _downloadSerializeNative(
    IsarCollection<Download> collection,
    IsarRawObject rawObj,
    Download object,
    int staticSize,
    List<int> offsets,
    AdapterAlloc alloc) {
  var dynamicSize = 0;
  final value0 = object.isExplicit;
  final _isExplicit = value0;
  final value1 = _downloadUriConverter.toIsar(object.urlPath);
  final _urlPath = IsarBinaryWriter.utf8Encoder.convert(value1);
  dynamicSize += (_urlPath.length) as int;
  final size = staticSize + dynamicSize;

  rawObj.buffer = alloc(size);
  rawObj.buffer_length = size;
  final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeBool(offsets[0], _isExplicit);
  writer.writeBytes(offsets[1], _urlPath);
}

Download _downloadDeserializeNative(IsarCollection<Download> collection, int id,
    IsarBinaryReader reader, List<int> offsets) {
  final object = Download(
    isExplicit: reader.readBool(offsets[0]),
    urlPath: _downloadUriConverter.fromIsar(reader.readString(offsets[1])),
  );
  _downloadAttachLinks(collection, id, object);
  return object;
}

P _downloadDeserializePropNative<P>(
    int id, IsarBinaryReader reader, int propertyIndex, int offset) {
  switch (propertyIndex) {
    case -1:
      return id as P;
    case 0:
      return (reader.readBool(offset)) as P;
    case 1:
      return (_downloadUriConverter.fromIsar(reader.readString(offset))) as P;
    default:
      throw 'Illegal propertyIndex';
  }
}

dynamic _downloadSerializeWeb(
    IsarCollection<Download> collection, Download object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(jsObj, 'id', object.id);
  IsarNative.jsObjectSet(jsObj, 'isExplicit', object.isExplicit);
  IsarNative.jsObjectSet(
      jsObj, 'urlPath', _downloadUriConverter.toIsar(object.urlPath));
  return jsObj;
}

Download _downloadDeserializeWeb(
    IsarCollection<Download> collection, dynamic jsObj) {
  final object = Download(
    isExplicit: IsarNative.jsObjectGet(jsObj, 'isExplicit') ?? false,
    urlPath: _downloadUriConverter
        .fromIsar(IsarNative.jsObjectGet(jsObj, 'urlPath') ?? ''),
  );
  _downloadAttachLinks(collection,
      IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity, object);
  return object;
}

P _downloadDeserializePropWeb<P>(Object jsObj, String propertyName) {
  switch (propertyName) {
    case 'id':
      return (IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity)
          as P;
    case 'isExplicit':
      return (IsarNative.jsObjectGet(jsObj, 'isExplicit') ?? false) as P;
    case 'urlPath':
      return (_downloadUriConverter
          .fromIsar(IsarNative.jsObjectGet(jsObj, 'urlPath') ?? '')) as P;
    default:
      throw 'Illegal propertyName';
  }
}

void _downloadAttachLinks(IsarCollection col, int id, Download object) {
  object.dependedByGroups
      .attach(col, col.isar.downloadGroups, 'dependedByGroups', id);
  object.dependencies.attach(col, col.isar.downloads, 'dependencies', id);
  object.dependedBy.attach(col, col.isar.downloads, 'dependedBy', id);
}

extension DownloadQueryWhereSort on QueryBuilder<Download, Download, QWhere> {
  QueryBuilder<Download, Download, QAfterWhere> anyId() {
    return addWhereClauseInternal(const IdWhereClause.any());
  }
}

extension DownloadQueryWhere on QueryBuilder<Download, Download, QWhereClause> {
  QueryBuilder<Download, Download, QAfterWhereClause> idEqualTo(int id) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: id,
      includeLower: true,
      upper: id,
      includeUpper: true,
    ));
  }

  QueryBuilder<Download, Download, QAfterWhereClause> idNotEqualTo(int id) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(
        IdWhereClause.lessThan(upper: id, includeUpper: false),
      ).addWhereClauseInternal(
        IdWhereClause.greaterThan(lower: id, includeLower: false),
      );
    } else {
      return addWhereClauseInternal(
        IdWhereClause.greaterThan(lower: id, includeLower: false),
      ).addWhereClauseInternal(
        IdWhereClause.lessThan(upper: id, includeUpper: false),
      );
    }
  }

  QueryBuilder<Download, Download, QAfterWhereClause> idGreaterThan(int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.greaterThan(lower: id, includeLower: include),
    );
  }

  QueryBuilder<Download, Download, QAfterWhereClause> idLessThan(int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.lessThan(upper: id, includeUpper: include),
    );
  }

  QueryBuilder<Download, Download, QAfterWhereClause> idBetween(
    int lowerId,
    int upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: lowerId,
      includeLower: includeLower,
      upper: upperId,
      includeUpper: includeUpper,
    ));
  }
}

extension DownloadQueryFilter
    on QueryBuilder<Download, Download, QFilterCondition> {
  QueryBuilder<Download, Download, QAfterFilterCondition> idEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<Download, Download, QAfterFilterCondition> idGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<Download, Download, QAfterFilterCondition> idLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<Download, Download, QAfterFilterCondition> idBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'id',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<Download, Download, QAfterFilterCondition> isExplicitEqualTo(
      bool value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'isExplicit',
      value: value,
    ));
  }

  QueryBuilder<Download, Download, QAfterFilterCondition> urlPathEqualTo(
    Uri value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'urlPath',
      value: _downloadUriConverter.toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Download, Download, QAfterFilterCondition> urlPathGreaterThan(
    Uri value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'urlPath',
      value: _downloadUriConverter.toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Download, Download, QAfterFilterCondition> urlPathLessThan(
    Uri value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'urlPath',
      value: _downloadUriConverter.toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Download, Download, QAfterFilterCondition> urlPathBetween(
    Uri lower,
    Uri upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'urlPath',
      lower: _downloadUriConverter.toIsar(lower),
      includeLower: includeLower,
      upper: _downloadUriConverter.toIsar(upper),
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Download, Download, QAfterFilterCondition> urlPathStartsWith(
    Uri value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'urlPath',
      value: _downloadUriConverter.toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Download, Download, QAfterFilterCondition> urlPathEndsWith(
    Uri value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'urlPath',
      value: _downloadUriConverter.toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Download, Download, QAfterFilterCondition> urlPathContains(
      Uri value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'urlPath',
      value: _downloadUriConverter.toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Download, Download, QAfterFilterCondition> urlPathMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'urlPath',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }
}

extension DownloadQueryLinks
    on QueryBuilder<Download, Download, QFilterCondition> {
  QueryBuilder<Download, Download, QAfterFilterCondition> dependedByGroups(
      FilterQuery<DownloadGroup> q) {
    return linkInternal(
      isar.downloadGroups,
      q,
      'dependedByGroups',
    );
  }

  QueryBuilder<Download, Download, QAfterFilterCondition> dependencies(
      FilterQuery<Download> q) {
    return linkInternal(
      isar.downloads,
      q,
      'dependencies',
    );
  }

  QueryBuilder<Download, Download, QAfterFilterCondition> dependedBy(
      FilterQuery<Download> q) {
    return linkInternal(
      isar.downloads,
      q,
      'dependedBy',
    );
  }
}

extension DownloadQueryWhereSortBy
    on QueryBuilder<Download, Download, QSortBy> {
  QueryBuilder<Download, Download, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<Download, Download, QAfterSortBy> sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<Download, Download, QAfterSortBy> sortByIsExplicit() {
    return addSortByInternal('isExplicit', Sort.asc);
  }

  QueryBuilder<Download, Download, QAfterSortBy> sortByIsExplicitDesc() {
    return addSortByInternal('isExplicit', Sort.desc);
  }

  QueryBuilder<Download, Download, QAfterSortBy> sortByUrlPath() {
    return addSortByInternal('urlPath', Sort.asc);
  }

  QueryBuilder<Download, Download, QAfterSortBy> sortByUrlPathDesc() {
    return addSortByInternal('urlPath', Sort.desc);
  }
}

extension DownloadQueryWhereSortThenBy
    on QueryBuilder<Download, Download, QSortThenBy> {
  QueryBuilder<Download, Download, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<Download, Download, QAfterSortBy> thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<Download, Download, QAfterSortBy> thenByIsExplicit() {
    return addSortByInternal('isExplicit', Sort.asc);
  }

  QueryBuilder<Download, Download, QAfterSortBy> thenByIsExplicitDesc() {
    return addSortByInternal('isExplicit', Sort.desc);
  }

  QueryBuilder<Download, Download, QAfterSortBy> thenByUrlPath() {
    return addSortByInternal('urlPath', Sort.asc);
  }

  QueryBuilder<Download, Download, QAfterSortBy> thenByUrlPathDesc() {
    return addSortByInternal('urlPath', Sort.desc);
  }
}

extension DownloadQueryWhereDistinct
    on QueryBuilder<Download, Download, QDistinct> {
  QueryBuilder<Download, Download, QDistinct> distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<Download, Download, QDistinct> distinctByIsExplicit() {
    return addDistinctByInternal('isExplicit');
  }

  QueryBuilder<Download, Download, QDistinct> distinctByUrlPath(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('urlPath', caseSensitive: caseSensitive);
  }
}

extension DownloadQueryProperty
    on QueryBuilder<Download, Download, QQueryProperty> {
  QueryBuilder<Download, int, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<Download, bool, QQueryOperations> isExplicitProperty() {
    return addPropertyNameInternal('isExplicit');
  }

  QueryBuilder<Download, Uri, QQueryOperations> urlPathProperty() {
    return addPropertyNameInternal('urlPath');
  }
}

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, unused_local_variable

extension GetDownloadGroupCollection on Isar {
  IsarCollection<DownloadGroup> get downloadGroups => getCollection();
}

const DownloadGroupSchema = CollectionSchema(
  name: 'DownloadGroup',
  schema:
      '{"name":"DownloadGroup","idName":"id","properties":[{"name":"isExplicit","type":"Bool"}],"indexes":[],"links":[{"name":"children","target":"Download"}]}',
  idName: 'id',
  propertyIds: {'isExplicit': 0},
  listProperties: {},
  indexIds: {},
  indexValueTypes: {},
  linkIds: {'children': 0, 'dependedByGroups': 1},
  backlinkLinkNames: {'dependedByGroups': 'children'},
  getId: _downloadGroupGetId,
  getLinks: _downloadGroupGetLinks,
  attachLinks: _downloadGroupAttachLinks,
  serializeNative: _downloadGroupSerializeNative,
  deserializeNative: _downloadGroupDeserializeNative,
  deserializePropNative: _downloadGroupDeserializePropNative,
  serializeWeb: _downloadGroupSerializeWeb,
  deserializeWeb: _downloadGroupDeserializeWeb,
  deserializePropWeb: _downloadGroupDeserializePropWeb,
  version: 3,
);

int? _downloadGroupGetId(DownloadGroup object) {
  if (object.id == Isar.autoIncrement) {
    return null;
  } else {
    return object.id;
  }
}

List<IsarLinkBase> _downloadGroupGetLinks(DownloadGroup object) {
  return [object.children, object.dependedByGroups];
}

void _downloadGroupSerializeNative(
    IsarCollection<DownloadGroup> collection,
    IsarRawObject rawObj,
    DownloadGroup object,
    int staticSize,
    List<int> offsets,
    AdapterAlloc alloc) {
  var dynamicSize = 0;
  final value0 = object.isExplicit;
  final _isExplicit = value0;
  final size = staticSize + dynamicSize;

  rawObj.buffer = alloc(size);
  rawObj.buffer_length = size;
  final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeBool(offsets[0], _isExplicit);
}

DownloadGroup _downloadGroupDeserializeNative(
    IsarCollection<DownloadGroup> collection,
    int id,
    IsarBinaryReader reader,
    List<int> offsets) {
  final object = DownloadGroup(
    isExplicit: reader.readBool(offsets[0]),
  );
  _downloadGroupAttachLinks(collection, id, object);
  return object;
}

P _downloadGroupDeserializePropNative<P>(
    int id, IsarBinaryReader reader, int propertyIndex, int offset) {
  switch (propertyIndex) {
    case -1:
      return id as P;
    case 0:
      return (reader.readBool(offset)) as P;
    default:
      throw 'Illegal propertyIndex';
  }
}

dynamic _downloadGroupSerializeWeb(
    IsarCollection<DownloadGroup> collection, DownloadGroup object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(jsObj, 'id', object.id);
  IsarNative.jsObjectSet(jsObj, 'isExplicit', object.isExplicit);
  return jsObj;
}

DownloadGroup _downloadGroupDeserializeWeb(
    IsarCollection<DownloadGroup> collection, dynamic jsObj) {
  final object = DownloadGroup(
    isExplicit: IsarNative.jsObjectGet(jsObj, 'isExplicit') ?? false,
  );
  _downloadGroupAttachLinks(collection,
      IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity, object);
  return object;
}

P _downloadGroupDeserializePropWeb<P>(Object jsObj, String propertyName) {
  switch (propertyName) {
    case 'id':
      return (IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity)
          as P;
    case 'isExplicit':
      return (IsarNative.jsObjectGet(jsObj, 'isExplicit') ?? false) as P;
    default:
      throw 'Illegal propertyName';
  }
}

void _downloadGroupAttachLinks(
    IsarCollection col, int id, DownloadGroup object) {
  object.children.attach(col, col.isar.downloads, 'children', id);
  object.dependedByGroups
      .attach(col, col.isar.downloadGroups, 'dependedByGroups', id);
}

extension DownloadGroupQueryWhereSort
    on QueryBuilder<DownloadGroup, DownloadGroup, QWhere> {
  QueryBuilder<DownloadGroup, DownloadGroup, QAfterWhere> anyId() {
    return addWhereClauseInternal(const IdWhereClause.any());
  }
}

extension DownloadGroupQueryWhere
    on QueryBuilder<DownloadGroup, DownloadGroup, QWhereClause> {
  QueryBuilder<DownloadGroup, DownloadGroup, QAfterWhereClause> idEqualTo(
      int id) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: id,
      includeLower: true,
      upper: id,
      includeUpper: true,
    ));
  }

  QueryBuilder<DownloadGroup, DownloadGroup, QAfterWhereClause> idNotEqualTo(
      int id) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(
        IdWhereClause.lessThan(upper: id, includeUpper: false),
      ).addWhereClauseInternal(
        IdWhereClause.greaterThan(lower: id, includeLower: false),
      );
    } else {
      return addWhereClauseInternal(
        IdWhereClause.greaterThan(lower: id, includeLower: false),
      ).addWhereClauseInternal(
        IdWhereClause.lessThan(upper: id, includeUpper: false),
      );
    }
  }

  QueryBuilder<DownloadGroup, DownloadGroup, QAfterWhereClause> idGreaterThan(
      int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.greaterThan(lower: id, includeLower: include),
    );
  }

  QueryBuilder<DownloadGroup, DownloadGroup, QAfterWhereClause> idLessThan(
      int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.lessThan(upper: id, includeUpper: include),
    );
  }

  QueryBuilder<DownloadGroup, DownloadGroup, QAfterWhereClause> idBetween(
    int lowerId,
    int upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: lowerId,
      includeLower: includeLower,
      upper: upperId,
      includeUpper: includeUpper,
    ));
  }
}

extension DownloadGroupQueryFilter
    on QueryBuilder<DownloadGroup, DownloadGroup, QFilterCondition> {
  QueryBuilder<DownloadGroup, DownloadGroup, QAfterFilterCondition> idEqualTo(
      int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<DownloadGroup, DownloadGroup, QAfterFilterCondition>
      idGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<DownloadGroup, DownloadGroup, QAfterFilterCondition> idLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<DownloadGroup, DownloadGroup, QAfterFilterCondition> idBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'id',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<DownloadGroup, DownloadGroup, QAfterFilterCondition>
      isExplicitEqualTo(bool value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'isExplicit',
      value: value,
    ));
  }
}

extension DownloadGroupQueryLinks
    on QueryBuilder<DownloadGroup, DownloadGroup, QFilterCondition> {
  QueryBuilder<DownloadGroup, DownloadGroup, QAfterFilterCondition> children(
      FilterQuery<Download> q) {
    return linkInternal(
      isar.downloads,
      q,
      'children',
    );
  }

  QueryBuilder<DownloadGroup, DownloadGroup, QAfterFilterCondition>
      dependedByGroups(FilterQuery<DownloadGroup> q) {
    return linkInternal(
      isar.downloadGroups,
      q,
      'dependedByGroups',
    );
  }
}

extension DownloadGroupQueryWhereSortBy
    on QueryBuilder<DownloadGroup, DownloadGroup, QSortBy> {
  QueryBuilder<DownloadGroup, DownloadGroup, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<DownloadGroup, DownloadGroup, QAfterSortBy> sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<DownloadGroup, DownloadGroup, QAfterSortBy> sortByIsExplicit() {
    return addSortByInternal('isExplicit', Sort.asc);
  }

  QueryBuilder<DownloadGroup, DownloadGroup, QAfterSortBy>
      sortByIsExplicitDesc() {
    return addSortByInternal('isExplicit', Sort.desc);
  }
}

extension DownloadGroupQueryWhereSortThenBy
    on QueryBuilder<DownloadGroup, DownloadGroup, QSortThenBy> {
  QueryBuilder<DownloadGroup, DownloadGroup, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<DownloadGroup, DownloadGroup, QAfterSortBy> thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<DownloadGroup, DownloadGroup, QAfterSortBy> thenByIsExplicit() {
    return addSortByInternal('isExplicit', Sort.asc);
  }

  QueryBuilder<DownloadGroup, DownloadGroup, QAfterSortBy>
      thenByIsExplicitDesc() {
    return addSortByInternal('isExplicit', Sort.desc);
  }
}

extension DownloadGroupQueryWhereDistinct
    on QueryBuilder<DownloadGroup, DownloadGroup, QDistinct> {
  QueryBuilder<DownloadGroup, DownloadGroup, QDistinct> distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<DownloadGroup, DownloadGroup, QDistinct> distinctByIsExplicit() {
    return addDistinctByInternal('isExplicit');
  }
}

extension DownloadGroupQueryProperty
    on QueryBuilder<DownloadGroup, DownloadGroup, QQueryProperty> {
  QueryBuilder<DownloadGroup, int, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<DownloadGroup, bool, QQueryOperations> isExplicitProperty() {
    return addPropertyNameInternal('isExplicit');
  }
}
