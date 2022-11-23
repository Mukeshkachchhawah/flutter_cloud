import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
// void main() {
//   runApp(const MyApp());
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  File ? file;
  ImagePicker image = ImagePicker();

  final _formKey = GlobalKey<FormState>();
  var name = '';
  var email = '';
  var password= '';
  var number = 0;

  CollectionReference user = FirebaseFirestore.instance.collection("user");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text("Flutter Firebase"),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: GestureDetector(
                onTap: () {
                  getgellry();
                },
                child: Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blueAccent),
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: file == null ? Icon(Icons.image): Image.file(file!, fit: BoxFit.fill,)
                ),
              ),
            ),
SizedBox(
  height: 20,
),
Form(
  key: _formKey,
  child:   Column(
    children: [
      TextFormField(
        decoration: InputDecoration(
      
          hintText: "User Name",
      
          icon: Icon(Icons.person)
      
        ),onChanged: (value) {
          
        },
        validator: (value) {
          if(value==null || value.isEmpty){
            return "Please Enter Name";
          }
          return null;
        },
      
      ),
      SizedBox(
  height: 10,
),
TextFormField(
  
  decoration: InputDecoration(
    hintText: "User Email",
    icon: Icon(Icons.person)
  ),
  onChanged: (value) {
    
  },
  validator: (value) {
    if(value == null || value.isEmpty){
      return "Enter email id";
    }return null;
  },
),
SizedBox(
  height: 10,
),
TextFormField(
  
  decoration: InputDecoration(
    hintText: "password",
    icon: Icon(Icons.person)
  ),
  onChanged: (value) {
    
  },
  validator: (value) {
    if(value == null|| value.isEmpty){
      return "Enter your Password";
    }
  },
),SizedBox(
  height: 10,
),
TextFormField(
  
  decoration: InputDecoration(
    hintText: "Mobile Number",
    icon: Icon(Icons.person)
  ),
  onChanged: (value) {
    
  },
  validator: (value) {
    if(value==null|| value.isEmpty){
      return "Enter Your Mobile Number";
    }
  },
),
SizedBox(
  height: 30,
),
ElevatedButton.icon(onPressed: (){
  if(_formKey.currentState!.validate()){
ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Data Seved")));
user.add({"name": "Mukesh", 'email': "mukeshkachhawah49", 'password': "Mukesh7296", 'number': 7296826128}).then((value) => print("Data Seved"));
  }
}, icon: Icon(Icons.ads_click_rounded), label: Text("Click"))
    ],
  ),
),
          ],
        ),
      ),
    );
  }

  getgellry()async{
    var images = await image.getImage(source: ImageSource.gallery);
    setState(() {
      file = File(images!.path);
    });
  }
}
