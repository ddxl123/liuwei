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
    r'dishes': PropertySchema(
      id: 1,
      name: r'dishes',
      type: IsarType.objectList,
      target: r'CustomerDish',
    )
  },
  estimateSize: _customerEstimateSize,
  serialize: _customerSerialize,
  deserialize: _customerDeserialize,
  deserializeProp: _customerDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {
    r'CustomerDish': CustomerDishSchema,
    r'CustomerDishUnit': CustomerDishUnitSchema,
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
  {
    final value = object.customerOrder;
    if (value != null) {
      bytesCount += 3 +
          CustomerOrderSchema.estimateSize(
              value, allOffsets[CustomerOrder]!, allOffsets);
    }
  }
  {
    final list = object.dishes;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[CustomerDish]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount +=
              CustomerDishSchema.estimateSize(value, offsets, allOffsets);
        }
      }
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
  writer.writeObjectList<CustomerDish>(
    offsets[1],
    allOffsets,
    CustomerDishSchema.serialize,
    object.dishes,
  );
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
  );
  object.dishes = reader.readObjectList<CustomerDish>(
    offsets[1],
    CustomerDishSchema.deserialize,
    allOffsets,
    CustomerDish(),
  );
  object.id = id;
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
      )) as P;
    case 1:
      return (reader.readObjectList<CustomerDish>(
        offset,
        CustomerDishSchema.deserialize,
        allOffsets,
        CustomerDish(),
      )) as P;
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
}

extension CustomerQueryFilter
    on QueryBuilder<Customer, Customer, QFilterCondition> {
  QueryBuilder<Customer, Customer, QAfterFilterCondition>
      customerOrderIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'customerOrder',
      ));
    });
  }

  QueryBuilder<Customer, Customer, QAfterFilterCondition>
      customerOrderIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'customerOrder',
      ));
    });
  }

  QueryBuilder<Customer, Customer, QAfterFilterCondition> dishesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'dishes',
      ));
    });
  }

  QueryBuilder<Customer, Customer, QAfterFilterCondition> dishesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'dishes',
      ));
    });
  }

  QueryBuilder<Customer, Customer, QAfterFilterCondition> dishesLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'dishes',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Customer, Customer, QAfterFilterCondition> dishesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'dishes',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Customer, Customer, QAfterFilterCondition> dishesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'dishes',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Customer, Customer, QAfterFilterCondition> dishesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'dishes',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Customer, Customer, QAfterFilterCondition>
      dishesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'dishes',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Customer, Customer, QAfterFilterCondition> dishesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'dishes',
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
}

extension CustomerQueryObject
    on QueryBuilder<Customer, Customer, QFilterCondition> {
  QueryBuilder<Customer, Customer, QAfterFilterCondition> customerOrder(
      FilterQuery<CustomerOrder> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'customerOrder');
    });
  }

  QueryBuilder<Customer, Customer, QAfterFilterCondition> dishesElement(
      FilterQuery<CustomerDish> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'dishes');
    });
  }
}

extension CustomerQueryLinks
    on QueryBuilder<Customer, Customer, QFilterCondition> {}

extension CustomerQuerySortBy on QueryBuilder<Customer, Customer, QSortBy> {}

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
}

extension CustomerQueryWhereDistinct
    on QueryBuilder<Customer, Customer, QDistinct> {}

extension CustomerQueryProperty
    on QueryBuilder<Customer, Customer, QQueryProperty> {
  QueryBuilder<Customer, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Customer, CustomerOrder?, QQueryOperations>
      customerOrderProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'customerOrder');
    });
  }

  QueryBuilder<Customer, List<CustomerDish>?, QQueryOperations>
      dishesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dishes');
    });
  }
}

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const CustomerDishSchema = Schema(
  name: r'CustomerDish',
  id: -75567820968762462,
  properties: {
    r'customerDishUnits': PropertySchema(
      id: 0,
      name: r'customerDishUnits',
      type: IsarType.objectList,
      target: r'CustomerDishUnit',
    ),
    r'fatherCateGoryName': PropertySchema(
      id: 1,
      name: r'fatherCateGoryName',
      type: IsarType.string,
    ),
    r'imagePath': PropertySchema(
      id: 2,
      name: r'imagePath',
      type: IsarType.string,
    ),
    r'note': PropertySchema(
      id: 3,
      name: r'note',
      type: IsarType.string,
    ),
    r'subCateGoryName': PropertySchema(
      id: 4,
      name: r'subCateGoryName',
      type: IsarType.string,
    )
  },
  estimateSize: _customerDishEstimateSize,
  serialize: _customerDishSerialize,
  deserialize: _customerDishDeserialize,
  deserializeProp: _customerDishDeserializeProp,
);

