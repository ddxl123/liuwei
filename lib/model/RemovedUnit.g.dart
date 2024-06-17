// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'RemovedUnit.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetRemovedUnitCollection on Isar {
  IsarCollection<RemovedUnit> get removedUnits => this.collection();
}

const RemovedUnitSchema = CollectionSchema(
  name: r'RemovedUnit',
  id: -1568377429776510546,
  properties: {
    r'fatherCateGoryName': PropertySchema(
      id: 0,
      name: r'fatherCateGoryName',
      type: IsarType.string,
    ),
    r'name': PropertySchema(
      id: 1,
      name: r'name',
      type: IsarType.string,
    ),
    r'price': PropertySchema(
      id: 2,
      name: r'price',
      type: IsarType.double,
    ),
    r'subCateGoryName': PropertySchema(
      id: 3,
      name: r'subCateGoryName',
      type: IsarType.string,
    ),
    r'unitId': PropertySchema(
      id: 4,
      name: r'unitId',
      type: IsarType.string,
    )
  },
  estimateSize: _removedUnitEstimateSize,
  serialize: _removedUnitSerialize,
  deserialize: _removedUnitDeserialize,
  deserializeProp: _removedUnitDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _removedUnitGetId,
  getLinks: _removedUnitGetLinks,
  attach: _removedUnitAttach,
  version: '3.1.0+1',
);

int _removedUnitEstimateSize(
  RemovedUnit object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.fatherCateGoryName.length * 3;
  bytesCount += 3 + object.name.length * 3;
  bytesCount += 3 + object.subCateGoryName.length * 3;
  {
    final value = object.unitId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _removedUnitSerialize(
  RemovedUnit object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.fatherCateGoryName);
  writer.writeString(offsets[1], object.name);
  writer.writeDouble(offsets[2], object.price);
  writer.writeString(offsets[3], object.subCateGoryName);
  writer.writeString(offsets[4], object.unitId);
}

RemovedUnit _removedUnitDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = RemovedUnit();
  object.fatherCateGoryName = reader.readString(offsets[0]);
  object.id = id;
  object.name = reader.readString(offsets[1]);
  object.price = reader.readDouble(offsets[2]);
  object.subCateGoryName = reader.readString(offsets[3]);
  object.unitId = reader.readStringOrNull(offsets[4]);
  return object;
}

