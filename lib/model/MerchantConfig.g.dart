// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MerchantConfig.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetMerchantConfigCollection on Isar {
  IsarCollection<MerchantConfig> get merchantConfigs => this.collection();
}

const MerchantConfigSchema = CollectionSchema(
  name: r'MerchantConfig',
  id: 8405917354809830640,
  properties: {
    r'fatherCateGorys': PropertySchema(
      id: 0,
      name: r'fatherCateGorys',
      type: IsarType.objectList,
      target: r'FatherCateGory',
    )
  },
  estimateSize: _merchantConfigEstimateSize,
  serialize: _merchantConfigSerialize,
  deserialize: _merchantConfigDeserialize,
  deserializeProp: _merchantConfigDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {
    r'FatherCateGory': FatherCateGorySchema,
    r'SubCateGory': SubCateGorySchema,
    r'Unit': UnitSchema
  },
  getId: _merchantConfigGetId,
  getLinks: _merchantConfigGetLinks,
  attach: _merchantConfigAttach,
  version: '3.1.0+1',
);

int _merchantConfigEstimateSize(
  MerchantConfig object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final list = object.fatherCateGorys;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[FatherCateGory]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount +=
              FatherCateGorySchema.estimateSize(value, offsets, allOffsets);
        }
      }
    }
  }
  return bytesCount;
}

void _merchantConfigSerialize(
  MerchantConfig object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObjectList<FatherCateGory>(
    offsets[0],
    allOffsets,
    FatherCateGorySchema.serialize,
    object.fatherCateGorys,
  );
}

MerchantConfig _merchantConfigDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = MerchantConfig();
  object.fatherCateGorys = reader.readObjectList<FatherCateGory>(
    offsets[0],
    FatherCateGorySchema.deserialize,
    allOffsets,
    FatherCateGory(),
  );
  object.id = id;
  return object;
}

P _merchantConfigDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectList<FatherCateGory>(
        offset,
        FatherCateGorySchema.deserialize,
        allOffsets,
        FatherCateGory(),
      )) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _merchantConfigGetId(MerchantConfig object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _merchantConfigGetLinks(MerchantConfig object) {
  return [];
}

void _merchantConfigAttach(
    IsarCollection<dynamic> col, Id id, MerchantConfig object) {
  object.id = id;
}

extension MerchantConfigQueryWhereSort
    on QueryBuilder<MerchantConfig, MerchantConfig, QWhere> {
  QueryBuilder<MerchantConfig, MerchantConfig, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension MerchantConfigQueryWhere
    on QueryBuilder<MerchantConfig, MerchantConfig, QWhereClause> {
  QueryBuilder<MerchantConfig, MerchantConfig, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<MerchantConfig, MerchantConfig, QAfterWhereClause> idNotEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<MerchantConfig, MerchantConfig, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<MerchantConfig, MerchantConfig, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<MerchantConfig, MerchantConfig, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension MerchantConfigQueryFilter
    on QueryBuilder<MerchantConfig, MerchantConfig, QFilterCondition> {
  QueryBuilder<MerchantConfig, MerchantConfig, QAfterFilterCondition>
      fatherCateGorysIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'fatherCateGorys',
      ));
    });
  }

  QueryBuilder<MerchantConfig, MerchantConfig, QAfterFilterCondition>
      fatherCateGorysIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'fatherCateGorys',
      ));
    });
  }

  QueryBuilder<MerchantConfig, MerchantConfig, QAfterFilterCondition>
      fatherCateGorysLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'fatherCateGorys',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<MerchantConfig, MerchantConfig, QAfterFilterCondition>
      fatherCateGorysIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'fatherCateGorys',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<MerchantConfig, MerchantConfig, QAfterFilterCondition>
      fatherCateGorysIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'fatherCateGorys',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<MerchantConfig, MerchantConfig, QAfterFilterCondition>
      fatherCateGorysLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'fatherCateGorys',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<MerchantConfig, MerchantConfig, QAfterFilterCondition>
      fatherCateGorysLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'fatherCateGorys',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<MerchantConfig, MerchantConfig, QAfterFilterCondition>
      fatherCateGorysLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'fatherCateGorys',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<MerchantConfig, MerchantConfig, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<MerchantConfig, MerchantConfig, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<MerchantConfig, MerchantConfig, QAfterFilterCondition>
      idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<MerchantConfig, MerchantConfig, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension MerchantConfigQueryObject
    on QueryBuilder<MerchantConfig, MerchantConfig, QFilterCondition> {
  QueryBuilder<MerchantConfig, MerchantConfig, QAfterFilterCondition>
      fatherCateGorysElement(FilterQuery<FatherCateGory> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'fatherCateGorys');
    });
  }
}