int _customerDishEstimateSize(
  CustomerDish object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final list = object.customerDishUnits;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[CustomerDishUnit]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount +=
              CustomerDishUnitSchema.estimateSize(value, offsets, allOffsets);
        }
      }
    }
  }
  {
    final value = object.fatherCateGoryName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.imagePath;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.note;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.subCateGoryName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _customerDishSerialize(
  CustomerDish object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObjectList<CustomerDishUnit>(
    offsets[0],
    allOffsets,
    CustomerDishUnitSchema.serialize,
    object.customerDishUnits,
  );
  writer.writeString(offsets[1], object.fatherCateGoryName);
  writer.writeString(offsets[2], object.imagePath);
  writer.writeString(offsets[3], object.note);
  writer.writeString(offsets[4], object.subCateGoryName);
}

CustomerDish _customerDishDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = CustomerDish();
  object.customerDishUnits = reader.readObjectList<CustomerDishUnit>(
    offsets[0],
    CustomerDishUnitSchema.deserialize,
    allOffsets,
    CustomerDishUnit(),
  );
  object.fatherCateGoryName = reader.readStringOrNull(offsets[1]);
  object.imagePath = reader.readStringOrNull(offsets[2]);
  object.note = reader.readStringOrNull(offsets[3]);
  object.subCateGoryName = reader.readStringOrNull(offsets[4]);
  return object;
}

