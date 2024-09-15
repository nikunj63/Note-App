import 'package:flutter/material.dart';

class Employee extends StatefulWidget {
  const Employee({super.key});

  @override
  State<Employee> createState() => _EmployeeState();
}

class _EmployeeState extends State<Employee> {
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
              child: const TextField(
                decoration: InputDecoration(
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
              child:const TextField(
                decoration: InputDecoration(
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
              child:const TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ),
           const SizedBox(height: 30.0,),
            Center(
              child: ElevatedButton(
                onPressed: (){}, 
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