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


/** This is an auto generated class representing the User type in your schema. */
@immutable
class User extends Model {
  static const classType = const _UserModelType();
  final String id;
  final String? _displayname;
  final String? _username;
  final TemporalDateTime? _createdAt;
  final String? _avatarkey;
  final List<Expense>? _Expenses;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  String get displayname {
    try {
      return _displayname!;
    } catch(e) {
      throw new DataStoreException(DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage, recoverySuggestion: DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion, underlyingException: e.toString());
    }
  }
  
  String get username {
    try {
      return _username!;
    } catch(e) {
      throw new DataStoreException(DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage, recoverySuggestion: DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion, underlyingException: e.toString());
    }
  }
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  String? get avatarkey {
    return _avatarkey;
  }
  
  List<Expense>? get Expenses {
    return _Expenses;
  }
  
  const User._internal({required this.id, required displayname, required username, createdAt, avatarkey, Expenses}): _displayname = displayname, _username = username, _createdAt = createdAt, _avatarkey = avatarkey, _Expenses = Expenses;
  
  factory User({String? id, required String displayname, required String username, TemporalDateTime? createdAt, String? avatarkey, List<Expense>? Expenses}) {
    return User._internal(
      id: id == null ? UUID.getUUID() : id,
      displayname: displayname,
      username: username,
      createdAt: createdAt,
      avatarkey: avatarkey,
      Expenses: Expenses != null ? List<Expense>.unmodifiable(Expenses) : Expenses);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is User &&
      id == other.id &&
      _displayname == other._displayname &&
      _username == other._username &&
      _createdAt == other._createdAt &&
      _avatarkey == other._avatarkey &&
      DeepCollectionEquality().equals(_Expenses, other._Expenses);
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("User {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("displayname=" + "$_displayname" + ", ");
    buffer.write("username=" + "$_username" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("avatarkey=" + "$_avatarkey");
    buffer.write("}");
    
    return buffer.toString();
  }
  
  User copyWith({String? id, String? displayname, String? username, TemporalDateTime? createdAt, String? avatarkey, List<Expense>? Expenses}) {
    return User(
      id: id ?? this.id,
      displayname: displayname ?? this.displayname,
      username: username ?? this.username,
      createdAt: createdAt ?? this.createdAt,
      avatarkey: avatarkey ?? this.avatarkey,
      Expenses: Expenses ?? this.Expenses);
  }
  
  User.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _displayname = json['displayname'],
      _username = json['username'],
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _avatarkey = json['avatarkey'],
      _Expenses = json['Expenses'] is List
        ? (json['Expenses'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => Expense.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'displayname': _displayname, 'username': _username, 'createdAt': _createdAt?.format(), 'avatarkey': _avatarkey, 'Expenses': _Expenses?.map((e) => e?.toJson())?.toList()
  };

  static final QueryField ID = QueryField(fieldName: "user.id");
  static final QueryField DISPLAYNAME = QueryField(fieldName: "displayname");
  static final QueryField USERNAME = QueryField(fieldName: "username");
  static final QueryField CREATEDAT = QueryField(fieldName: "createdAt");
  static final QueryField AVATARKEY = QueryField(fieldName: "avatarkey");
  static final QueryField EXPENSES = QueryField(
    fieldName: "Expenses",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (Expense).toString()));
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "User";
    modelSchemaDefinition.pluralName = "Users";
    
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
      key: User.DISPLAYNAME,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: User.USERNAME,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: User.CREATEDAT,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: User.AVATARKEY,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
      key: User.EXPENSES,
      isRequired: false,
      ofModelName: (Expense).toString(),
      associatedKey: Expense.USERID
    ));
  });
}

class _UserModelType extends ModelType<User> {
  const _UserModelType();
  
  @override
  User fromJson(Map<String, dynamic> jsonData) {
    return User.fromJson(jsonData);
  }
}