// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Customer.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetCustomerCollection on Isar {
  IsarCollection<Customer> get customers => this.collection();
}

const CustomerSchema = CollectionSchema(
  name: r'Customer',
  id: -7623823084711604343,
  properties: {
    r'customerOrder': PropertySchema(
      id: 0,
      name: r'customerOrder',
      type: IsarType.object,
      target: r'CustomerOrder',
    ),
    r'customerUnits': PropertySchema(
      id: 1,
      name: r'customerUnits',
      type: IsarType.objectList,
      target: r'CustomerUnit',
    ),
    r'isCompleted': PropertySchema(
      id: 2,
      name: r'isCompleted',
      type: IsarType.bool,
    ),
    r'orderTime': PropertySchema(
      id: 3,
      name: r'orderTime',
      type: IsarType.dateTime,
    ),
    r'orderTimes': PropertySchema(
      id: 4,
      name: r'orderTimes',
      type: IsarType.long,
    ),
    r'pickupCode': PropertySchema(
      id: 5,
      name: r'pickupCode',
      type: IsarType.long,
    )
  },
  estimateSize: _customerEstimateSize,
  serialize: _customerSerialize,
  deserialize: _customerDeserialize,
  deserializeProp: _customerDeserializeProp,
  idName: r'id',
  indexes: {
    r'pickupCode': IndexSchema(
      id: -5736487545650693077,
      name: r'pickupCode',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'pickupCode',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
    r'orderTime': IndexSchema(
      id: 2995476528269330214,
      name: r'orderTime',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'orderTime',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {
    r'CustomerUnit': CustomerUnitSchema,
    r'Times2Count': Times2CountSchema,
    r'CustomerOrder': CustomerOrderSchema
  },
  getId: _customerGetId,
  getLinks: _customerGetLinks,
  attach: _customerAttach,
  version: '3.1.0+1',
);

int _customerEstimateSize(
  Customer object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 +
      CustomerOrderSchema.estimateSize(
          object.customerOrder, allOffsets[CustomerOrder]!, allOffsets);
  bytesCount += 3 + object.customerUnits.length * 3;
  {
    final offsets = allOffsets[CustomerUnit]!;
    for (var i = 0; i < object.customerUnits.length; i++) {
      final value = object.customerUnits[i];
      bytesCount += CustomerUnitSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  return bytesCount;
}

void _customerSerialize(
  Customer object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObject<CustomerOrder>(
    offsets[0],
    allOffsets,
    CustomerOrderSchema.serialize,
    object.customerOrder,
  );
  writer.writeObjectList<CustomerUnit>(
    offsets[1],
    allOffsets,
    CustomerUnitSchema.serialize,
    object.customerUnits,
  );
  writer.writeBool(offsets[2], object.isCompleted);
  writer.writeDateTime(offsets[3], object.orderTime);
  writer.writeLong(offsets[4], object.orderTimes);
  writer.writeLong(offsets[5], object.pickupCode);
}

Customer _customerDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Customer();
  object.customerOrder = reader.readObjectOrNull<CustomerOrder>(
        offsets[0],
        CustomerOrderSchema.deserialize,
        allOffsets,
      ) ??
      CustomerOrder();
  object.customerUnits = reader.readObjectList<CustomerUnit>(
        offsets[1],
        CustomerUnitSchema.deserialize,
        allOffsets,
        CustomerUnit(),
      ) ??
      [];
  object.id = id;
  object.isCompleted = reader.readBool(offsets[2]);
  object.orderTimes = reader.readLong(offsets[4]);
  return object;
}

P _customerDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectOrNull<CustomerOrder>(
            offset,
            CustomerOrderSchema.deserialize,
            allOffsets,
          ) ??
          CustomerOrder()) as P;
    case 1:
      return (reader.readObjectList<CustomerUnit>(
            offset,
            CustomerUnitSchema.deserialize,
            allOffsets,
            CustomerUnit(),
          ) ??
          []) as P;
    case 2:
      return (reader.readBool(offset)) as P;
    case 3:
      return (reader.readDateTime(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    case 5:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _customerGetId(Customer object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _customerGetLinks(Customer object) {
  return [];
}

void _customerAttach(IsarCollection<dynamic> col, Id id, Customer object) {
  object.id = id;
}

extension CustomerQueryWhereSort on QueryBuilder<Customer, Customer, QWhere> {
  QueryBuilder<Customer, Customer, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<Customer, Customer, QAfterWhere> anyPickupCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'pickupCode'),
      );
    });
  }

  QueryBuilder<Customer, Customer, QAfterWhere> anyOrderTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'orderTime'),
      );
    });
  }
}

