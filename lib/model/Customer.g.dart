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
    r'completedOrderTime': PropertySchema(
      id: 0,
      name: r'completedOrderTime',
      type: IsarType.dateTime,
    ),
    r'customerOrder': PropertySchema(
      id: 1,
      name: r'customerOrder',
      type: IsarType.object,
      target: r'CustomerOrder',
    ),
    r'customerTraitsQuickNote': PropertySchema(
      id: 2,
      name: r'customerTraitsQuickNote',
      type: IsarType.string,
    ),
    r'customerUnits': PropertySchema(
      id: 3,
      name: r'customerUnits',
      type: IsarType.objectList,
      target: r'CustomerUnit',
    ),
    r'firstOrderTime': PropertySchema(
      id: 4,
      name: r'firstOrderTime',
      type: IsarType.dateTime,
    ),
    r'isCompleted': PropertySchema(
      id: 5,
      name: r'isCompleted',
      type: IsarType.bool,
    ),
    r'isConfirmed': PropertySchema(
      id: 6,
      name: r'isConfirmed',
      type: IsarType.bool,
    ),
    r'isInvalid': PropertySchema(
      id: 7,
      name: r'isInvalid',
      type: IsarType.bool,
    ),
    r'orderedTimes': PropertySchema(
      id: 8,
      name: r'orderedTimes',
      type: IsarType.long,
    )
  },
  estimateSize: _customerEstimateSize,
  serialize: _customerSerialize,
  deserialize: _customerDeserialize,
  deserializeProp: _customerDeserializeProp,
  idName: r'id',
  indexes: {
    r'firstOrderTime': IndexSchema(
      id: 7443296712344565874,
      name: r'firstOrderTime',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'firstOrderTime',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
    r'completedOrderTime': IndexSchema(
      id: 924249719891103775,
      name: r'completedOrderTime',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'completedOrderTime',
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
  bytesCount += 3 + object.customerTraitsQuickNote.length * 3;
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
  writer.writeDateTime(offsets[0], object.completedOrderTime);
  writer.writeObject<CustomerOrder>(
    offsets[1],
    allOffsets,
    CustomerOrderSchema.serialize,
    object.customerOrder,
  );
  writer.writeString(offsets[2], object.customerTraitsQuickNote);
  writer.writeObjectList<CustomerUnit>(
    offsets[3],
    allOffsets,
    CustomerUnitSchema.serialize,
    object.customerUnits,
  );
  writer.writeDateTime(offsets[4], object.firstOrderTime);
  writer.writeBool(offsets[5], object.isCompleted);
  writer.writeBool(offsets[6], object.isConfirmed);
  writer.writeBool(offsets[7], object.isInvalid);
  writer.writeLong(offsets[8], object.orderedTimes);
}

Customer _customerDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Customer();
  object.customerOrder = reader.readObjectOrNull<CustomerOrder>(
        offsets[1],
        CustomerOrderSchema.deserialize,
        allOffsets,
      ) ??
      CustomerOrder();
  object.customerTraitsQuickNote = reader.readString(offsets[2]);
  object.customerUnits = reader.readObjectList<CustomerUnit>(
        offsets[3],
        CustomerUnitSchema.deserialize,
        allOffsets,
        CustomerUnit(),
      ) ??
      [];
  object.id = id;
  object.isCompleted = reader.readBool(offsets[5]);
  object.isConfirmed = reader.readBool(offsets[6]);
  object.isInvalid = reader.readBool(offsets[7]);
  object.orderedTimes = reader.readLong(offsets[8]);
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
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readObjectOrNull<CustomerOrder>(
            offset,
            CustomerOrderSchema.deserialize,
            allOffsets,
          ) ??
          CustomerOrder()) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readObjectList<CustomerUnit>(
            offset,
            CustomerUnitSchema.deserialize,
            allOffsets,
            CustomerUnit(),
          ) ??
          []) as P;
    case 4:
      return (reader.readDateTime(offset)) as P;
    case 5:
      return (reader.readBool(offset)) as P;
    case 6:
      return (reader.readBool(offset)) as P;
    case 7:
      return (reader.readBool(offset)) as P;
    case 8:
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

  QueryBuilder<Customer, Customer, QAfterWhere> anyFirstOrderTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'firstOrderTime'),
      );
    });
  }

  QueryBuilder<Customer, Customer, QAfterWhere> anyCompletedOrderTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'completedOrderTime'),
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

  QueryBuilder<Customer, Customer, QAfterWhereClause> firstOrderTimeEqualTo(
      DateTime firstOrderTime) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'firstOrderTime',
        value: [firstOrderTime],
      ));
    });
  }

  QueryBuilder<Customer, Customer, QAfterWhereClause> firstOrderTimeNotEqualTo(
      DateTime firstOrderTime) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'firstOrderTime',
              lower: [],
              upper: [firstOrderTime],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'firstOrderTime',
              lower: [firstOrderTime],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'firstOrderTime',
              lower: [firstOrderTime],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'firstOrderTime',
              lower: [],
              upper: [firstOrderTime],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<Customer, Customer, QAfterWhereClause> firstOrderTimeGreaterThan(
    DateTime firstOrderTime, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'firstOrderTime',
        lower: [firstOrderTime],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<Customer, Customer, QAfterWhereClause> firstOrderTimeLessThan(
    DateTime firstOrderTime, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'firstOrderTime',
        lower: [],
        upper: [firstOrderTime],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<Customer, Customer, QAfterWhereClause> firstOrderTimeBetween(
    DateTime lowerFirstOrderTime,
    DateTime upperFirstOrderTime, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'firstOrderTime',
        lower: [lowerFirstOrderTime],
        includeLower: includeLower,
        upper: [upperFirstOrderTime],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Customer, Customer, QAfterWhereClause> completedOrderTimeEqualTo(
      DateTime completedOrderTime) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'completedOrderTime',
        value: [completedOrderTime],
      ));
    });
  }

  QueryBuilder<Customer, Customer, QAfterWhereClause>
      completedOrderTimeNotEqualTo(DateTime completedOrderTime) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'completedOrderTime',
              lower: [],
              upper: [completedOrderTime],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'completedOrderTime',
              lower: [completedOrderTime],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'completedOrderTime',
              lower: [completedOrderTime],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'completedOrderTime',
              lower: [],
              upper: [completedOrderTime],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<Customer, Customer, QAfterWhereClause>
      completedOrderTimeGreaterThan(
    DateTime completedOrderTime, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'completedOrderTime',
        lower: [completedOrderTime],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<Customer, Customer, QAfterWhereClause>
      completedOrderTimeLessThan(
    DateTime completedOrderTime, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'completedOrderTime',
        lower: [],
        upper: [completedOrderTime],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<Customer, Customer, QAfterWhereClause> completedOrderTimeBetween(
    DateTime lowerCompletedOrderTime,
    DateTime upperCompletedOrderTime, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'completedOrderTime',
        lower: [lowerCompletedOrderTime],
        includeLower: includeLower,
        upper: [upperCompletedOrderTime],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension CustomerQueryFilter
    on QueryBuilder<Customer, Customer, QFilterCondition> {
  QueryBuilder<Customer, Customer, QAfterFilterCondition>
      completedOrderTimeEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'completedOrderTime',
        value: value,
      ));
    });
  }

  QueryBuilder<Customer, Customer, QAfterFilterCondition>
      completedOrderTimeGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'completedOrderTime',
        value: value,
      ));
    });
  }

  QueryBuilder<Customer, Customer, QAfterFilterCondition>
      completedOrderTimeLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'completedOrderTime',
        value: value,
      ));
    });
  }

  QueryBuilder<Customer, Customer, QAfterFilterCondition>
      completedOrderTimeBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'completedOrderTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Customer, Customer, QAfterFilterCondition>
      customerTraitsQuickNoteEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'customerTraitsQuickNote',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Customer, Customer, QAfterFilterCondition>
      customerTraitsQuickNoteGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'customerTraitsQuickNote',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Customer, Customer, QAfterFilterCondition>
      customerTraitsQuickNoteLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'customerTraitsQuickNote',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Customer, Customer, QAfterFilterCondition>
      customerTraitsQuickNoteBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'customerTraitsQuickNote',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Customer, Customer, QAfterFilterCondition>
      customerTraitsQuickNoteStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'customerTraitsQuickNote',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Customer, Customer, QAfterFilterCondition>
      customerTraitsQuickNoteEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'customerTraitsQuickNote',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Customer, Customer, QAfterFilterCondition>
      customerTraitsQuickNoteContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'customerTraitsQuickNote',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Customer, Customer, QAfterFilterCondition>
      customerTraitsQuickNoteMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'customerTraitsQuickNote',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Customer, Customer, QAfterFilterCondition>
      customerTraitsQuickNoteIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'customerTraitsQuickNote',
        value: '',
      ));
    });
  }

  QueryBuilder<Customer, Customer, QAfterFilterCondition>
      customerTraitsQuickNoteIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'customerTraitsQuickNote',
        value: '',
      ));
    });
  }

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

  QueryBuilder<Customer, Customer, QAfterFilterCondition> firstOrderTimeEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'firstOrderTime',
        value: value,
      ));
    });
  }

  QueryBuilder<Customer, Customer, QAfterFilterCondition>
      firstOrderTimeGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'firstOrderTime',
        value: value,
      ));
    });
  }

  QueryBuilder<Customer, Customer, QAfterFilterCondition>
      firstOrderTimeLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'firstOrderTime',
        value: value,
      ));
    });
  }

  QueryBuilder<Customer, Customer, QAfterFilterCondition> firstOrderTimeBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'firstOrderTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
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

  QueryBuilder<Customer, Customer, QAfterFilterCondition> isConfirmedEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isConfirmed',
        value: value,
      ));
    });
  }

  QueryBuilder<Customer, Customer, QAfterFilterCondition> isInvalidEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isInvalid',
        value: value,
      ));
    });
  }

  QueryBuilder<Customer, Customer, QAfterFilterCondition> orderedTimesEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'orderedTimes',
        value: value,
      ));
    });
  }

  QueryBuilder<Customer, Customer, QAfterFilterCondition>
      orderedTimesGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'orderedTimes',
        value: value,
      ));
    });
  }

  QueryBuilder<Customer, Customer, QAfterFilterCondition> orderedTimesLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'orderedTimes',
        value: value,
      ));
    });
  }

  QueryBuilder<Customer, Customer, QAfterFilterCondition> orderedTimesBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'orderedTimes',
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
  QueryBuilder<Customer, Customer, QAfterSortBy> sortByCompletedOrderTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedOrderTime', Sort.asc);
    });
  }

  QueryBuilder<Customer, Customer, QAfterSortBy>
      sortByCompletedOrderTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedOrderTime', Sort.desc);
    });
  }

  QueryBuilder<Customer, Customer, QAfterSortBy>
      sortByCustomerTraitsQuickNote() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerTraitsQuickNote', Sort.asc);
    });
  }

  QueryBuilder<Customer, Customer, QAfterSortBy>
      sortByCustomerTraitsQuickNoteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerTraitsQuickNote', Sort.desc);
    });
  }

  QueryBuilder<Customer, Customer, QAfterSortBy> sortByFirstOrderTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firstOrderTime', Sort.asc);
    });
  }

  QueryBuilder<Customer, Customer, QAfterSortBy> sortByFirstOrderTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firstOrderTime', Sort.desc);
    });
  }

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

  QueryBuilder<Customer, Customer, QAfterSortBy> sortByIsConfirmed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isConfirmed', Sort.asc);
    });
  }

  QueryBuilder<Customer, Customer, QAfterSortBy> sortByIsConfirmedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isConfirmed', Sort.desc);
    });
  }

  QueryBuilder<Customer, Customer, QAfterSortBy> sortByIsInvalid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isInvalid', Sort.asc);
    });
  }

  QueryBuilder<Customer, Customer, QAfterSortBy> sortByIsInvalidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isInvalid', Sort.desc);
    });
  }

  QueryBuilder<Customer, Customer, QAfterSortBy> sortByOrderedTimes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'orderedTimes', Sort.asc);
    });
  }

  QueryBuilder<Customer, Customer, QAfterSortBy> sortByOrderedTimesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'orderedTimes', Sort.desc);
    });
  }
}

