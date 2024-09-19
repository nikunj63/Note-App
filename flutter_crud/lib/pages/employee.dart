import 'package:flutter/material.dart';
import 'package:flutter_crud/services/database.dart';
import 'package:random_string/random_string.dart';

class Employee extends StatefulWidget {
  const Employee({super.key});

  @override
  State<Employee> createState() => _EmployeeState();
}

class _EmployeeState extends State<Employee> {
  TextEditingController namecontoller= new TextEditingController();
  TextEditingController agecontoller= new TextEditingController();
  TextEditingController locationcontoller= new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Employee",
              style: TextStyle(
                color: Colors.blue,
                fontSize: 25,
                fontWeight:FontWeight.bold,
              ),
            ),
            Text(
              "Form",
              style: TextStyle(
                color: Colors.orange,
                fontSize: 25,
                fontWeight:FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 20.0,top: 30.0,right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           const Text(
              "Name",
              style: TextStyle(
                color: Colors.black,
                fontSize: 26.0,
                fontWeight: FontWeight.bold,
              ),
            ),
           const SizedBox(height: 10.0,),
            Container(
              padding: const EdgeInsets.only(left: 10.0),
              decoration: BoxDecoration(
                border: Border.all(),borderRadius: BorderRadius.circular(10)
              ),
              child: TextField(
                controller: namecontoller ,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
              ),
              
            ),
           const SizedBox(height: 20,),
           const Text(
              "Age",
              style: TextStyle(
                color: Colors.black,
                fontSize: 26.0,
                fontWeight: FontWeight.bold,
              ),
            ),
           const SizedBox(height: 10.0,),
            Container(
              padding:const EdgeInsets.only(left: 10.0),
              decoration: BoxDecoration(
                border: Border.all(),borderRadius: BorderRadius.circular(10)
              ),
              child: TextField(
                controller: agecontoller,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ),
           const SizedBox(height: 20,),
           const Text(
              "Location",
              style: TextStyle(
                color: Colors.black,
                fontSize: 26.0,
                fontWeight: FontWeight.bold,
              ),
            ),
           const SizedBox(height: 10.0,),
            Container(
              padding: const EdgeInsets.only(left: 10.0),
              decoration: BoxDecoration(
                border: Border.all(),borderRadius: BorderRadius.circular(10)
              ),
              child: TextField(
                controller: locationcontoller,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ),
           const SizedBox(height: 30.0,),
            Center(
              child: ElevatedButton(
                onPressed: () async{
                  String ID = randomAlphaNumeric(10);
                  Map<String, dynamic> employeeInfoMap={
                    "Name":namecontoller.text,
                    "Age":agecontoller.text,
                    "Location":locationcontoller.text,
                  };
                  await Database().addEmployeeDetails(employeeInfoMap,ID);
                }, 
                child: const Text(
                  "Add",style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),
                ),
                ),
            )
          ],
        ),
      ),
    );
  }
}