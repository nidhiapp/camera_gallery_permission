import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  const Details({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        const ListTile(
          leading: Icon(Icons.person, color: Colors.grey,),
          title: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                 Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Text("Name",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w500,fontSize: 18),),
                     Padding(
                       padding: EdgeInsets.all(8.0),
                       child: Text("xyz",style: TextStyle(color: Colors.white,fontSize: 18),),
                     ),
                     SizedBox(height: 10,)
                   ],
                 ),
                  Icon(Icons.edit, color: Color.fromARGB(255, 22, 187, 157),)
                ],
              ),
              Text("This is not your username or pin. This name will be visible to your Whatsapp contacts.",
              style: TextStyle(fontSize: 14, color: Colors.grey, fontWeight: FontWeight.w400),)
            ],
          ),
        ),
      Padding(
        padding: const EdgeInsets.only(left:62.0,top: 15,bottom: 15),
        child: Container(height: 0.5,color: const Color.fromARGB(255, 113, 112, 112),),
      ),
      
        const ListTile(
          leading: Icon(Icons.info_outline, color: Colors.grey,),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
             Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Text("About",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w500,fontSize: 18),),
                 Text("🇮🇳🇮🇳🇮🇳"),
               ],
             ),
              Icon(Icons.edit, color: Color.fromARGB(255, 22, 187, 157),)
            ],
          ),
        ),
         Padding(
        padding: const EdgeInsets.only(left:62.0,top: 15,bottom: 15),
        child: Container(height: 0.5,color: const Color.fromARGB(255, 113, 112, 112),),
      ),
        const ListTile(
          leading: Icon(Icons.call, color: Colors.grey,),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Phone", style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w500,fontSize: 18),),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("+91 123234341",style: TextStyle(color: Colors.white,fontSize: 18),),
              ),
            ],
          ),
        ),
      ],

    );
  }
}