extension CustomerQuerySortThenBy
    on QueryBuilder<Customer, Customer, QSortThenBy> {
  QueryBuilder<Customer, Customer, QAfterSortBy> thenByCompletedOrderTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedOrderTime', Sort.asc);
    });
  }

  QueryBuilder<Customer, Customer, QAfterSortBy>
      thenByCompletedOrderTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedOrderTime', Sort.desc);
    });
  }

  QueryBuilder<Customer, Customer, QAfterSortBy>
      thenByCustomerTraitsQuickNote() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerTraitsQuickNote', Sort.asc);
    });
  }

  QueryBuilder<Customer, Customer, QAfterSortBy>
      thenByCustomerTraitsQuickNoteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerTraitsQuickNote', Sort.desc);
    });
  }

  QueryBuilder<Customer, Customer, QAfterSortBy> thenByFirstOrderTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firstOrderTime', Sort.asc);
    });
  }

  QueryBuilder<Customer, Customer, QAfterSortBy> thenByFirstOrderTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firstOrderTime', Sort.desc);
    });
  }

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

  QueryBuilder<Customer, Customer, QAfterSortBy> thenByIsConfirmed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isConfirmed', Sort.asc);
    });
  }

  QueryBuilder<Customer, Customer, QAfterSortBy> thenByIsConfirmedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isConfirmed', Sort.desc);
    });
  }

  QueryBuilder<Customer, Customer, QAfterSortBy> thenByIsInvalid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isInvalid', Sort.asc);
    });
  }

  QueryBuilder<Customer, Customer, QAfterSortBy> thenByIsInvalidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isInvalid', Sort.desc);
    });
  }

  QueryBuilder<Customer, Customer, QAfterSortBy> thenByOrderedTimes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'orderedTimes', Sort.asc);
    });
  }

  QueryBuilder<Customer, Customer, QAfterSortBy> thenByOrderedTimesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'orderedTimes', Sort.desc);
    });
  }
}

