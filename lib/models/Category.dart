/*
* Copyright 2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
*
* Licensed under the Apache License, Version 2.0 (the "License").
* You may not use this file except in compliance with the License.
* A copy of the License is located at
*
*  http://aws.amazon.com/apache2.0
*
* or in the "license" file accompanying this file. This file is distributed
* on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
* express or implied. See the License for the specific language governing
* permissions and limitations under the License.
*/

// ignore_for_file: public_member_api_docs

import 'ModelProvider.dart';
import 'package:amplify_datastore_plugin_interface/amplify_datastore_plugin_interface.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';


/** This is an auto generated class representing the Category type in your schema. */
@immutable
class Category extends Model {
  static const classType = const _CategoryModelType();
  final String id;
  final String? _categoryname;
  final String? _userID;
  final List<Expense>? _Expenses;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  String get categoryname {
    try {
      return _categoryname!;
    } catch(e) {
      throw new DataStoreException(DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage, recoverySuggestion: DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion, underlyingException: e.toString());
    }
  }
  
  String get userID {
    try {
      return _userID!;
    } catch(e) {
      throw new DataStoreException(DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage, recoverySuggestion: DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion, underlyingException: e.toString());
    }
  }
  
  List<Expense>? get Expenses {
    return _Expenses;
  }
  
  const Category._internal({required this.id, required categoryname, required userID, Expenses}): _categoryname = categoryname, _userID = userID, _Expenses = Expenses;
  
  factory Category({String? id, required String categoryname, required String userID, List<Expense>? Expenses}) {
    return Category._internal(
      id: id == null ? UUID.getUUID() : id,
      categoryname: categoryname,
      userID: userID,
      Expenses: Expenses != null ? List<Expense>.unmodifiable(Expenses) : Expenses);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Category &&
      id == other.id &&
      _categoryname == other._categoryname &&
      _userID == other._userID &&
      DeepCollectionEquality().equals(_Expenses, other._Expenses);
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Category {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("categoryname=" + "$_categoryname" + ", ");
    buffer.write("userID=" + "$_userID");
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Category copyWith({String? id, String? categoryname, String? userID, List<Expense>? Expenses}) {
    return Category(
      id: id ?? this.id,
      categoryname: categoryname ?? this.categoryname,
      userID: userID ?? this.userID,
      Expenses: Expenses ?? this.Expenses);
  }
  
  Category.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _categoryname = json['categoryname'],
      _userID = json['userID'],
      _Expenses = json['Expenses'] is List
        ? (json['Expenses'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => Expense.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'categoryname': _categoryname, 'userID': _userID, 'Expenses': _Expenses?.map((e) => e?.toJson())?.toList()
  };

  static final QueryField ID = QueryField(fieldName: "category.id");
  static final QueryField CATEGORYNAME = QueryField(fieldName: "categoryname");
  static final QueryField USERID = QueryField(fieldName: "userID");
  static final QueryField EXPENSES = QueryField(
    fieldName: "Expenses",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (Expense).toString()));
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Category";
    modelSchemaDefinition.pluralName = "Categories";
    
    modelSchemaDefinition.authRules = [
      AuthRule(
        authStrategy: AuthStrategy.PUBLIC,
        operations: [
          ModelOperation.CREATE,
          ModelOperation.UPDATE,
          ModelOperation.DELETE,
          ModelOperation.READ
        ])
    ];
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Category.CATEGORYNAME,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Category.USERID,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
      key: Category.EXPENSES,
      isRequired: false,
      ofModelName: (Expense).toString(),
      associatedKey: Expense.CATEGORYID
    ));
  });
}

class _CategoryModelType extends ModelType<Category> {
  const _CategoryModelType();
  
  @override
  Category fromJson(Map<String, dynamic> jsonData) {
    return Category.fromJson(jsonData);
  }
}