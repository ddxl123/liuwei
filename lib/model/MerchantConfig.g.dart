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
    ),
    r'isShowImage': PropertySchema(
      id: 1,
      name: r'isShowImage',
      type: IsarType.bool,
    ),
    r'merchantName': PropertySchema(
      id: 2,
      name: r'merchantName',
      type: IsarType.string,
    ),
    r'pickupCode': PropertySchema(
      id: 3,
      name: r'pickupCode',
      type: IsarType.object,
      target: r'PickupCode',
    ),
    r'printContents': PropertySchema(
      id: 4,
      name: r'printContents',
      type: IsarType.byteList,
      enumMap: _MerchantConfigprintContentsEnumValueMap,
    ),
    r'tableNums': PropertySchema(
      id: 5,
      name: r'tableNums',
      type: IsarType.stringList,
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
    r'Unit': UnitSchema,
    r'PickupCode': PickupCodeSchema
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
  bytesCount += 3 + object.fatherCateGorys.length * 3;
  {
    final offsets = allOffsets[FatherCateGory]!;
    for (var i = 0; i < object.fatherCateGorys.length; i++) {
      final value = object.fatherCateGorys[i];
      bytesCount +=
          FatherCateGorySchema.estimateSize(value, offsets, allOffsets);
    }
  }
  bytesCount += 3 + object.merchantName.length * 3;
  {
    final value = object.pickupCode;
    if (value != null) {
      bytesCount += 3 +
          PickupCodeSchema.estimateSize(
              value, allOffsets[PickupCode]!, allOffsets);
    }
  }
  bytesCount += 3 + object.printContents.length;
  {
    final list = object.tableNums;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += value.length * 3;
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
  writer.writeBool(offsets[1], object.isShowImage);
  writer.writeString(offsets[2], object.merchantName);
  writer.writeObject<PickupCode>(
    offsets[3],
    allOffsets,
    PickupCodeSchema.serialize,
    object.pickupCode,
  );
  writer.writeByteList(
      offsets[4], object.printContents.map((e) => e.index).toList());
  writer.writeStringList(offsets[5], object.tableNums);
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
      ) ??
      [];
  object.id = id;
  object.isShowImage = reader.readBool(offsets[1]);
  object.merchantName = reader.readString(offsets[2]);
  object.pickupCode = reader.readObjectOrNull<PickupCode>(
    offsets[3],
    PickupCodeSchema.deserialize,
    allOffsets,
  );
  object.printContents = reader
          .readByteList(offsets[4])
          ?.map((e) =>
              _MerchantConfigprintContentsValueEnumMap[e] ??
              PrintContent.merchantName)
          .toList() ??
      [];
  object.tableNums = reader.readStringList(offsets[5]);
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
          ) ??
          []) as P;
    case 1:
      return (reader.readBool(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readObjectOrNull<PickupCode>(
        offset,
        PickupCodeSchema.deserialize,
        allOffsets,
      )) as P;
    case 4:
      return (reader
              .readByteList(offset)
              ?.map((e) =>
                  _MerchantConfigprintContentsValueEnumMap[e] ??
                  PrintContent.merchantName)
              .toList() ??
          []) as P;
    case 5:
      return (reader.readStringList(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _MerchantConfigprintContentsEnumValueMap = {
  'merchantName': 0,
  'firstOrderTime': 1,
  'completedOrderTime': 2,
  'tableNum': 3,
  'pickupCode': 4,
  'extraPrice': 5,
  'paidPrice': 6,
  'shouldPrice': 7,
};
const _MerchantConfigprintContentsValueEnumMap = {
  0: PrintContent.merchantName,
  1: PrintContent.firstOrderTime,
  2: PrintContent.completedOrderTime,
  3: PrintContent.tableNum,
  4: PrintContent.pickupCode,
  5: PrintContent.extraPrice,
  6: PrintContent.paidPrice,
  7: PrintContent.shouldPrice,
};

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

  QueryBuilder<MerchantConfig, MerchantConfig, QAfterFilterCondition>
      isShowImageEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isShowImage',
        value: value,
      ));
    });
  }

  QueryBuilder<MerchantConfig, MerchantConfig, QAfterFilterCondition>
      merchantNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'merchantName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MerchantConfig, MerchantConfig, QAfterFilterCondition>
      merchantNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'merchantName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MerchantConfig, MerchantConfig, QAfterFilterCondition>
      merchantNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'merchantName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MerchantConfig, MerchantConfig, QAfterFilterCondition>
      merchantNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'merchantName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MerchantConfig, MerchantConfig, QAfterFilterCondition>
      merchantNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'merchantName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MerchantConfig, MerchantConfig, QAfterFilterCondition>
      merchantNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'merchantName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MerchantConfig, MerchantConfig, QAfterFilterCondition>
      merchantNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'merchantName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MerchantConfig, MerchantConfig, QAfterFilterCondition>
      merchantNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'merchantName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MerchantConfig, MerchantConfig, QAfterFilterCondition>
      merchantNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'merchantName',
        value: '',
      ));
    });
  }

  QueryBuilder<MerchantConfig, MerchantConfig, QAfterFilterCondition>
      merchantNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'merchantName',
        value: '',
      ));
    });
  }

  QueryBuilder<MerchantConfig, MerchantConfig, QAfterFilterCondition>
      pickupCodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'pickupCode',
      ));
    });
  }

  QueryBuilder<MerchantConfig, MerchantConfig, QAfterFilterCondition>
      pickupCodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'pickupCode',
      ));
    });
  }

  QueryBuilder<MerchantConfig, MerchantConfig, QAfterFilterCondition>
      printContentsElementEqualTo(PrintContent value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'printContents',
        value: value,
      ));
    });
  }

  QueryBuilder<MerchantConfig, MerchantConfig, QAfterFilterCondition>
      printContentsElementGreaterThan(
    PrintContent value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'printContents',
        value: value,
      ));
    });
  }

  QueryBuilder<MerchantConfig, MerchantConfig, QAfterFilterCondition>
      printContentsElementLessThan(
    PrintContent value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'printContents',
        value: value,
      ));
    });
  }

  QueryBuilder<MerchantConfig, MerchantConfig, QAfterFilterCondition>
      printContentsElementBetween(
    PrintContent lower,
    PrintContent upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'printContents',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MerchantConfig, MerchantConfig, QAfterFilterCondition>
      printContentsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'printContents',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<MerchantConfig, MerchantConfig, QAfterFilterCondition>
      printContentsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'printContents',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<MerchantConfig, MerchantConfig, QAfterFilterCondition>
      printContentsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'printContents',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<MerchantConfig, MerchantConfig, QAfterFilterCondition>
      printContentsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'printContents',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<MerchantConfig, MerchantConfig, QAfterFilterCondition>
      printContentsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'printContents',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<MerchantConfig, MerchantConfig, QAfterFilterCondition>
      printContentsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'printContents',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<MerchantConfig, MerchantConfig, QAfterFilterCondition>
      tableNumsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'tableNums',
      ));
    });
  }

  QueryBuilder<MerchantConfig, MerchantConfig, QAfterFilterCondition>
      tableNumsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'tableNums',
      ));
    });
  }

  QueryBuilder<MerchantConfig, MerchantConfig, QAfterFilterCondition>
      tableNumsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tableNums',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MerchantConfig, MerchantConfig, QAfterFilterCondition>
      tableNumsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tableNums',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MerchantConfig, MerchantConfig, QAfterFilterCondition>
      tableNumsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tableNums',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MerchantConfig, MerchantConfig, QAfterFilterCondition>
      tableNumsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tableNums',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MerchantConfig, MerchantConfig, QAfterFilterCondition>
      tableNumsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'tableNums',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MerchantConfig, MerchantConfig, QAfterFilterCondition>
      tableNumsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'tableNums',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MerchantConfig, MerchantConfig, QAfterFilterCondition>
      tableNumsElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'tableNums',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MerchantConfig, MerchantConfig, QAfterFilterCondition>
      tableNumsElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'tableNums',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MerchantConfig, MerchantConfig, QAfterFilterCondition>
      tableNumsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tableNums',
        value: '',
      ));
    });
  }

  QueryBuilder<MerchantConfig, MerchantConfig, QAfterFilterCondition>
      tableNumsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'tableNums',
        value: '',
      ));
    });
  }

  QueryBuilder<MerchantConfig, MerchantConfig, QAfterFilterCondition>
      tableNumsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tableNums',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<MerchantConfig, MerchantConfig, QAfterFilterCondition>
      tableNumsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tableNums',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<MerchantConfig, MerchantConfig, QAfterFilterCondition>
      tableNumsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tableNums',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<MerchantConfig, MerchantConfig, QAfterFilterCondition>
      tableNumsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tableNums',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<MerchantConfig, MerchantConfig, QAfterFilterCondition>
      tableNumsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tableNums',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<MerchantConfig, MerchantConfig, QAfterFilterCondition>
      tableNumsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tableNums',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
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

  QueryBuilder<MerchantConfig, MerchantConfig, QAfterFilterCondition>
      pickupCode(FilterQuery<PickupCode> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'pickupCode');
    });
  }
}