P _customerDishDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectList<CustomerDishUnit>(
        offset,
        CustomerDishUnitSchema.deserialize,
        allOffsets,
        CustomerDishUnit(),
      )) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension CustomerDishQueryFilter
    on QueryBuilder<CustomerDish, CustomerDish, QFilterCondition> {
  QueryBuilder<CustomerDish, CustomerDish, QAfterFilterCondition>
      customerDishUnitsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'customerDishUnits',
      ));
    });
  }

  QueryBuilder<CustomerDish, CustomerDish, QAfterFilterCondition>
      customerDishUnitsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'customerDishUnits',
      ));
    });
  }

  QueryBuilder<CustomerDish, CustomerDish, QAfterFilterCondition>
      customerDishUnitsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'customerDishUnits',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<CustomerDish, CustomerDish, QAfterFilterCondition>
      customerDishUnitsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'customerDishUnits',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<CustomerDish, CustomerDish, QAfterFilterCondition>
      customerDishUnitsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'customerDishUnits',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<CustomerDish, CustomerDish, QAfterFilterCondition>
      customerDishUnitsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'customerDishUnits',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<CustomerDish, CustomerDish, QAfterFilterCondition>
      customerDishUnitsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'customerDishUnits',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<CustomerDish, CustomerDish, QAfterFilterCondition>
      customerDishUnitsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'customerDishUnits',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<CustomerDish, CustomerDish, QAfterFilterCondition>
      fatherCateGoryNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'fatherCateGoryName',
      ));
    });
  }

  QueryBuilder<CustomerDish, CustomerDish, QAfterFilterCondition>
      fatherCateGoryNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'fatherCateGoryName',
      ));
    });
  }

  QueryBuilder<CustomerDish, CustomerDish, QAfterFilterCondition>
      fatherCateGoryNameEqualTo(
    String? value, {
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

  QueryBuilder<CustomerDish, CustomerDish, QAfterFilterCondition>
      fatherCateGoryNameGreaterThan(
    String? value, {
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

  QueryBuilder<CustomerDish, CustomerDish, QAfterFilterCondition>
      fatherCateGoryNameLessThan(
    String? value, {
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

  QueryBuilder<CustomerDish, CustomerDish, QAfterFilterCondition>
      fatherCateGoryNameBetween(
    String? lower,
    String? upper, {
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

  QueryBuilder<CustomerDish, CustomerDish, QAfterFilterCondition>
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

  QueryBuilder<CustomerDish, CustomerDish, QAfterFilterCondition>
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

  QueryBuilder<CustomerDish, CustomerDish, QAfterFilterCondition>
      fatherCateGoryNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'fatherCateGoryName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CustomerDish, CustomerDish, QAfterFilterCondition>
      fatherCateGoryNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'fatherCateGoryName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CustomerDish, CustomerDish, QAfterFilterCondition>
      fatherCateGoryNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fatherCateGoryName',
        value: '',
      ));
    });
  }

  QueryBuilder<CustomerDish, CustomerDish, QAfterFilterCondition>
      fatherCateGoryNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'fatherCateGoryName',
        value: '',
      ));
    });
  }

  QueryBuilder<CustomerDish, CustomerDish, QAfterFilterCondition>
      imagePathIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'imagePath',
      ));
    });
  }

  QueryBuilder<CustomerDish, CustomerDish, QAfterFilterCondition>
      imagePathIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'imagePath',
      ));
    });
  }

  QueryBuilder<CustomerDish, CustomerDish, QAfterFilterCondition>
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

  QueryBuilder<CustomerDish, CustomerDish, QAfterFilterCondition>
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

  QueryBuilder<CustomerDish, CustomerDish, QAfterFilterCondition>
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

  QueryBuilder<CustomerDish, CustomerDish, QAfterFilterCondition>
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

  QueryBuilder<CustomerDish, CustomerDish, QAfterFilterCondition>
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

  QueryBuilder<CustomerDish, CustomerDish, QAfterFilterCondition>
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

  QueryBuilder<CustomerDish, CustomerDish, QAfterFilterCondition>
      imagePathContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'imagePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CustomerDish, CustomerDish, QAfterFilterCondition>
      imagePathMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'imagePath',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CustomerDish, CustomerDish, QAfterFilterCondition>
      imagePathIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imagePath',
        value: '',
      ));
    });
  }

  QueryBuilder<CustomerDish, CustomerDish, QAfterFilterCondition>
      imagePathIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'imagePath',
        value: '',
      ));
    });
  }

  QueryBuilder<CustomerDish, CustomerDish, QAfterFilterCondition> noteIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'note',
      ));
    });
  }

  QueryBuilder<CustomerDish, CustomerDish, QAfterFilterCondition>
      noteIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'note',
      ));
    });
  }

  QueryBuilder<CustomerDish, CustomerDish, QAfterFilterCondition> noteEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'note',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CustomerDish, CustomerDish, QAfterFilterCondition>
      noteGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'note',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CustomerDish, CustomerDish, QAfterFilterCondition> noteLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'note',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CustomerDish, CustomerDish, QAfterFilterCondition> noteBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'note',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CustomerDish, CustomerDish, QAfterFilterCondition>
      noteStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'note',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CustomerDish, CustomerDish, QAfterFilterCondition> noteEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'note',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CustomerDish, CustomerDish, QAfterFilterCondition> noteContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'note',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CustomerDish, CustomerDish, QAfterFilterCondition> noteMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'note',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CustomerDish, CustomerDish, QAfterFilterCondition>
      noteIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'note',
        value: '',
      ));
    });
  }

  QueryBuilder<CustomerDish, CustomerDish, QAfterFilterCondition>
      noteIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'note',
        value: '',
      ));
    });
  }

  QueryBuilder<CustomerDish, CustomerDish, QAfterFilterCondition>
      subCateGoryNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'subCateGoryName',
      ));
    });
  }

  QueryBuilder<CustomerDish, CustomerDish, QAfterFilterCondition>
      subCateGoryNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'subCateGoryName',
      ));
    });
  }

  QueryBuilder<CustomerDish, CustomerDish, QAfterFilterCondition>
      subCateGoryNameEqualTo(
    String? value, {
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

  QueryBuilder<CustomerDish, CustomerDish, QAfterFilterCondition>
      subCateGoryNameGreaterThan(
    String? value, {
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

  QueryBuilder<CustomerDish, CustomerDish, QAfterFilterCondition>
      subCateGoryNameLessThan(
    String? value, {
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

  QueryBuilder<CustomerDish, CustomerDish, QAfterFilterCondition>
      subCateGoryNameBetween(
    String? lower,
    String? upper, {
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

  QueryBuilder<CustomerDish, CustomerDish, QAfterFilterCondition>
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

  QueryBuilder<CustomerDish, CustomerDish, QAfterFilterCondition>
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

  QueryBuilder<CustomerDish, CustomerDish, QAfterFilterCondition>
      subCateGoryNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'subCateGoryName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CustomerDish, CustomerDish, QAfterFilterCondition>
      subCateGoryNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'subCateGoryName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CustomerDish, CustomerDish, QAfterFilterCondition>
      subCateGoryNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'subCateGoryName',
        value: '',
      ));
    });
  }

  QueryBuilder<CustomerDish, CustomerDish, QAfterFilterCondition>
      subCateGoryNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'subCateGoryName',
        value: '',
      ));
    });
  }
}

