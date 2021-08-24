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

import 'package:amplify_datastore_plugin_interface/amplify_datastore_plugin_interface.dart';
import 'package:flutter/foundation.dart';


/** This is an auto generated class representing the Expense type in your schema. */
@immutable
class Expense extends Model {
  static const classType = const _ExpenseModelType();
  final String id;
  final String? _expensename;
  final double? _expensevalue;
  final String? _expenseimagekey;
  final String? _userID;
  final String? _categoryID;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  String get expensename {
    try {
      return _expensename!;
    } catch(e) {
      throw new DataStoreException(DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage, recoverySuggestion: DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion, underlyingException: e.toString());
    }
  }
  
  double get expensevalue {
    try {
      return _expensevalue!;
    } catch(e) {
      throw new DataStoreException(DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage, recoverySuggestion: DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion, underlyingException: e.toString());
    }
  }
  
  String? get expenseimagekey {
    return _expenseimagekey;
  }
  
  String get userID {
    try {
      return _userID!;
    } catch(e) {
      throw new DataStoreException(DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage, recoverySuggestion: DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion, underlyingException: e.toString());
    }
  }
  
  String get categoryID {
    try {
      return _categoryID!;
    } catch(e) {
      throw new DataStoreException(DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage, recoverySuggestion: DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion, underlyingException: e.toString());
    }
  }
  
  const Expense._internal({required this.id, required expensename, required expensevalue, expenseimagekey, required userID, required categoryID}): _expensename = expensename, _expensevalue = expensevalue, _expenseimagekey = expenseimagekey, _userID = userID, _categoryID = categoryID;
  
  factory Expense({String? id, required String expensename, required double expensevalue, String? expenseimagekey, required String userID, required String categoryID}) {
    return Expense._internal(
      id: id == null ? UUID.getUUID() : id,
      expensename: expensename,
      expensevalue: expensevalue,
      expenseimagekey: expenseimagekey,
      userID: userID,
      categoryID: categoryID);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Expense &&
      id == other.id &&
      _expensename == other._expensename &&
      _expensevalue == other._expensevalue &&
      _expenseimagekey == other._expenseimagekey &&
      _userID == other._userID &&
      _categoryID == other._categoryID;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Expense {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("expensename=" + "$_expensename" + ", ");
    buffer.write("expensevalue=" + (_expensevalue != null ? _expensevalue!.toString() : "null") + ", ");
    buffer.write("expenseimagekey=" + "$_expenseimagekey" + ", ");
    buffer.write("userID=" + "$_userID" + ", ");
    buffer.write("categoryID=" + "$_categoryID");
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Expense copyWith({String? id, String? expensename, double? expensevalue, String? expenseimagekey, String? userID, String? categoryID}) {
    return Expense(
      id: id ?? this.id,
      expensename: expensename ?? this.expensename,
      expensevalue: expensevalue ?? this.expensevalue,
      expenseimagekey: expenseimagekey ?? this.expenseimagekey,
      userID: userID ?? this.userID,
      categoryID: categoryID ?? this.categoryID);
  }
  
  Expense.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _expensename = json['expensename'],
      _expensevalue = json['expensevalue'],
      _expenseimagekey = json['expenseimagekey'],
      _userID = json['userID'],
      _categoryID = json['categoryID'];
  
  Map<String, dynamic> toJson() => {
    'id': id, 'expensename': _expensename, 'expensevalue': _expensevalue, 'expenseimagekey': _expenseimagekey, 'userID': _userID, 'categoryID': _categoryID
  };

  static final QueryField ID = QueryField(fieldName: "expense.id");
  static final QueryField EXPENSENAME = QueryField(fieldName: "expensename");
  static final QueryField EXPENSEVALUE = QueryField(fieldName: "expensevalue");
  static final QueryField EXPENSEIMAGEKEY = QueryField(fieldName: "expenseimagekey");
  static final QueryField USERID = QueryField(fieldName: "userID");
  static final QueryField CATEGORYID = QueryField(fieldName: "categoryID");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Expense";
    modelSchemaDefinition.pluralName = "Expenses";
    
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
      key: Expense.EXPENSENAME,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Expense.EXPENSEVALUE,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Expense.EXPENSEIMAGEKEY,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Expense.USERID,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Expense.CATEGORYID,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
  });
}

class _ExpenseModelType extends ModelType<Expense> {
  const _ExpenseModelType();
  
  @override
  Expense fromJson(Map<String, dynamic> jsonData) {
    return Expense.fromJson(jsonData);
  }
}