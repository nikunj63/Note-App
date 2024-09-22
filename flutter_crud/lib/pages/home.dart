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
  TextEditingController namecontoller= new TextEditingController();
  TextEditingController agecontoller= new TextEditingController();
  TextEditingController locationcontoller= new TextEditingController();

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
                        
                        children: [
                          Text("Name: "+ds["Name"],
                          style: TextStyle(
                            color: Colors.blue,fontSize: 20.0,fontWeight:FontWeight.bold
                          ),
                          ),
                          Spacer(),
                          GestureDetector(
                            onTap:(){
                              namecontoller.text=ds["Name"];
                              agecontoller.text=ds["Age"];
                              locationcontoller.text=ds["Location"];
                              EditEmployeeDetail(ds["ID"]);
                            },
                            child: Icon(Icons.edit,color:Colors.orange)),
                            SizedBox(width: 5.0,),
                            GestureDetector(
                              onTap: ()async{
                                await Database().deleteEmployeeDetails(ds["ID"]);
                              },
                              child: Icon(Icons.delete,color:Colors.orange))
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
  Future EditEmployeeDetail(String id)=> showDialog(context: context, builder: (contex)=> AlertDialog(
    content: Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Icon(Icons.cancel)
                ),
                SizedBox(width: 60.0,),
                Text(
              "Edit",
              style: TextStyle(
                color: Colors.blue,
                fontSize: 25,
                fontWeight:FontWeight.bold,
              ),
            ),
            Text(
              "Details",
              style: TextStyle(
                color: Colors.orange,
                fontSize: 25,
                fontWeight:FontWeight.bold,
              ),
            ),
            ],
          ),
          SizedBox(height: 20.0,),
          const Text(
              "Name",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
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
                fontSize: 20.0,
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
                fontSize: 20.0,
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
            SizedBox(height: 30.0,),
            Center(child: ElevatedButton(
              onPressed: ()async{
                Map<String, dynamic> updateInfo={
                  "Name":namecontoller.text,
                  "Age":agecontoller.text,
                  "ID":id,
                  "Location":locationcontoller.text,
                };
                await Database().UpdateEmployeeDetails(id,updateInfo).then((value){
                  Navigator.pop(context);
                });
            },
             child: Text("Update")))
        ],
      ),
    ),
  ));
}