extension CustomerDishQueryObject
    on QueryBuilder<CustomerDish, CustomerDish, QFilterCondition> {
  QueryBuilder<CustomerDish, CustomerDish, QAfterFilterCondition>
      customerDishUnitsElement(FilterQuery<CustomerDishUnit> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'customerDishUnits');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const CustomerDishUnitSchema = Schema(
  name: r'CustomerDishUnit',
  id: -8463885370622287709,
  properties: {
    r'foodDoneCount': PropertySchema(
      id: 0,
      name: r'foodDoneCount',
      type: IsarType.long,
    ),
    r'requiredCount': PropertySchema(
      id: 1,
      name: r'requiredCount',
      type: IsarType.long,
    ),
    r'unitName': PropertySchema(
      id: 2,
      name: r'unitName',
      type: IsarType.string,
    )
  },
  estimateSize: _customerDishUnitEstimateSize,
  serialize: _customerDishUnitSerialize,
  deserialize: _customerDishUnitDeserialize,
  deserializeProp: _customerDishUnitDeserializeProp,
);

int _customerDishUnitEstimateSize(
  CustomerDishUnit object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.unitName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _customerDishUnitSerialize(
  CustomerDishUnit object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.foodDoneCount);
  writer.writeLong(offsets[1], object.requiredCount);
  writer.writeString(offsets[2], object.unitName);
}

CustomerDishUnit _customerDishUnitDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = CustomerDishUnit();
  object.foodDoneCount = reader.readLongOrNull(offsets[0]);
  object.requiredCount = reader.readLongOrNull(offsets[1]);
  object.unitName = reader.readStringOrNull(offsets[2]);
  return object;
}