extension MerchantConfigQueryLinks
    on QueryBuilder<MerchantConfig, MerchantConfig, QFilterCondition> {}

extension MerchantConfigQuerySortBy
    on QueryBuilder<MerchantConfig, MerchantConfig, QSortBy> {}

extension MerchantConfigQuerySortThenBy
    on QueryBuilder<MerchantConfig, MerchantConfig, QSortThenBy> {
  QueryBuilder<MerchantConfig, MerchantConfig, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<MerchantConfig, MerchantConfig, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }
}

extension MerchantConfigQueryWhereDistinct
    on QueryBuilder<MerchantConfig, MerchantConfig, QDistinct> {}

extension MerchantConfigQueryProperty
    on QueryBuilder<MerchantConfig, MerchantConfig, QQueryProperty> {
  QueryBuilder<MerchantConfig, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<MerchantConfig, List<FatherCateGory>?, QQueryOperations>
      fatherCateGorysProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fatherCateGorys');
    });
  }
}

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const FatherCateGorySchema = Schema(
  name: r'FatherCateGory',
  id: -1138378668459021578,
  properties: {
    r'name': PropertySchema(
      id: 0,
      name: r'name',
      type: IsarType.string,
    ),
    r'subCateGorys': PropertySchema(
      id: 1,
      name: r'subCateGorys',
      type: IsarType.objectList,
      target: r'SubCateGory',
    )
  },
  estimateSize: _fatherCateGoryEstimateSize,
  serialize: _fatherCateGorySerialize,
  deserialize: _fatherCateGoryDeserialize,
  deserializeProp: _fatherCateGoryDeserializeProp,
);

int _fatherCateGoryEstimateSize(
  FatherCateGory object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.name;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final list = object.subCateGorys;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[SubCateGory]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount +=
              SubCateGorySchema.estimateSize(value, offsets, allOffsets);
        }
      }
    }
  }
  return bytesCount;
}

void _fatherCateGorySerialize(
  FatherCateGory object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.name);
  writer.writeObjectList<SubCateGory>(
    offsets[1],
    allOffsets,
    SubCateGorySchema.serialize,
    object.subCateGorys,
  );
}

FatherCateGory _fatherCateGoryDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = FatherCateGory();
  object.name = reader.readStringOrNull(offsets[0]);
  object.subCateGorys = reader.readObjectList<SubCateGory>(
    offsets[1],
    SubCateGorySchema.deserialize,
    allOffsets,
    SubCateGory(),
  );
  return object;
}

