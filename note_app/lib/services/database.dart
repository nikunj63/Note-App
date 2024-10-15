import 'package:cloud_firestore/cloud_firestore.dart';

class Database {
  //Create
  Future addEmployeeDetails(Map<String,dynamic> employeeInfoMap, String id)async{
    return await FirebaseFirestore.instance
    .collection("Employee")
    .doc(id)
    .set(employeeInfoMap);
  }

  //Read
  Future<Stream<QuerySnapshot>> getEmployeeDetails()async{
    return await FirebaseFirestore.instance.collection("Employee").snapshots();
  }
  //Update

  Future UpdateEmployeeDetails(String id,Map<String,dynamic> updateInfo)async{
    return await FirebaseFirestore.instance.collection("Employee").doc(id).update(updateInfo);
  }

  //Delete
  Future deleteEmployeeDetails(String id)async{
    return await FirebaseFirestore.instance.collection("Employee").doc(id).delete();
  }


}