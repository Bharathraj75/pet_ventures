import 'package:bharath_task/home.dart';
import 'package:bharath_task/styles.dart';
import 'package:flutter/material.dart';
import 'category.dart';

customDrawer(context){
  return Drawer(
    child: Column(
      children: [
        Container(
          height: 160,
          color: blueCl.withOpacity(0.1),
        ),
        ListTile(
          title: const Text("Home"),
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> const Home()));
          },
          leading: Icon(Icons.home,color: blueCl,),
          trailing: Icon(Icons.arrow_forward_ios_rounded,color: blueCl,),
        ),
        ListTile(
          title: const Text("Categories"),
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> const Categories()));
          },
          leading: Icon(Icons.category_rounded,color: blueCl,),
          trailing: Icon(Icons.arrow_forward_ios_rounded,color: blueCl,),
        ),
      ],
    ),
  );
}