extension CustomerQueryWhereDistinct
    on QueryBuilder<Customer, Customer, QDistinct> {
  QueryBuilder<Customer, Customer, QDistinct> distinctByCompletedOrderTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'completedOrderTime');
    });
  }

  QueryBuilder<Customer, Customer, QDistinct> distinctByCustomerTraitsQuickNote(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'customerTraitsQuickNote',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Customer, Customer, QDistinct> distinctByFirstOrderTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'firstOrderTime');
    });
  }

  QueryBuilder<Customer, Customer, QDistinct> distinctByIsCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isCompleted');
    });
  }

  QueryBuilder<Customer, Customer, QDistinct> distinctByIsConfirmed() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isConfirmed');
    });
  }

  QueryBuilder<Customer, Customer, QDistinct> distinctByIsInvalid() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isInvalid');
    });
  }

  QueryBuilder<Customer, Customer, QDistinct> distinctByOrderedTimes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'orderedTimes');
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

  QueryBuilder<Customer, DateTime, QQueryOperations>
      completedOrderTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'completedOrderTime');
    });
  }

  QueryBuilder<Customer, CustomerOrder, QQueryOperations>
      customerOrderProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'customerOrder');
    });
  }

  QueryBuilder<Customer, String, QQueryOperations>
      customerTraitsQuickNoteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'customerTraitsQuickNote');
    });
  }

  QueryBuilder<Customer, List<CustomerUnit>, QQueryOperations>
      customerUnitsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'customerUnits');
    });
  }

  QueryBuilder<Customer, DateTime, QQueryOperations> firstOrderTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'firstOrderTime');
    });
  }

  QueryBuilder<Customer, bool, QQueryOperations> isCompletedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isCompleted');
    });
  }

  QueryBuilder<Customer, bool, QQueryOperations> isConfirmedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isConfirmed');
    });
  }

  QueryBuilder<Customer, bool, QQueryOperations> isInvalidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isInvalid');
    });
  }

  QueryBuilder<Customer, int, QQueryOperations> orderedTimesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'orderedTimes');
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
    r'getTotalCount': PropertySchema(
      id: 0,
      name: r'getTotalCount',
      type: IsarType.long,
    ),
    r'times2Counts': PropertySchema(
      id: 1,
      name: r'times2Counts',
      type: IsarType.objectList,
      target: r'Times2Count',
    ),
    r'unitId': PropertySchema(
      id: 2,
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
  bytesCount += 3 + object.times2Counts.length * 3;
  {
    final offsets = allOffsets[Times2Count]!;
    for (var i = 0; i < object.times2Counts.length; i++) {
      final value = object.times2Counts[i];
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
  writer.writeLong(offsets[0], object.getTotalCount);
  writer.writeObjectList<Times2Count>(
    offsets[1],
    allOffsets,
    Times2CountSchema.serialize,
    object.times2Counts,
  );
  writer.writeString(offsets[2], object.unitId);
}

CustomerUnit _customerUnitDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = CustomerUnit();
  object.times2Counts = reader.readObjectList<Times2Count>(
        offsets[1],
        Times2CountSchema.deserialize,
        allOffsets,
        Times2Count(),
      ) ??
      [];
  object.unitId = reader.readStringOrNull(offsets[2]);
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
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readObjectList<Times2Count>(
            offset,
            Times2CountSchema.deserialize,
            allOffsets,
            Times2Count(),
          ) ??
          []) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension CustomerUnitQueryFilter
    on QueryBuilder<CustomerUnit, CustomerUnit, QFilterCondition> {
  QueryBuilder<CustomerUnit, CustomerUnit, QAfterFilterCondition>
      getTotalCountEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'getTotalCount',
        value: value,
      ));
    });
  }

  QueryBuilder<CustomerUnit, CustomerUnit, QAfterFilterCondition>
      getTotalCountGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'getTotalCount',
        value: value,
      ));
    });
  }

  QueryBuilder<CustomerUnit, CustomerUnit, QAfterFilterCondition>
      getTotalCountLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'getTotalCount',
        value: value,
      ));
    });
  }

  QueryBuilder<CustomerUnit, CustomerUnit, QAfterFilterCondition>
      getTotalCountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'getTotalCount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CustomerUnit, CustomerUnit, QAfterFilterCondition>
      times2CountsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'times2Counts',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<CustomerUnit, CustomerUnit, QAfterFilterCondition>
      times2CountsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'times2Counts',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<CustomerUnit, CustomerUnit, QAfterFilterCondition>
      times2CountsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'times2Counts',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<CustomerUnit, CustomerUnit, QAfterFilterCondition>
      times2CountsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'times2Counts',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<CustomerUnit, CustomerUnit, QAfterFilterCondition>
      times2CountsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'times2Counts',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<CustomerUnit, CustomerUnit, QAfterFilterCondition>
      times2CountsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'times2Counts',
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
      times2CountsElement(FilterQuery<Times2Count> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'times2Counts');
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
    r'completedOrderTime': PropertySchema(
      id: 0,
      name: r'completedOrderTime',
      type: IsarType.dateTime,
    ),
    r'extraPrice': PropertySchema(
      id: 1,
      name: r'extraPrice',
      type: IsarType.double,
    ),
    r'firstOrderTime': PropertySchema(
      id: 2,
      name: r'firstOrderTime',
      type: IsarType.dateTime,
    ),
    r'paidPrice': PropertySchema(
      id: 3,
      name: r'paidPrice',
      type: IsarType.double,
    ),
    r'pickupCode': PropertySchema(
      id: 4,
      name: r'pickupCode',
      type: IsarType.long,
    ),
    r'tableNum': PropertySchema(
      id: 5,
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
  writer.writeDateTime(offsets[0], object.completedOrderTime);
  writer.writeDouble(offsets[1], object.extraPrice);
  writer.writeDateTime(offsets[2], object.firstOrderTime);
  writer.writeDouble(offsets[3], object.paidPrice);
  writer.writeLong(offsets[4], object.pickupCode);
  writer.writeString(offsets[5], object.tableNum);
}