extension MerchantConfigQueryLinks
    on QueryBuilder<MerchantConfig, MerchantConfig, QFilterCondition> {}

extension MerchantConfigQuerySortBy
    on QueryBuilder<MerchantConfig, MerchantConfig, QSortBy> {
  QueryBuilder<MerchantConfig, MerchantConfig, QAfterSortBy>
      sortByIsShowImage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isShowImage', Sort.asc);
    });
  }

  QueryBuilder<MerchantConfig, MerchantConfig, QAfterSortBy>
      sortByIsShowImageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isShowImage', Sort.desc);
    });
  }

  QueryBuilder<MerchantConfig, MerchantConfig, QAfterSortBy>
      sortByMerchantName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'merchantName', Sort.asc);
    });
  }

  QueryBuilder<MerchantConfig, MerchantConfig, QAfterSortBy>
      sortByMerchantNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'merchantName', Sort.desc);
    });
  }
}

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

  QueryBuilder<MerchantConfig, MerchantConfig, QAfterSortBy>
      thenByIsShowImage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isShowImage', Sort.asc);
    });
  }

  QueryBuilder<MerchantConfig, MerchantConfig, QAfterSortBy>
      thenByIsShowImageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isShowImage', Sort.desc);
    });
  }

  QueryBuilder<MerchantConfig, MerchantConfig, QAfterSortBy>
      thenByMerchantName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'merchantName', Sort.asc);
    });
  }

  QueryBuilder<MerchantConfig, MerchantConfig, QAfterSortBy>
      thenByMerchantNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'merchantName', Sort.desc);
    });
  }
}