extension CustomerQueryWhere on QueryBuilder<Customer, Customer, QWhereClause> {
  QueryBuilder<Customer, Customer, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Customer, Customer, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Customer, Customer, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Customer, Customer, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Customer, Customer, QAfterWhereClause> idBetween(
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

  QueryBuilder<Customer, Customer, QAfterWhereClause> pickupCodeEqualTo(
      int pickupCode) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'pickupCode',
        value: [pickupCode],
      ));
    });
  }

  QueryBuilder<Customer, Customer, QAfterWhereClause> pickupCodeNotEqualTo(
      int pickupCode) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'pickupCode',
              lower: [],
              upper: [pickupCode],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'pickupCode',
              lower: [pickupCode],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'pickupCode',
              lower: [pickupCode],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'pickupCode',
              lower: [],
              upper: [pickupCode],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<Customer, Customer, QAfterWhereClause> pickupCodeGreaterThan(
    int pickupCode, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'pickupCode',
        lower: [pickupCode],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<Customer, Customer, QAfterWhereClause> pickupCodeLessThan(
    int pickupCode, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'pickupCode',
        lower: [],
        upper: [pickupCode],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<Customer, Customer, QAfterWhereClause> pickupCodeBetween(
    int lowerPickupCode,
    int upperPickupCode, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'pickupCode',
        lower: [lowerPickupCode],
        includeLower: includeLower,
        upper: [upperPickupCode],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Customer, Customer, QAfterWhereClause> orderTimeEqualTo(
      DateTime orderTime) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'orderTime',
        value: [orderTime],
      ));
    });
  }

  QueryBuilder<Customer, Customer, QAfterWhereClause> orderTimeNotEqualTo(
      DateTime orderTime) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'orderTime',
              lower: [],
              upper: [orderTime],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'orderTime',
              lower: [orderTime],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'orderTime',
              lower: [orderTime],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'orderTime',
              lower: [],
              upper: [orderTime],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<Customer, Customer, QAfterWhereClause> orderTimeGreaterThan(
    DateTime orderTime, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'orderTime',
        lower: [orderTime],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<Customer, Customer, QAfterWhereClause> orderTimeLessThan(
    DateTime orderTime, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'orderTime',
        lower: [],
        upper: [orderTime],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<Customer, Customer, QAfterWhereClause> orderTimeBetween(
    DateTime lowerOrderTime,
    DateTime upperOrderTime, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'orderTime',
        lower: [lowerOrderTime],
        includeLower: includeLower,
        upper: [upperOrderTime],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension CustomerQueryFilter
    on QueryBuilder<Customer, Customer, QFilterCondition> {
  QueryBuilder<Customer, Customer, QAfterFilterCondition>
      customerUnitsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'customerUnits',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Customer, Customer, QAfterFilterCondition>
      customerUnitsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'customerUnits',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Customer, Customer, QAfterFilterCondition>
      customerUnitsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'customerUnits',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Customer, Customer, QAfterFilterCondition>
      customerUnitsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'customerUnits',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Customer, Customer, QAfterFilterCondition>
      customerUnitsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'customerUnits',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Customer, Customer, QAfterFilterCondition>
      customerUnitsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'customerUnits',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Customer, Customer, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Customer, Customer, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Customer, Customer, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Customer, Customer, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Customer, Customer, QAfterFilterCondition> isCompletedEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isCompleted',
        value: value,
      ));
    });
  }

  QueryBuilder<Customer, Customer, QAfterFilterCondition> orderTimeEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'orderTime',
        value: value,
      ));
    });
  }

  QueryBuilder<Customer, Customer, QAfterFilterCondition> orderTimeGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'orderTime',
        value: value,
      ));
    });
  }

  QueryBuilder<Customer, Customer, QAfterFilterCondition> orderTimeLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'orderTime',
        value: value,
      ));
    });
  }

  QueryBuilder<Customer, Customer, QAfterFilterCondition> orderTimeBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'orderTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Customer, Customer, QAfterFilterCondition> orderTimesEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'orderTimes',
        value: value,
      ));
    });
  }

  QueryBuilder<Customer, Customer, QAfterFilterCondition> orderTimesGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'orderTimes',
        value: value,
      ));
    });
  }

  QueryBuilder<Customer, Customer, QAfterFilterCondition> orderTimesLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'orderTimes',
        value: value,
      ));
    });
  }

  QueryBuilder<Customer, Customer, QAfterFilterCondition> orderTimesBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'orderTimes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Customer, Customer, QAfterFilterCondition> pickupCodeEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pickupCode',
        value: value,
      ));
    });
  }

  QueryBuilder<Customer, Customer, QAfterFilterCondition> pickupCodeGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'pickupCode',
        value: value,
      ));
    });
  }

  QueryBuilder<Customer, Customer, QAfterFilterCondition> pickupCodeLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'pickupCode',
        value: value,
      ));
    });
  }

  QueryBuilder<Customer, Customer, QAfterFilterCondition> pickupCodeBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'pickupCode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension CustomerQueryObject
    on QueryBuilder<Customer, Customer, QFilterCondition> {
  QueryBuilder<Customer, Customer, QAfterFilterCondition> customerOrder(
      FilterQuery<CustomerOrder> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'customerOrder');
    });
  }

  QueryBuilder<Customer, Customer, QAfterFilterCondition> customerUnitsElement(
      FilterQuery<CustomerUnit> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'customerUnits');
    });
  }
}