P _removedUnitDeserializeProp<P>(
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
      return (reader.readDouble(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _removedUnitGetId(RemovedUnit object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _removedUnitGetLinks(RemovedUnit object) {
  return [];
}

void _removedUnitAttach(
    IsarCollection<dynamic> col, Id id, RemovedUnit object) {
  object.id = id;
}

extension RemovedUnitQueryWhereSort
    on QueryBuilder<RemovedUnit, RemovedUnit, QWhere> {
  QueryBuilder<RemovedUnit, RemovedUnit, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension RemovedUnitQueryWhere
    on QueryBuilder<RemovedUnit, RemovedUnit, QWhereClause> {
  QueryBuilder<RemovedUnit, RemovedUnit, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<RemovedUnit, RemovedUnit, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<RemovedUnit, RemovedUnit, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<RemovedUnit, RemovedUnit, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<RemovedUnit, RemovedUnit, QAfterWhereClause> idBetween(
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

extension RemovedUnitQueryFilter
    on QueryBuilder<RemovedUnit, RemovedUnit, QFilterCondition> {
  QueryBuilder<RemovedUnit, RemovedUnit, QAfterFilterCondition>
      fatherCateGoryNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fatherCateGoryName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RemovedUnit, RemovedUnit, QAfterFilterCondition>
      fatherCateGoryNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fatherCateGoryName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RemovedUnit, RemovedUnit, QAfterFilterCondition>
      fatherCateGoryNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fatherCateGoryName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RemovedUnit, RemovedUnit, QAfterFilterCondition>
      fatherCateGoryNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fatherCateGoryName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RemovedUnit, RemovedUnit, QAfterFilterCondition>
      fatherCateGoryNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'fatherCateGoryName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RemovedUnit, RemovedUnit, QAfterFilterCondition>
      fatherCateGoryNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'fatherCateGoryName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RemovedUnit, RemovedUnit, QAfterFilterCondition>
      fatherCateGoryNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'fatherCateGoryName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RemovedUnit, RemovedUnit, QAfterFilterCondition>
      fatherCateGoryNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'fatherCateGoryName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RemovedUnit, RemovedUnit, QAfterFilterCondition>
      fatherCateGoryNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fatherCateGoryName',
        value: '',
      ));
    });
  }

  QueryBuilder<RemovedUnit, RemovedUnit, QAfterFilterCondition>
      fatherCateGoryNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'fatherCateGoryName',
        value: '',
      ));
    });
  }

  QueryBuilder<RemovedUnit, RemovedUnit, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<RemovedUnit, RemovedUnit, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<RemovedUnit, RemovedUnit, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<RemovedUnit, RemovedUnit, QAfterFilterCondition> idBetween(
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

  QueryBuilder<RemovedUnit, RemovedUnit, QAfterFilterCondition> nameEqualTo(
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

  QueryBuilder<RemovedUnit, RemovedUnit, QAfterFilterCondition> nameGreaterThan(
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

  QueryBuilder<RemovedUnit, RemovedUnit, QAfterFilterCondition> nameLessThan(
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

  QueryBuilder<RemovedUnit, RemovedUnit, QAfterFilterCondition> nameBetween(
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

  QueryBuilder<RemovedUnit, RemovedUnit, QAfterFilterCondition> nameStartsWith(
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

  QueryBuilder<RemovedUnit, RemovedUnit, QAfterFilterCondition> nameEndsWith(
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

  QueryBuilder<RemovedUnit, RemovedUnit, QAfterFilterCondition> nameContains(
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

  QueryBuilder<RemovedUnit, RemovedUnit, QAfterFilterCondition> nameMatches(
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

  QueryBuilder<RemovedUnit, RemovedUnit, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<RemovedUnit, RemovedUnit, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<RemovedUnit, RemovedUnit, QAfterFilterCondition> priceEqualTo(
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

  QueryBuilder<RemovedUnit, RemovedUnit, QAfterFilterCondition>
      priceGreaterThan(
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

  QueryBuilder<RemovedUnit, RemovedUnit, QAfterFilterCondition> priceLessThan(
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

  QueryBuilder<RemovedUnit, RemovedUnit, QAfterFilterCondition> priceBetween(
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

  QueryBuilder<RemovedUnit, RemovedUnit, QAfterFilterCondition>
      subCateGoryNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'subCateGoryName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RemovedUnit, RemovedUnit, QAfterFilterCondition>
      subCateGoryNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'subCateGoryName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RemovedUnit, RemovedUnit, QAfterFilterCondition>
      subCateGoryNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'subCateGoryName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RemovedUnit, RemovedUnit, QAfterFilterCondition>
      subCateGoryNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'subCateGoryName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RemovedUnit, RemovedUnit, QAfterFilterCondition>
      subCateGoryNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'subCateGoryName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RemovedUnit, RemovedUnit, QAfterFilterCondition>
      subCateGoryNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'subCateGoryName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RemovedUnit, RemovedUnit, QAfterFilterCondition>
      subCateGoryNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'subCateGoryName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RemovedUnit, RemovedUnit, QAfterFilterCondition>
      subCateGoryNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'subCateGoryName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RemovedUnit, RemovedUnit, QAfterFilterCondition>
      subCateGoryNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'subCateGoryName',
        value: '',
      ));
    });
  }

  QueryBuilder<RemovedUnit, RemovedUnit, QAfterFilterCondition>
      subCateGoryNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'subCateGoryName',
        value: '',
      ));
    });
  }

  QueryBuilder<RemovedUnit, RemovedUnit, QAfterFilterCondition> unitIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'unitId',
      ));
    });
  }

  QueryBuilder<RemovedUnit, RemovedUnit, QAfterFilterCondition>
      unitIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'unitId',
      ));
    });
  }

  QueryBuilder<RemovedUnit, RemovedUnit, QAfterFilterCondition> unitIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unitId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RemovedUnit, RemovedUnit, QAfterFilterCondition>
      unitIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'unitId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RemovedUnit, RemovedUnit, QAfterFilterCondition> unitIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'unitId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RemovedUnit, RemovedUnit, QAfterFilterCondition> unitIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'unitId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RemovedUnit, RemovedUnit, QAfterFilterCondition>
      unitIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'unitId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RemovedUnit, RemovedUnit, QAfterFilterCondition> unitIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'unitId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RemovedUnit, RemovedUnit, QAfterFilterCondition> unitIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'unitId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RemovedUnit, RemovedUnit, QAfterFilterCondition> unitIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'unitId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RemovedUnit, RemovedUnit, QAfterFilterCondition>
      unitIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unitId',
        value: '',
      ));
    });
  }

  QueryBuilder<RemovedUnit, RemovedUnit, QAfterFilterCondition>
      unitIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'unitId',
        value: '',
      ));
    });
  }
}

extension RemovedUnitQueryObject
    on QueryBuilder<RemovedUnit, RemovedUnit, QFilterCondition> {}

