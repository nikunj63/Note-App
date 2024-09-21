import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_crud/pages/employee.dart';
import 'package:flutter_crud/services/database.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Stream? EmployeeStream;
  getontheload()async{
    EmployeeStream= await Database().getEmployeeDetails();
    setState(() {
      
    });
  }
  @override
  void initState(){
    getontheload();
    super.initState();
  }

  Widget allEmployeedetails(){
    return StreamBuilder( 
      stream: EmployeeStream,
      builder: (context,AsyncSnapshot snapshot){
      return snapshot.hasData? ListView.builder(
        itemCount: snapshot.data.docs.length,
        itemBuilder: (context,index){
          DocumentSnapshot ds=snapshot.data.docs[index];
          return Container(
            margin: const  EdgeInsets.only(bottom: 20.0),
            child: Material(
                elevation: 5.0,
                borderRadius:BorderRadius.circular(10),
                child: Container(
                  padding:const EdgeInsets.all(20.0),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(color: Colors.white,borderRadius:BorderRadius.circular(10) ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Name: "+ds["Name"],
                          style: TextStyle(
                            color: Colors.blue,fontSize: 20.0,fontWeight:FontWeight.bold
                          ),
                          ),
                          Icon(Icons.edit,color:Colors.orange),
                        ],
                      ),
                      Text("Age:"+ds["Age"],
                      style: TextStyle(
                        color: Colors.orange,fontSize: 20.0,fontWeight:FontWeight.bold
                      ),
                      ),
                      Text("Loaction:"+ds["Location"],
                      style: TextStyle(
                        color: Colors.blue,fontSize: 20.0,fontWeight:FontWeight.bold
                      ),
                      )
                    ],
                  ),
                ),
              ),
          );
        },)
      :Container();
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => const Employee(),));
      },child: const Icon(Icons.add),),
      appBar: AppBar(
        title:const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "EmployeeData",
              style: TextStyle(
                color: Colors.blue,
                fontSize: 25,
                fontWeight:FontWeight.bold,
              ),
            ),
            Text(
              "(with Details)",
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
        margin: const EdgeInsets.only(left: 20.0,right: 20.0,top: 30.0),
        child:Column(
          children: [
            Expanded(child: allEmployeedetails())
          ],
        ) ,
      ),
    );
  }
}