P _customerDishUnitDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension CustomerDishUnitQueryFilter
    on QueryBuilder<CustomerDishUnit, CustomerDishUnit, QFilterCondition> {
  QueryBuilder<CustomerDishUnit, CustomerDishUnit, QAfterFilterCondition>
      foodDoneCountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'foodDoneCount',
      ));
    });
  }

  QueryBuilder<CustomerDishUnit, CustomerDishUnit, QAfterFilterCondition>
      foodDoneCountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'foodDoneCount',
      ));
    });
  }

  QueryBuilder<CustomerDishUnit, CustomerDishUnit, QAfterFilterCondition>
      foodDoneCountEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'foodDoneCount',
        value: value,
      ));
    });
  }

  QueryBuilder<CustomerDishUnit, CustomerDishUnit, QAfterFilterCondition>
      foodDoneCountGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'foodDoneCount',
        value: value,
      ));
    });
  }

  QueryBuilder<CustomerDishUnit, CustomerDishUnit, QAfterFilterCondition>
      foodDoneCountLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'foodDoneCount',
        value: value,
      ));
    });
  }

  QueryBuilder<CustomerDishUnit, CustomerDishUnit, QAfterFilterCondition>
      foodDoneCountBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'foodDoneCount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CustomerDishUnit, CustomerDishUnit, QAfterFilterCondition>
      requiredCountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'requiredCount',
      ));
    });
  }

  QueryBuilder<CustomerDishUnit, CustomerDishUnit, QAfterFilterCondition>
      requiredCountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'requiredCount',
      ));
    });
  }

  QueryBuilder<CustomerDishUnit, CustomerDishUnit, QAfterFilterCondition>
      requiredCountEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'requiredCount',
        value: value,
      ));
    });
  }

  QueryBuilder<CustomerDishUnit, CustomerDishUnit, QAfterFilterCondition>
      requiredCountGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'requiredCount',
        value: value,
      ));
    });
  }

  QueryBuilder<CustomerDishUnit, CustomerDishUnit, QAfterFilterCondition>
      requiredCountLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'requiredCount',
        value: value,
      ));
    });
  }

  QueryBuilder<CustomerDishUnit, CustomerDishUnit, QAfterFilterCondition>
      requiredCountBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'requiredCount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CustomerDishUnit, CustomerDishUnit, QAfterFilterCondition>
      unitNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'unitName',
      ));
    });
  }

  QueryBuilder<CustomerDishUnit, CustomerDishUnit, QAfterFilterCondition>
      unitNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'unitName',
      ));
    });
  }

  QueryBuilder<CustomerDishUnit, CustomerDishUnit, QAfterFilterCondition>
      unitNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unitName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CustomerDishUnit, CustomerDishUnit, QAfterFilterCondition>
      unitNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'unitName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CustomerDishUnit, CustomerDishUnit, QAfterFilterCondition>
      unitNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'unitName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CustomerDishUnit, CustomerDishUnit, QAfterFilterCondition>
      unitNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'unitName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CustomerDishUnit, CustomerDishUnit, QAfterFilterCondition>
      unitNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'unitName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CustomerDishUnit, CustomerDishUnit, QAfterFilterCondition>
      unitNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'unitName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CustomerDishUnit, CustomerDishUnit, QAfterFilterCondition>
      unitNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'unitName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CustomerDishUnit, CustomerDishUnit, QAfterFilterCondition>
      unitNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'unitName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CustomerDishUnit, CustomerDishUnit, QAfterFilterCondition>
      unitNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unitName',
        value: '',
      ));
    });
  }

  QueryBuilder<CustomerDishUnit, CustomerDishUnit, QAfterFilterCondition>
      unitNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'unitName',
        value: '',
      ));
    });
  }
}