extension MerchantConfigQueryWhereDistinct
    on QueryBuilder<MerchantConfig, MerchantConfig, QDistinct> {
  QueryBuilder<MerchantConfig, MerchantConfig, QDistinct>
      distinctByIsShowImage() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isShowImage');
    });
  }

  QueryBuilder<MerchantConfig, MerchantConfig, QDistinct>
      distinctByMerchantName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'merchantName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MerchantConfig, MerchantConfig, QDistinct>
      distinctByPrintContents() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'printContents');
    });
  }

  QueryBuilder<MerchantConfig, MerchantConfig, QDistinct>
      distinctByTableNums() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tableNums');
    });
  }
}

extension MerchantConfigQueryProperty
    on QueryBuilder<MerchantConfig, MerchantConfig, QQueryProperty> {
  QueryBuilder<MerchantConfig, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<MerchantConfig, List<FatherCateGory>, QQueryOperations>
      fatherCateGorysProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fatherCateGorys');
    });
  }

  QueryBuilder<MerchantConfig, bool, QQueryOperations> isShowImageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isShowImage');
    });
  }

  QueryBuilder<MerchantConfig, String, QQueryOperations>
      merchantNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'merchantName');
    });
  }

  QueryBuilder<MerchantConfig, PickupCode?, QQueryOperations>
      pickupCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pickupCode');
    });
  }

  QueryBuilder<MerchantConfig, List<PrintContent>, QQueryOperations>
      printContentsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'printContents');
    });
  }

  QueryBuilder<MerchantConfig, List<String>?, QQueryOperations>
      tableNumsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tableNums');
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
    r'id': PropertySchema(
      id: 0,
      name: r'id',
      type: IsarType.string,
    ),
    r'name': PropertySchema(
      id: 1,
      name: r'name',
      type: IsarType.string,
    ),
    r'subCateGorys': PropertySchema(
      id: 2,
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
  bytesCount += 3 + object.id.length * 3;
  bytesCount += 3 + object.name.length * 3;
  bytesCount += 3 + object.subCateGorys.length * 3;
  {
    final offsets = allOffsets[SubCateGory]!;
    for (var i = 0; i < object.subCateGorys.length; i++) {
      final value = object.subCateGorys[i];
      bytesCount += SubCateGorySchema.estimateSize(value, offsets, allOffsets);
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
  writer.writeString(offsets[0], object.id);
  writer.writeString(offsets[1], object.name);
  writer.writeObjectList<SubCateGory>(
    offsets[2],
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
  object.id = reader.readString(offsets[0]);
  object.name = reader.readString(offsets[1]);
  object.subCateGorys = reader.readObjectList<SubCateGory>(
        offsets[2],
        SubCateGorySchema.deserialize,
        allOffsets,
        SubCateGory(),
      ) ??
      [];
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
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readObjectList<SubCateGory>(
            offset,
            SubCateGorySchema.deserialize,
            allOffsets,
            SubCateGory(),
          ) ??
          []) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension FatherCateGoryQueryFilter
    on QueryBuilder<FatherCateGory, FatherCateGory, QFilterCondition> {
  QueryBuilder<FatherCateGory, FatherCateGory, QAfterFilterCondition> idEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FatherCateGory, FatherCateGory, QAfterFilterCondition>
      idGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FatherCateGory, FatherCateGory, QAfterFilterCondition>
      idLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FatherCateGory, FatherCateGory, QAfterFilterCondition> idBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FatherCateGory, FatherCateGory, QAfterFilterCondition>
      idStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FatherCateGory, FatherCateGory, QAfterFilterCondition>
      idEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FatherCateGory, FatherCateGory, QAfterFilterCondition>
      idContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FatherCateGory, FatherCateGory, QAfterFilterCondition> idMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'id',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FatherCateGory, FatherCateGory, QAfterFilterCondition>
      idIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: '',
      ));
    });
  }

  QueryBuilder<FatherCateGory, FatherCateGory, QAfterFilterCondition>
      idIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'id',
        value: '',
      ));
    });
  }

  QueryBuilder<FatherCateGory, FatherCateGory, QAfterFilterCondition>
      nameEqualTo(
    String value, {
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
    String value, {
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
    String value, {
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
    String lower,
    String upper, {
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
    r'id': PropertySchema(
      id: 0,
      name: r'id',
      type: IsarType.string,
    ),
    r'imagePath': PropertySchema(
      id: 1,
      name: r'imagePath',
      type: IsarType.string,
    ),
    r'name': PropertySchema(
      id: 2,
      name: r'name',
      type: IsarType.string,
    ),
    r'units': PropertySchema(
      id: 3,
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
  bytesCount += 3 + object.id.length * 3;
  {
    final value = object.imagePath;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.name.length * 3;
  bytesCount += 3 + object.units.length * 3;
  {
    final offsets = allOffsets[Unit]!;
    for (var i = 0; i < object.units.length; i++) {
      final value = object.units[i];
      bytesCount += UnitSchema.estimateSize(value, offsets, allOffsets);
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
  writer.writeString(offsets[0], object.id);
  writer.writeString(offsets[1], object.imagePath);
  writer.writeString(offsets[2], object.name);
  writer.writeObjectList<Unit>(
    offsets[3],
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
  object.id = reader.readString(offsets[0]);
  object.imagePath = reader.readStringOrNull(offsets[1]);
  object.name = reader.readString(offsets[2]);
  object.units = reader.readObjectList<Unit>(
        offsets[3],
        UnitSchema.deserialize,
        allOffsets,
        Unit(),
      ) ??
      [];
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
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readObjectList<Unit>(
            offset,
            UnitSchema.deserialize,
            allOffsets,
            Unit(),
          ) ??
          []) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension SubCateGoryQueryFilter
    on QueryBuilder<SubCateGory, SubCateGory, QFilterCondition> {
  QueryBuilder<SubCateGory, SubCateGory, QAfterFilterCondition> idEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SubCateGory, SubCateGory, QAfterFilterCondition> idGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SubCateGory, SubCateGory, QAfterFilterCondition> idLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SubCateGory, SubCateGory, QAfterFilterCondition> idBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SubCateGory, SubCateGory, QAfterFilterCondition> idStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SubCateGory, SubCateGory, QAfterFilterCondition> idEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SubCateGory, SubCateGory, QAfterFilterCondition> idContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SubCateGory, SubCateGory, QAfterFilterCondition> idMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'id',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SubCateGory, SubCateGory, QAfterFilterCondition> idIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: '',
      ));
    });
  }

  QueryBuilder<SubCateGory, SubCateGory, QAfterFilterCondition> idIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'id',
        value: '',
      ));
    });
  }

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

  QueryBuilder<SubCateGory, SubCateGory, QAfterFilterCondition> nameEqualTo(
    String value, {
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
    String value, {
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
    String value, {
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
    String lower,
    String upper, {
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
    r'fatherCateGoryId': PropertySchema(
      id: 0,
      name: r'fatherCateGoryId',
      type: IsarType.string,
    ),
    r'id': PropertySchema(
      id: 1,
      name: r'id',
      type: IsarType.string,
    ),
    r'name': PropertySchema(
      id: 2,
      name: r'name',
      type: IsarType.string,
    ),
    r'price': PropertySchema(
      id: 3,
      name: r'price',
      type: IsarType.double,
    ),
    r'subCateGoryId': PropertySchema(
      id: 4,
      name: r'subCateGoryId',
      type: IsarType.string,
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
    final value = object.fatherCateGoryId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.id.length * 3;
  bytesCount += 3 + object.name.length * 3;
  {
    final value = object.subCateGoryId;
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
  writer.writeString(offsets[0], object.fatherCateGoryId);
  writer.writeString(offsets[1], object.id);
  writer.writeString(offsets[2], object.name);
  writer.writeDouble(offsets[3], object.price);
  writer.writeString(offsets[4], object.subCateGoryId);
}

Unit _unitDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Unit();
  object.fatherCateGoryId = reader.readStringOrNull(offsets[0]);
  object.id = reader.readString(offsets[1]);
  object.name = reader.readString(offsets[2]);
  object.price = reader.readDouble(offsets[3]);
  object.subCateGoryId = reader.readStringOrNull(offsets[4]);
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
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readDouble(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension UnitQueryFilter on QueryBuilder<Unit, Unit, QFilterCondition> {
  QueryBuilder<Unit, Unit, QAfterFilterCondition> fatherCateGoryIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'fatherCateGoryId',
      ));
    });
  }

  QueryBuilder<Unit, Unit, QAfterFilterCondition> fatherCateGoryIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'fatherCateGoryId',
      ));
    });
  }

  QueryBuilder<Unit, Unit, QAfterFilterCondition> fatherCateGoryIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fatherCateGoryId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Unit, Unit, QAfterFilterCondition> fatherCateGoryIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fatherCateGoryId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Unit, Unit, QAfterFilterCondition> fatherCateGoryIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fatherCateGoryId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Unit, Unit, QAfterFilterCondition> fatherCateGoryIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fatherCateGoryId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Unit, Unit, QAfterFilterCondition> fatherCateGoryIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'fatherCateGoryId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Unit, Unit, QAfterFilterCondition> fatherCateGoryIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'fatherCateGoryId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Unit, Unit, QAfterFilterCondition> fatherCateGoryIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'fatherCateGoryId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Unit, Unit, QAfterFilterCondition> fatherCateGoryIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'fatherCateGoryId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Unit, Unit, QAfterFilterCondition> fatherCateGoryIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fatherCateGoryId',
        value: '',
      ));
    });
  }

  QueryBuilder<Unit, Unit, QAfterFilterCondition> fatherCateGoryIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'fatherCateGoryId',
        value: '',
      ));
    });
  }

  QueryBuilder<Unit, Unit, QAfterFilterCondition> idEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Unit, Unit, QAfterFilterCondition> idGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Unit, Unit, QAfterFilterCondition> idLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Unit, Unit, QAfterFilterCondition> idBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Unit, Unit, QAfterFilterCondition> idStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Unit, Unit, QAfterFilterCondition> idEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Unit, Unit, QAfterFilterCondition> idContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Unit, Unit, QAfterFilterCondition> idMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'id',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Unit, Unit, QAfterFilterCondition> idIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: '',
      ));
    });
  }

  QueryBuilder<Unit, Unit, QAfterFilterCondition> idIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'id',
        value: '',
      ));
    });
  }

  QueryBuilder<Unit, Unit, QAfterFilterCondition> nameEqualTo(
    String value, {
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
    String value, {
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
    String value, {
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
    String lower,
    String upper, {
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

  QueryBuilder<Unit, Unit, QAfterFilterCondition> priceEqualTo(
    double value, {
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
    double value, {
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
    double value, {
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
    double lower,
    double upper, {
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

  QueryBuilder<Unit, Unit, QAfterFilterCondition> subCateGoryIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'subCateGoryId',
      ));
    });
  }

  QueryBuilder<Unit, Unit, QAfterFilterCondition> subCateGoryIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'subCateGoryId',
      ));
    });
  }

  QueryBuilder<Unit, Unit, QAfterFilterCondition> subCateGoryIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'subCateGoryId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Unit, Unit, QAfterFilterCondition> subCateGoryIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'subCateGoryId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Unit, Unit, QAfterFilterCondition> subCateGoryIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'subCateGoryId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Unit, Unit, QAfterFilterCondition> subCateGoryIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'subCateGoryId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Unit, Unit, QAfterFilterCondition> subCateGoryIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'subCateGoryId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Unit, Unit, QAfterFilterCondition> subCateGoryIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'subCateGoryId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Unit, Unit, QAfterFilterCondition> subCateGoryIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'subCateGoryId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Unit, Unit, QAfterFilterCondition> subCateGoryIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'subCateGoryId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Unit, Unit, QAfterFilterCondition> subCateGoryIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'subCateGoryId',
        value: '',
      ));
    });
  }

  QueryBuilder<Unit, Unit, QAfterFilterCondition> subCateGoryIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'subCateGoryId',
        value: '',
      ));
    });
  }
}