extension CustomerQueryLinks
    on QueryBuilder<Customer, Customer, QFilterCondition> {}

extension CustomerQuerySortBy on QueryBuilder<Customer, Customer, QSortBy> {
  QueryBuilder<Customer, Customer, QAfterSortBy> sortByIsCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCompleted', Sort.asc);
    });
  }

  QueryBuilder<Customer, Customer, QAfterSortBy> sortByIsCompletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCompleted', Sort.desc);
    });
  }

  QueryBuilder<Customer, Customer, QAfterSortBy> sortByOrderTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'orderTime', Sort.asc);
    });
  }

  QueryBuilder<Customer, Customer, QAfterSortBy> sortByOrderTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'orderTime', Sort.desc);
    });
  }

  QueryBuilder<Customer, Customer, QAfterSortBy> sortByOrderTimes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'orderTimes', Sort.asc);
    });
  }

  QueryBuilder<Customer, Customer, QAfterSortBy> sortByOrderTimesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'orderTimes', Sort.desc);
    });
  }

  QueryBuilder<Customer, Customer, QAfterSortBy> sortByPickupCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pickupCode', Sort.asc);
    });
  }

  QueryBuilder<Customer, Customer, QAfterSortBy> sortByPickupCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pickupCode', Sort.desc);
    });
  }
}

extension CustomerQuerySortThenBy
    on QueryBuilder<Customer, Customer, QSortThenBy> {
  QueryBuilder<Customer, Customer, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Customer, Customer, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Customer, Customer, QAfterSortBy> thenByIsCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCompleted', Sort.asc);
    });
  }

  QueryBuilder<Customer, Customer, QAfterSortBy> thenByIsCompletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCompleted', Sort.desc);
    });
  }

  QueryBuilder<Customer, Customer, QAfterSortBy> thenByOrderTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'orderTime', Sort.asc);
    });
  }

  QueryBuilder<Customer, Customer, QAfterSortBy> thenByOrderTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'orderTime', Sort.desc);
    });
  }

  QueryBuilder<Customer, Customer, QAfterSortBy> thenByOrderTimes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'orderTimes', Sort.asc);
    });
  }

  QueryBuilder<Customer, Customer, QAfterSortBy> thenByOrderTimesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'orderTimes', Sort.desc);
    });
  }

  QueryBuilder<Customer, Customer, QAfterSortBy> thenByPickupCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pickupCode', Sort.asc);
    });
  }

  QueryBuilder<Customer, Customer, QAfterSortBy> thenByPickupCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pickupCode', Sort.desc);
    });
  }
}

extension CustomerQueryWhereDistinct
    on QueryBuilder<Customer, Customer, QDistinct> {
  QueryBuilder<Customer, Customer, QDistinct> distinctByIsCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isCompleted');
    });
  }

  QueryBuilder<Customer, Customer, QDistinct> distinctByOrderTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'orderTime');
    });
  }

  QueryBuilder<Customer, Customer, QDistinct> distinctByOrderTimes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'orderTimes');
    });
  }

  QueryBuilder<Customer, Customer, QDistinct> distinctByPickupCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pickupCode');
    });
  }
}