extension CustomerDishUnitQueryObject
    on QueryBuilder<CustomerDishUnit, CustomerDishUnit, QFilterCondition> {}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const CustomerOrderSchema = Schema(
  name: r'CustomerOrder',
  id: 7813251628506524948,
  properties: {
    r'close': PropertySchema(
      id: 0,
      name: r'close',
      type: IsarType.bool,
    ),
    r'orderTime': PropertySchema(
      id: 1,
      name: r'orderTime',
      type: IsarType.dateTime,
    ),
    r'packPrice': PropertySchema(
      id: 2,
      name: r'packPrice',
      type: IsarType.double,
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
    r'shouldPayPrice': PropertySchema(
      id: 5,
      name: r'shouldPayPrice',
      type: IsarType.double,
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
  return bytesCount;
}

void _customerOrderSerialize(
  CustomerOrder object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.close);
  writer.writeDateTime(offsets[1], object.orderTime);
  writer.writeDouble(offsets[2], object.packPrice);
  writer.writeDouble(offsets[3], object.paidPrice);
  writer.writeLong(offsets[4], object.pickupCode);
  writer.writeDouble(offsets[5], object.shouldPayPrice);
}

CustomerOrder _customerOrderDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = CustomerOrder();
  object.close = reader.readBoolOrNull(offsets[0]);
  object.orderTime = reader.readDateTimeOrNull(offsets[1]);
  object.packPrice = reader.readDoubleOrNull(offsets[2]);
  object.paidPrice = reader.readDoubleOrNull(offsets[3]);
  object.pickupCode = reader.readLongOrNull(offsets[4]);
  object.shouldPayPrice = reader.readDoubleOrNull(offsets[5]);
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
      return (reader.readBoolOrNull(offset)) as P;
    case 1:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 2:
      return (reader.readDoubleOrNull(offset)) as P;
    case 3:
      return (reader.readDoubleOrNull(offset)) as P;
    case 4:
      return (reader.readLongOrNull(offset)) as P;
    case 5:
      return (reader.readDoubleOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension CustomerOrderQueryFilter
    on QueryBuilder<CustomerOrder, CustomerOrder, QFilterCondition> {
  QueryBuilder<CustomerOrder, CustomerOrder, QAfterFilterCondition>
      closeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'close',
      ));
    });
  }

  QueryBuilder<CustomerOrder, CustomerOrder, QAfterFilterCondition>
      closeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'close',
      ));
    });
  }

  QueryBuilder<CustomerOrder, CustomerOrder, QAfterFilterCondition>
      closeEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'close',
        value: value,
      ));
    });
  }

  QueryBuilder<CustomerOrder, CustomerOrder, QAfterFilterCondition>
      orderTimeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'orderTime',
      ));
    });
  }

  QueryBuilder<CustomerOrder, CustomerOrder, QAfterFilterCondition>
      orderTimeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'orderTime',
      ));
    });
  }

  QueryBuilder<CustomerOrder, CustomerOrder, QAfterFilterCondition>
      orderTimeEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'orderTime',
        value: value,
      ));
    });
  }

  QueryBuilder<CustomerOrder, CustomerOrder, QAfterFilterCondition>
      orderTimeGreaterThan(
    DateTime? value, {
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
    DateTime? value, {
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
    DateTime? lower,
    DateTime? upper, {
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
      packPriceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'packPrice',
      ));
    });
  }

  QueryBuilder<CustomerOrder, CustomerOrder, QAfterFilterCondition>
      packPriceIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'packPrice',
      ));
    });
  }

  QueryBuilder<CustomerOrder, CustomerOrder, QAfterFilterCondition>
      packPriceEqualTo(
    double? value, {
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
    double? value, {
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
    double? value, {
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
    double? lower,
    double? upper, {
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
      paidPriceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'paidPrice',
      ));
    });
  }

  QueryBuilder<CustomerOrder, CustomerOrder, QAfterFilterCondition>
      paidPriceIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'paidPrice',
      ));
    });
  }

  QueryBuilder<CustomerOrder, CustomerOrder, QAfterFilterCondition>
      paidPriceEqualTo(
    double? value, {
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
    double? value, {
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
    double? value, {
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
    double? lower,
    double? upper, {
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
      pickupCodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'pickupCode',
      ));
    });
  }

  QueryBuilder<CustomerOrder, CustomerOrder, QAfterFilterCondition>
      pickupCodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'pickupCode',
      ));
    });
  }

  QueryBuilder<CustomerOrder, CustomerOrder, QAfterFilterCondition>
      pickupCodeEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pickupCode',
        value: value,
      ));
    });
  }

  QueryBuilder<CustomerOrder, CustomerOrder, QAfterFilterCondition>
      pickupCodeGreaterThan(
    int? value, {
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
    int? value, {
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
    int? lower,
    int? upper, {
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
      shouldPayPriceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'shouldPayPrice',
      ));
    });
  }

  QueryBuilder<CustomerOrder, CustomerOrder, QAfterFilterCondition>
      shouldPayPriceIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'shouldPayPrice',
      ));
    });
  }

  QueryBuilder<CustomerOrder, CustomerOrder, QAfterFilterCondition>
      shouldPayPriceEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'shouldPayPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CustomerOrder, CustomerOrder, QAfterFilterCondition>
      shouldPayPriceGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'shouldPayPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CustomerOrder, CustomerOrder, QAfterFilterCondition>
      shouldPayPriceLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'shouldPayPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CustomerOrder, CustomerOrder, QAfterFilterCondition>
      shouldPayPriceBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'shouldPayPrice',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension CustomerOrderQueryObject
    on QueryBuilder<CustomerOrder, CustomerOrder, QFilterCondition> {}
