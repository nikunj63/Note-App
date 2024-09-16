import 'package:cloud_firestore/cloud_firestore.dart';

class Database {
  Future addEmployeeDetails(Map<String,dynamic> employeeInfoMap)async{
    return await FirebaseFirestore.instance
    .collection("Employee")
    .doc(id)
    .set(employeeInfoMap);
  }
}