extension UnitQueryObject on QueryBuilder<Unit, Unit, QFilterCondition> {}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const PickupCodeSchema = Schema(
  name: r'PickupCode',
  id: -8955708351987342450,
  properties: {
    r'deviceCode': PropertySchema(
      id: 0,
      name: r'deviceCode',
      type: IsarType.long,
    ),
    r'isResetAfter4': PropertySchema(
      id: 1,
      name: r'isResetAfter4',
      type: IsarType.bool,
    ),
    r'nextCode': PropertySchema(
      id: 2,
      name: r'nextCode',
      type: IsarType.long,
    )
  },
  estimateSize: _pickupCodeEstimateSize,
  serialize: _pickupCodeSerialize,
  deserialize: _pickupCodeDeserialize,
  deserializeProp: _pickupCodeDeserializeProp,
);

int _pickupCodeEstimateSize(
  PickupCode object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _pickupCodeSerialize(
  PickupCode object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.deviceCode);
  writer.writeBool(offsets[1], object.isResetAfter4);
  writer.writeLong(offsets[2], object.nextCode);
}

PickupCode _pickupCodeDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = PickupCode();
  object.deviceCode = reader.readLong(offsets[0]);
  object.isResetAfter4 = reader.readBool(offsets[1]);
  object.nextCode = reader.readLong(offsets[2]);
  return object;
}