extension RemovedUnitQueryLinks
    on QueryBuilder<RemovedUnit, RemovedUnit, QFilterCondition> {}

extension RemovedUnitQuerySortBy
    on QueryBuilder<RemovedUnit, RemovedUnit, QSortBy> {
  QueryBuilder<RemovedUnit, RemovedUnit, QAfterSortBy>
      sortByFatherCateGoryName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fatherCateGoryName', Sort.asc);
    });
  }

  QueryBuilder<RemovedUnit, RemovedUnit, QAfterSortBy>
      sortByFatherCateGoryNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fatherCateGoryName', Sort.desc);
    });
  }

  QueryBuilder<RemovedUnit, RemovedUnit, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<RemovedUnit, RemovedUnit, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<RemovedUnit, RemovedUnit, QAfterSortBy> sortByPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'price', Sort.asc);
    });
  }

  QueryBuilder<RemovedUnit, RemovedUnit, QAfterSortBy> sortByPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'price', Sort.desc);
    });
  }

  QueryBuilder<RemovedUnit, RemovedUnit, QAfterSortBy> sortBySubCateGoryName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subCateGoryName', Sort.asc);
    });
  }

  QueryBuilder<RemovedUnit, RemovedUnit, QAfterSortBy>
      sortBySubCateGoryNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subCateGoryName', Sort.desc);
    });
  }

  QueryBuilder<RemovedUnit, RemovedUnit, QAfterSortBy> sortByUnitId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitId', Sort.asc);
    });
  }

  QueryBuilder<RemovedUnit, RemovedUnit, QAfterSortBy> sortByUnitIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitId', Sort.desc);
    });
  }
}

extension RemovedUnitQuerySortThenBy
    on QueryBuilder<RemovedUnit, RemovedUnit, QSortThenBy> {
  QueryBuilder<RemovedUnit, RemovedUnit, QAfterSortBy>
      thenByFatherCateGoryName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fatherCateGoryName', Sort.asc);
    });
  }

  QueryBuilder<RemovedUnit, RemovedUnit, QAfterSortBy>
      thenByFatherCateGoryNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fatherCateGoryName', Sort.desc);
    });
  }

  QueryBuilder<RemovedUnit, RemovedUnit, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<RemovedUnit, RemovedUnit, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<RemovedUnit, RemovedUnit, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<RemovedUnit, RemovedUnit, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<RemovedUnit, RemovedUnit, QAfterSortBy> thenByPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'price', Sort.asc);
    });
  }

  QueryBuilder<RemovedUnit, RemovedUnit, QAfterSortBy> thenByPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'price', Sort.desc);
    });
  }

  QueryBuilder<RemovedUnit, RemovedUnit, QAfterSortBy> thenBySubCateGoryName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subCateGoryName', Sort.asc);
    });
  }

  QueryBuilder<RemovedUnit, RemovedUnit, QAfterSortBy>
      thenBySubCateGoryNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subCateGoryName', Sort.desc);
    });
  }

  QueryBuilder<RemovedUnit, RemovedUnit, QAfterSortBy> thenByUnitId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitId', Sort.asc);
    });
  }

  QueryBuilder<RemovedUnit, RemovedUnit, QAfterSortBy> thenByUnitIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitId', Sort.desc);
    });
  }
}

extension RemovedUnitQueryWhereDistinct
    on QueryBuilder<RemovedUnit, RemovedUnit, QDistinct> {
  QueryBuilder<RemovedUnit, RemovedUnit, QDistinct>
      distinctByFatherCateGoryName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fatherCateGoryName',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RemovedUnit, RemovedUnit, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RemovedUnit, RemovedUnit, QDistinct> distinctByPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'price');
    });
  }

  QueryBuilder<RemovedUnit, RemovedUnit, QDistinct> distinctBySubCateGoryName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'subCateGoryName',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RemovedUnit, RemovedUnit, QDistinct> distinctByUnitId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'unitId', caseSensitive: caseSensitive);
    });
  }
}

extension RemovedUnitQueryProperty
    on QueryBuilder<RemovedUnit, RemovedUnit, QQueryProperty> {
  QueryBuilder<RemovedUnit, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<RemovedUnit, String, QQueryOperations>
      fatherCateGoryNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fatherCateGoryName');
    });
  }

  QueryBuilder<RemovedUnit, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<RemovedUnit, double, QQueryOperations> priceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'price');
    });
  }

  QueryBuilder<RemovedUnit, String, QQueryOperations>
      subCateGoryNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'subCateGoryName');
    });
  }

  QueryBuilder<RemovedUnit, String?, QQueryOperations> unitIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'unitId');
    });
  }
}