extension CustomerQueryProperty
    on QueryBuilder<Customer, Customer, QQueryProperty> {
  QueryBuilder<Customer, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Customer, CustomerOrder, QQueryOperations>
      customerOrderProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'customerOrder');
    });
  }

  QueryBuilder<Customer, List<CustomerUnit>, QQueryOperations>
      customerUnitsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'customerUnits');
    });
  }

  QueryBuilder<Customer, bool, QQueryOperations> isCompletedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isCompleted');
    });
  }

  QueryBuilder<Customer, DateTime, QQueryOperations> orderTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'orderTime');
    });
  }

  QueryBuilder<Customer, int, QQueryOperations> orderTimesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'orderTimes');
    });
  }

  QueryBuilder<Customer, int, QQueryOperations> pickupCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pickupCode');
    });
  }
}

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const CustomerUnitSchema = Schema(
  name: r'CustomerUnit',
  id: 1288013750335326809,
  properties: {
    r'times2Count': PropertySchema(
      id: 0,
      name: r'times2Count',
      type: IsarType.objectList,
      target: r'Times2Count',
    ),
    r'unitId': PropertySchema(
      id: 1,
      name: r'unitId',
      type: IsarType.string,
    )
  },
  estimateSize: _customerUnitEstimateSize,
  serialize: _customerUnitSerialize,
  deserialize: _customerUnitDeserialize,
  deserializeProp: _customerUnitDeserializeProp,
);

int _customerUnitEstimateSize(
  CustomerUnit object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.times2Count.length * 3;
  {
    final offsets = allOffsets[Times2Count]!;
    for (var i = 0; i < object.times2Count.length; i++) {
      final value = object.times2Count[i];
      bytesCount += Times2CountSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  {
    final value = object.unitId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _customerUnitSerialize(
  CustomerUnit object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObjectList<Times2Count>(
    offsets[0],
    allOffsets,
    Times2CountSchema.serialize,
    object.times2Count,
  );
  writer.writeString(offsets[1], object.unitId);
}

CustomerUnit _customerUnitDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = CustomerUnit();
  object.times2Count = reader.readObjectList<Times2Count>(
        offsets[0],
        Times2CountSchema.deserialize,
        allOffsets,
        Times2Count(),
      ) ??
      [];
  object.unitId = reader.readStringOrNull(offsets[1]);
  return object;
}

P _customerUnitDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectList<Times2Count>(
            offset,
            Times2CountSchema.deserialize,
            allOffsets,
            Times2Count(),
          ) ??
          []) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension CustomerUnitQueryFilter
    on QueryBuilder<CustomerUnit, CustomerUnit, QFilterCondition> {
  QueryBuilder<CustomerUnit, CustomerUnit, QAfterFilterCondition>
      times2CountLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'times2Count',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<CustomerUnit, CustomerUnit, QAfterFilterCondition>
      times2CountIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'times2Count',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<CustomerUnit, CustomerUnit, QAfterFilterCondition>
      times2CountIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'times2Count',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<CustomerUnit, CustomerUnit, QAfterFilterCondition>
      times2CountLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'times2Count',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<CustomerUnit, CustomerUnit, QAfterFilterCondition>
      times2CountLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'times2Count',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<CustomerUnit, CustomerUnit, QAfterFilterCondition>
      times2CountLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'times2Count',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<CustomerUnit, CustomerUnit, QAfterFilterCondition>
      unitIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'unitId',
      ));
    });
  }

  QueryBuilder<CustomerUnit, CustomerUnit, QAfterFilterCondition>
      unitIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'unitId',
      ));
    });
  }

  QueryBuilder<CustomerUnit, CustomerUnit, QAfterFilterCondition> unitIdEqualTo(
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

  QueryBuilder<CustomerUnit, CustomerUnit, QAfterFilterCondition>
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

  QueryBuilder<CustomerUnit, CustomerUnit, QAfterFilterCondition>
      unitIdLessThan(
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

  QueryBuilder<CustomerUnit, CustomerUnit, QAfterFilterCondition> unitIdBetween(
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

  QueryBuilder<CustomerUnit, CustomerUnit, QAfterFilterCondition>
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

  QueryBuilder<CustomerUnit, CustomerUnit, QAfterFilterCondition>
      unitIdEndsWith(
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

  QueryBuilder<CustomerUnit, CustomerUnit, QAfterFilterCondition>
      unitIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'unitId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CustomerUnit, CustomerUnit, QAfterFilterCondition> unitIdMatches(
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

  QueryBuilder<CustomerUnit, CustomerUnit, QAfterFilterCondition>
      unitIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unitId',
        value: '',
      ));
    });
  }

  QueryBuilder<CustomerUnit, CustomerUnit, QAfterFilterCondition>
      unitIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'unitId',
        value: '',
      ));
    });
  }
}