CustomerOrder _customerOrderDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = CustomerOrder();
  object.completedOrderTime = reader.readDateTime(offsets[0]);
  object.extraPrice = reader.readDouble(offsets[1]);
  object.firstOrderTime = reader.readDateTime(offsets[2]);
  object.paidPrice = reader.readDouble(offsets[3]);
  object.pickupCode = reader.readLong(offsets[4]);
  object.tableNum = reader.readString(offsets[5]);
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
      return (reader.readDateTime(offset)) as P;
    case 3:
      return (reader.readDouble(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension CustomerOrderQueryFilter
    on QueryBuilder<CustomerOrder, CustomerOrder, QFilterCondition> {
  QueryBuilder<CustomerOrder, CustomerOrder, QAfterFilterCondition>
      completedOrderTimeEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'completedOrderTime',
        value: value,
      ));
    });
  }

  QueryBuilder<CustomerOrder, CustomerOrder, QAfterFilterCondition>
      completedOrderTimeGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'completedOrderTime',
        value: value,
      ));
    });
  }

  QueryBuilder<CustomerOrder, CustomerOrder, QAfterFilterCondition>
      completedOrderTimeLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'completedOrderTime',
        value: value,
      ));
    });
  }

  QueryBuilder<CustomerOrder, CustomerOrder, QAfterFilterCondition>
      completedOrderTimeBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'completedOrderTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CustomerOrder, CustomerOrder, QAfterFilterCondition>
      extraPriceEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'extraPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CustomerOrder, CustomerOrder, QAfterFilterCondition>
      extraPriceGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'extraPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CustomerOrder, CustomerOrder, QAfterFilterCondition>
      extraPriceLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'extraPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CustomerOrder, CustomerOrder, QAfterFilterCondition>
      extraPriceBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'extraPrice',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CustomerOrder, CustomerOrder, QAfterFilterCondition>
      firstOrderTimeEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'firstOrderTime',
        value: value,
      ));
    });
  }

  QueryBuilder<CustomerOrder, CustomerOrder, QAfterFilterCondition>
      firstOrderTimeGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'firstOrderTime',
        value: value,
      ));
    });
  }

  QueryBuilder<CustomerOrder, CustomerOrder, QAfterFilterCondition>
      firstOrderTimeLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'firstOrderTime',
        value: value,
      ));
    });
  }

  QueryBuilder<CustomerOrder, CustomerOrder, QAfterFilterCondition>
      firstOrderTimeBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'firstOrderTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
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