P _fatherCateGoryDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readObjectList<SubCateGory>(
        offset,
        SubCateGorySchema.deserialize,
        allOffsets,
        SubCateGory(),
      )) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension FatherCateGoryQueryFilter
    on QueryBuilder<FatherCateGory, FatherCateGory, QFilterCondition> {
  QueryBuilder<FatherCateGory, FatherCateGory, QAfterFilterCondition>
      nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<FatherCateGory, FatherCateGory, QAfterFilterCondition>
      nameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<FatherCateGory, FatherCateGory, QAfterFilterCondition>
      nameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FatherCateGory, FatherCateGory, QAfterFilterCondition>
      nameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FatherCateGory, FatherCateGory, QAfterFilterCondition>
      nameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FatherCateGory, FatherCateGory, QAfterFilterCondition>
      nameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FatherCateGory, FatherCateGory, QAfterFilterCondition>
      nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FatherCateGory, FatherCateGory, QAfterFilterCondition>
      nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FatherCateGory, FatherCateGory, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FatherCateGory, FatherCateGory, QAfterFilterCondition>
      nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FatherCateGory, FatherCateGory, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<FatherCateGory, FatherCateGory, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<FatherCateGory, FatherCateGory, QAfterFilterCondition>
      subCateGorysIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'subCateGorys',
      ));
    });
  }

  QueryBuilder<FatherCateGory, FatherCateGory, QAfterFilterCondition>
      subCateGorysIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'subCateGorys',
      ));
    });
  }

  QueryBuilder<FatherCateGory, FatherCateGory, QAfterFilterCondition>
      subCateGorysLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'subCateGorys',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<FatherCateGory, FatherCateGory, QAfterFilterCondition>
      subCateGorysIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'subCateGorys',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<FatherCateGory, FatherCateGory, QAfterFilterCondition>
      subCateGorysIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'subCateGorys',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<FatherCateGory, FatherCateGory, QAfterFilterCondition>
      subCateGorysLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'subCateGorys',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<FatherCateGory, FatherCateGory, QAfterFilterCondition>
      subCateGorysLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'subCateGorys',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<FatherCateGory, FatherCateGory, QAfterFilterCondition>
      subCateGorysLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'subCateGorys',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension FatherCateGoryQueryObject
    on QueryBuilder<FatherCateGory, FatherCateGory, QFilterCondition> {
  QueryBuilder<FatherCateGory, FatherCateGory, QAfterFilterCondition>
      subCateGorysElement(FilterQuery<SubCateGory> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'subCateGorys');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const SubCateGorySchema = Schema(
  name: r'SubCateGory',
  id: -5456565368808082475,
  properties: {
    r'imagePath': PropertySchema(
      id: 0,
      name: r'imagePath',
      type: IsarType.string,
    ),
    r'name': PropertySchema(
      id: 1,
      name: r'name',
      type: IsarType.string,
    ),
    r'units': PropertySchema(
      id: 2,
      name: r'units',
      type: IsarType.objectList,
      target: r'Unit',
    )
  },
  estimateSize: _subCateGoryEstimateSize,
  serialize: _subCateGorySerialize,
  deserialize: _subCateGoryDeserialize,
  deserializeProp: _subCateGoryDeserializeProp,
);

int _subCateGoryEstimateSize(
  SubCateGory object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.imagePath;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.name;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final list = object.units;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[Unit]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += UnitSchema.estimateSize(value, offsets, allOffsets);
        }
      }
    }
  }
  return bytesCount;
}

void _subCateGorySerialize(
  SubCateGory object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.imagePath);
  writer.writeString(offsets[1], object.name);
  writer.writeObjectList<Unit>(
    offsets[2],
    allOffsets,
    UnitSchema.serialize,
    object.units,
  );
}

SubCateGory _subCateGoryDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = SubCateGory();
  object.imagePath = reader.readStringOrNull(offsets[0]);
  object.name = reader.readStringOrNull(offsets[1]);
  object.units = reader.readObjectList<Unit>(
    offsets[2],
    UnitSchema.deserialize,
    allOffsets,
    Unit(),
  );
  return object;
}