extension CustomerUnitQueryObject
    on QueryBuilder<CustomerUnit, CustomerUnit, QFilterCondition> {
  QueryBuilder<CustomerUnit, CustomerUnit, QAfterFilterCondition>
      times2CountElement(FilterQuery<Times2Count> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'times2Count');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const Times2CountSchema = Schema(
  name: r'Times2Count',
  id: -6209429911710570159,
  properties: {
    r'count': PropertySchema(
      id: 0,
      name: r'count',
      type: IsarType.long,
    ),
    r'times': PropertySchema(
      id: 1,
      name: r'times',
      type: IsarType.long,
    )
  },
  estimateSize: _times2CountEstimateSize,
  serialize: _times2CountSerialize,
  deserialize: _times2CountDeserialize,
  deserializeProp: _times2CountDeserializeProp,
);

int _times2CountEstimateSize(
  Times2Count object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _times2CountSerialize(
  Times2Count object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.count);
  writer.writeLong(offsets[1], object.times);
}

Times2Count _times2CountDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Times2Count();
  object.count = reader.readLong(offsets[0]);
  object.times = reader.readLong(offsets[1]);
  return object;
}

P _times2CountDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension Times2CountQueryFilter
    on QueryBuilder<Times2Count, Times2Count, QFilterCondition> {
  QueryBuilder<Times2Count, Times2Count, QAfterFilterCondition> countEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'count',
        value: value,
      ));
    });
  }

  QueryBuilder<Times2Count, Times2Count, QAfterFilterCondition>
      countGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'count',
        value: value,
      ));
    });
  }

  QueryBuilder<Times2Count, Times2Count, QAfterFilterCondition> countLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'count',
        value: value,
      ));
    });
  }

  QueryBuilder<Times2Count, Times2Count, QAfterFilterCondition> countBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'count',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Times2Count, Times2Count, QAfterFilterCondition> timesEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'times',
        value: value,
      ));
    });
  }

  QueryBuilder<Times2Count, Times2Count, QAfterFilterCondition>
      timesGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'times',
        value: value,
      ));
    });
  }

  QueryBuilder<Times2Count, Times2Count, QAfterFilterCondition> timesLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'times',
        value: value,
      ));
    });
  }

  QueryBuilder<Times2Count, Times2Count, QAfterFilterCondition> timesBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'times',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension Times2CountQueryObject
    on QueryBuilder<Times2Count, Times2Count, QFilterCondition> {}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const CustomerOrderSchema = Schema(
  name: r'CustomerOrder',
  id: 7813251628506524948,
  properties: {
    r'orderTime': PropertySchema(
      id: 0,
      name: r'orderTime',
      type: IsarType.dateTime,
    ),
    r'packPrice': PropertySchema(
      id: 1,
      name: r'packPrice',
      type: IsarType.double,
    ),
    r'paidPrice': PropertySchema(
      id: 2,
      name: r'paidPrice',
      type: IsarType.double,
    ),
    r'pickupCode': PropertySchema(
      id: 3,
      name: r'pickupCode',
      type: IsarType.long,
    ),
    r'tableNum': PropertySchema(
      id: 4,
      name: r'tableNum',
      type: IsarType.string,
    )
  },
  estimateSize: _customerOrderEstimateSize,
  serialize: _customerOrderSerialize,
  deserialize: _customerOrderDeserialize,
  deserializeProp: _customerOrderDeserializeProp,
);

int _customerOrderEstimateSize(
  CustomerOrder object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.tableNum.length * 3;
  return bytesCount;
}

