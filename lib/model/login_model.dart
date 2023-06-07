// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  bool? success;
  String? message;
  Data? data;

  LoginModel({
    this.success,
    this.message,
    this.data,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data?.toJson(),
      };
}

class Data {
  User? user;
  String? token;

  Data({
    this.user,
    this.token,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "user": user?.toJson(),
        "token": token,
      };
}

class User {
  int? id;
  String? username;
  int? employeeId;
  String? userTypeId;
  Employee? employee;
  Usertype? usertype;

  User({
    this.id,
    this.username,
    this.employeeId,
    this.userTypeId,
    this.employee,
    this.usertype,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        username: json["username"],
        employeeId: json["employee_id"],
        userTypeId: json["user_type_id"],
        employee: json["employee"] == null
            ? null
            : Employee.fromJson(json["employee"]),
        usertype: json["usertype"] == null
            ? null
            : Usertype.fromJson(json["usertype"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "employee_id": employeeId,
        "user_type_id": userTypeId,
        "employee": employee?.toJson(),
        "usertype": usertype?.toJson(),
      };
}

class Employee {
  int? id;
  String? employeeName;
  String? employeeCode;
  int? franchiseId;
  Franchise? franchise;

  Employee({
    this.id,
    this.employeeName,
    this.employeeCode,
    this.franchiseId,
    this.franchise,
  });

  factory Employee.fromJson(Map<String, dynamic> json) => Employee(
        id: json["id"],
        employeeName: json["employee_name"],
        employeeCode: json["employee_code"],
        franchiseId: json["franchise_id"],
        franchise: json["franchise"] == null
            ? null
            : Franchise.fromJson(json["franchise"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "employee_name": employeeName,
        "employee_code": employeeCode,
        "franchise_id": franchiseId,
        "franchise": franchise?.toJson(),
      };
}

class Franchise {
  int? id;
  String? franchiseeCode;

  Franchise({
    this.id,
    this.franchiseeCode,
  });

  factory Franchise.fromJson(Map<String, dynamic> json) => Franchise(
        id: json["id"],
        franchiseeCode: json["franchisee_code"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "franchisee_code": franchiseeCode,
      };
}

class Usertype {
  int? id;
  String? name;

  Usertype({
    this.id,
    this.name,
  });

  factory Usertype.fromJson(Map<String, dynamic> json) => Usertype(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