P _subCateGoryDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readObjectList<Unit>(
        offset,
        UnitSchema.deserialize,
        allOffsets,
        Unit(),
      )) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension SubCateGoryQueryFilter
    on QueryBuilder<SubCateGory, SubCateGory, QFilterCondition> {
  QueryBuilder<SubCateGory, SubCateGory, QAfterFilterCondition>
      imagePathIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'imagePath',
      ));
    });
  }

  QueryBuilder<SubCateGory, SubCateGory, QAfterFilterCondition>
      imagePathIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'imagePath',
      ));
    });
  }

  QueryBuilder<SubCateGory, SubCateGory, QAfterFilterCondition>
      imagePathEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imagePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SubCateGory, SubCateGory, QAfterFilterCondition>
      imagePathGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'imagePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SubCateGory, SubCateGory, QAfterFilterCondition>
      imagePathLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'imagePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SubCateGory, SubCateGory, QAfterFilterCondition>
      imagePathBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'imagePath',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SubCateGory, SubCateGory, QAfterFilterCondition>
      imagePathStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'imagePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SubCateGory, SubCateGory, QAfterFilterCondition>
      imagePathEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'imagePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SubCateGory, SubCateGory, QAfterFilterCondition>
      imagePathContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'imagePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SubCateGory, SubCateGory, QAfterFilterCondition>
      imagePathMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'imagePath',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SubCateGory, SubCateGory, QAfterFilterCondition>
      imagePathIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imagePath',
        value: '',
      ));
    });
  }

  QueryBuilder<SubCateGory, SubCateGory, QAfterFilterCondition>
      imagePathIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'imagePath',
        value: '',
      ));
    });
  }

  QueryBuilder<SubCateGory, SubCateGory, QAfterFilterCondition> nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<SubCateGory, SubCateGory, QAfterFilterCondition>
      nameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<SubCateGory, SubCateGory, QAfterFilterCondition> nameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SubCateGory, SubCateGory, QAfterFilterCondition> nameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SubCateGory, SubCateGory, QAfterFilterCondition> nameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SubCateGory, SubCateGory, QAfterFilterCondition> nameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SubCateGory, SubCateGory, QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SubCateGory, SubCateGory, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SubCateGory, SubCateGory, QAfterFilterCondition> nameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SubCateGory, SubCateGory, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SubCateGory, SubCateGory, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<SubCateGory, SubCateGory, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<SubCateGory, SubCateGory, QAfterFilterCondition> unitsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'units',
      ));
    });
  }

  QueryBuilder<SubCateGory, SubCateGory, QAfterFilterCondition>
      unitsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'units',
      ));
    });
  }

  QueryBuilder<SubCateGory, SubCateGory, QAfterFilterCondition>
      unitsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'units',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<SubCateGory, SubCateGory, QAfterFilterCondition> unitsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'units',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<SubCateGory, SubCateGory, QAfterFilterCondition>
      unitsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'units',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<SubCateGory, SubCateGory, QAfterFilterCondition>
      unitsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'units',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<SubCateGory, SubCateGory, QAfterFilterCondition>
      unitsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'units',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<SubCateGory, SubCateGory, QAfterFilterCondition>
      unitsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'units',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension SubCateGoryQueryObject
    on QueryBuilder<SubCateGory, SubCateGory, QFilterCondition> {
  QueryBuilder<SubCateGory, SubCateGory, QAfterFilterCondition> unitsElement(
      FilterQuery<Unit> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'units');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const UnitSchema = Schema(
  name: r'Unit',
  id: 5852079958688209740,
  properties: {
    r'name': PropertySchema(
      id: 0,
      name: r'name',
      type: IsarType.string,
    ),
    r'price': PropertySchema(
      id: 1,
      name: r'price',
      type: IsarType.double,
    )
  },
  estimateSize: _unitEstimateSize,
  serialize: _unitSerialize,
  deserialize: _unitDeserialize,
  deserializeProp: _unitDeserializeProp,
);

int _unitEstimateSize(
  Unit object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.name;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _unitSerialize(
  Unit object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.name);
  writer.writeDouble(offsets[1], object.price);
}

Unit _unitDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Unit();
  object.name = reader.readStringOrNull(offsets[0]);
  object.price = reader.readDoubleOrNull(offsets[1]);
  return object;
}

P _unitDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readDoubleOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension UnitQueryFilter on QueryBuilder<Unit, Unit, QFilterCondition> {
  QueryBuilder<Unit, Unit, QAfterFilterCondition> nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<Unit, Unit, QAfterFilterCondition> nameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<Unit, Unit, QAfterFilterCondition> nameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Unit, Unit, QAfterFilterCondition> nameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Unit, Unit, QAfterFilterCondition> nameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Unit, Unit, QAfterFilterCondition> nameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Unit, Unit, QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Unit, Unit, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Unit, Unit, QAfterFilterCondition> nameContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Unit, Unit, QAfterFilterCondition> nameMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Unit, Unit, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Unit, Unit, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Unit, Unit, QAfterFilterCondition> priceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'price',
      ));
    });
  }

  QueryBuilder<Unit, Unit, QAfterFilterCondition> priceIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'price',
      ));
    });
  }

  QueryBuilder<Unit, Unit, QAfterFilterCondition> priceEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'price',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Unit, Unit, QAfterFilterCondition> priceGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'price',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Unit, Unit, QAfterFilterCondition> priceLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'price',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Unit, Unit, QAfterFilterCondition> priceBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'price',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension UnitQueryObject on QueryBuilder<Unit, Unit, QFilterCondition> {}