P _pickupCodeDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readBool(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension PickupCodeQueryFilter
    on QueryBuilder<PickupCode, PickupCode, QFilterCondition> {
  QueryBuilder<PickupCode, PickupCode, QAfterFilterCondition> deviceCodeEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deviceCode',
        value: value,
      ));
    });
  }

  QueryBuilder<PickupCode, PickupCode, QAfterFilterCondition>
      deviceCodeGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'deviceCode',
        value: value,
      ));
    });
  }

  QueryBuilder<PickupCode, PickupCode, QAfterFilterCondition>
      deviceCodeLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'deviceCode',
        value: value,
      ));
    });
  }

  QueryBuilder<PickupCode, PickupCode, QAfterFilterCondition> deviceCodeBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'deviceCode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PickupCode, PickupCode, QAfterFilterCondition>
      isResetAfter4EqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isResetAfter4',
        value: value,
      ));
    });
  }

  QueryBuilder<PickupCode, PickupCode, QAfterFilterCondition> nextCodeEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nextCode',
        value: value,
      ));
    });
  }

  QueryBuilder<PickupCode, PickupCode, QAfterFilterCondition>
      nextCodeGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'nextCode',
        value: value,
      ));
    });
  }

  QueryBuilder<PickupCode, PickupCode, QAfterFilterCondition> nextCodeLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'nextCode',
        value: value,
      ));
    });
  }

  QueryBuilder<PickupCode, PickupCode, QAfterFilterCondition> nextCodeBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'nextCode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension PickupCodeQueryObject
    on QueryBuilder<PickupCode, PickupCode, QFilterCondition> {}
