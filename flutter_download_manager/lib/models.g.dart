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
      '{"name":"Download","idName":"id","properties":[{"name":"urlPath","type":"String"}],"indexes":[],"links":[]}',
  idName: 'id',
  propertyIds: {'urlPath': 0},
  listProperties: {},
  indexIds: {},
  indexValueTypes: {},
  linkIds: {},
  backlinkLinkNames: {},
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
  return [];
}

void _downloadSerializeNative(
    IsarCollection<Download> collection,
    IsarRawObject rawObj,
    Download object,
    int staticSize,
    List<int> offsets,
    AdapterAlloc alloc) {
  var dynamicSize = 0;
  final value0 = object.urlPath;
  final _urlPath = IsarBinaryWriter.utf8Encoder.convert(value0);
  dynamicSize += (_urlPath.length) as int;
  final size = staticSize + dynamicSize;

  rawObj.buffer = alloc(size);
  rawObj.buffer_length = size;
  final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeBytes(offsets[0], _urlPath);
}

Download _downloadDeserializeNative(IsarCollection<Download> collection, int id,
    IsarBinaryReader reader, List<int> offsets) {
  final object = Download(
    urlPath: reader.readString(offsets[0]),
  );
  return object;
}

P _downloadDeserializePropNative<P>(
    int id, IsarBinaryReader reader, int propertyIndex, int offset) {
  switch (propertyIndex) {
    case -1:
      return id as P;
    case 0:
      return (reader.readString(offset)) as P;
    default:
      throw 'Illegal propertyIndex';
  }
}

dynamic _downloadSerializeWeb(
    IsarCollection<Download> collection, Download object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(jsObj, 'id', object.id);
  IsarNative.jsObjectSet(jsObj, 'urlPath', object.urlPath);
  return jsObj;
}

Download _downloadDeserializeWeb(
    IsarCollection<Download> collection, dynamic jsObj) {
  final object = Download(
    urlPath: IsarNative.jsObjectGet(jsObj, 'urlPath') ?? '',
  );
  return object;
}

P _downloadDeserializePropWeb<P>(Object jsObj, String propertyName) {
  switch (propertyName) {
    case 'id':
      return (IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity)
          as P;
    case 'urlPath':
      return (IsarNative.jsObjectGet(jsObj, 'urlPath') ?? '') as P;
    default:
      throw 'Illegal propertyName';
  }
}

void _downloadAttachLinks(IsarCollection col, int id, Download object) {}

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

  QueryBuilder<Download, Download, QAfterFilterCondition> urlPathEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'urlPath',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Download, Download, QAfterFilterCondition> urlPathGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'urlPath',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Download, Download, QAfterFilterCondition> urlPathLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'urlPath',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Download, Download, QAfterFilterCondition> urlPathBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'urlPath',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Download, Download, QAfterFilterCondition> urlPathStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'urlPath',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Download, Download, QAfterFilterCondition> urlPathEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'urlPath',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Download, Download, QAfterFilterCondition> urlPathContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'urlPath',
      value: value,
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
    on QueryBuilder<Download, Download, QFilterCondition> {}

extension DownloadQueryWhereSortBy
    on QueryBuilder<Download, Download, QSortBy> {
  QueryBuilder<Download, Download, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<Download, Download, QAfterSortBy> sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
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

  QueryBuilder<Download, String, QQueryOperations> urlPathProperty() {
    return addPropertyNameInternal('urlPath');
  }
}
