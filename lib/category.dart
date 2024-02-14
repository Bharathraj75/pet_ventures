import 'package:bharath_task/custom.dart';
import 'package:bharath_task/styles.dart';
import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {

  var categoryList = [
    {"name":"Community","img":"community"},
    {"name":"Adoption","img":"adoption"},
    {"name":"Greet and Meet","img":"community"},
    {"name":"Pet Care","img":"petCare"},
    {"name":"Store","img":"store"},
    {"name":"Insurance","img":"insurance"},
    {"name":"Service","img":"service"},
    {"name":"Matches","img":"matches"},
    {"name":"Nutrition","img":"nutrition"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: customDrawer(context),
      appBar: AppBar(
        centerTitle: true,
        title: Text("Categories",style: header.copyWith(fontSize: 18),),
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.fromLTRB(0, 80, 0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            viewList()
          ],
        ),
      ),
    );
  }

  viewList(){
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      runAlignment: WrapAlignment.spaceBetween,
      alignment: WrapAlignment.spaceBetween,
      runSpacing: 15,
      children: List.generate(categoryList.length, (index){
        var catInfo = categoryList[index];
        print(catInfo);
        return Container(
          constraints: BoxConstraints(
            minWidth: 110
          ),
          margin: const EdgeInsets.fromLTRB(4, 8, 4, 8),
          padding: const EdgeInsets.fromLTRB(4, 8, 4, 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.blue.withOpacity(0.1)
          ),
          child: Column(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset("lib/images/${catInfo['img']}.png",height: 60,width: 60,fit: BoxFit.fitHeight,),
              ),
              Text("${catInfo['name']}")
            ],
          ),
        );
      }),
    );
  }


}