void _customerOrderSerialize(
  CustomerOrder object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.orderTime);
  writer.writeDouble(offsets[1], object.packPrice);
  writer.writeDouble(offsets[2], object.paidPrice);
  writer.writeLong(offsets[3], object.pickupCode);
  writer.writeString(offsets[4], object.tableNum);
}

CustomerOrder _customerOrderDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = CustomerOrder();
  object.orderTime = reader.readDateTime(offsets[0]);
  object.packPrice = reader.readDouble(offsets[1]);
  object.paidPrice = reader.readDouble(offsets[2]);
  object.pickupCode = reader.readLong(offsets[3]);
  object.tableNum = reader.readString(offsets[4]);
  return object;
}

P _customerOrderDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readDouble(offset)) as P;
    case 2:
      return (reader.readDouble(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension CustomerOrderQueryFilter
    on QueryBuilder<CustomerOrder, CustomerOrder, QFilterCondition> {
  QueryBuilder<CustomerOrder, CustomerOrder, QAfterFilterCondition>
      orderTimeEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'orderTime',
        value: value,
      ));
    });
  }

  QueryBuilder<CustomerOrder, CustomerOrder, QAfterFilterCondition>
      orderTimeGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'orderTime',
        value: value,
      ));
    });
  }

  QueryBuilder<CustomerOrder, CustomerOrder, QAfterFilterCondition>
      orderTimeLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'orderTime',
        value: value,
      ));
    });
  }

  QueryBuilder<CustomerOrder, CustomerOrder, QAfterFilterCondition>
      orderTimeBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'orderTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CustomerOrder, CustomerOrder, QAfterFilterCondition>
      packPriceEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'packPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CustomerOrder, CustomerOrder, QAfterFilterCondition>
      packPriceGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'packPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CustomerOrder, CustomerOrder, QAfterFilterCondition>
      packPriceLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'packPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CustomerOrder, CustomerOrder, QAfterFilterCondition>
      packPriceBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'packPrice',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CustomerOrder, CustomerOrder, QAfterFilterCondition>
      paidPriceEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'paidPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CustomerOrder, CustomerOrder, QAfterFilterCondition>
      paidPriceGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'paidPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CustomerOrder, CustomerOrder, QAfterFilterCondition>
      paidPriceLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'paidPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CustomerOrder, CustomerOrder, QAfterFilterCondition>
      paidPriceBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'paidPrice',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CustomerOrder, CustomerOrder, QAfterFilterCondition>
      pickupCodeEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pickupCode',
        value: value,
      ));
    });
  }

  QueryBuilder<CustomerOrder, CustomerOrder, QAfterFilterCondition>
      pickupCodeGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'pickupCode',
        value: value,
      ));
    });
  }

  QueryBuilder<CustomerOrder, CustomerOrder, QAfterFilterCondition>
      pickupCodeLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'pickupCode',
        value: value,
      ));
    });
  }

  QueryBuilder<CustomerOrder, CustomerOrder, QAfterFilterCondition>
      pickupCodeBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'pickupCode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CustomerOrder, CustomerOrder, QAfterFilterCondition>
      tableNumEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tableNum',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CustomerOrder, CustomerOrder, QAfterFilterCondition>
      tableNumGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tableNum',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CustomerOrder, CustomerOrder, QAfterFilterCondition>
      tableNumLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tableNum',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CustomerOrder, CustomerOrder, QAfterFilterCondition>
      tableNumBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tableNum',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CustomerOrder, CustomerOrder, QAfterFilterCondition>
      tableNumStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'tableNum',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CustomerOrder, CustomerOrder, QAfterFilterCondition>
      tableNumEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'tableNum',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CustomerOrder, CustomerOrder, QAfterFilterCondition>
      tableNumContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'tableNum',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CustomerOrder, CustomerOrder, QAfterFilterCondition>
      tableNumMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'tableNum',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CustomerOrder, CustomerOrder, QAfterFilterCondition>
      tableNumIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tableNum',
        value: '',
      ));
    });
  }

  QueryBuilder<CustomerOrder, CustomerOrder, QAfterFilterCondition>
      tableNumIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'tableNum',
        value: '',
      ));
    });
  }
}

extension CustomerOrderQueryObject
    on QueryBuilder<CustomerOrder, CustomerOrder, QFilterCondition> {}
