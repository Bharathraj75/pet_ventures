import 'package:bharath_task/category.dart';
import 'package:bharath_task/profile.dart';
import 'package:bharath_task/styles.dart';
import 'package:flutter/material.dart';

import 'custom.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {


  var statusList = [
    {"img":"image1","name":"champ_bharath"},
    {"img":"image2","name":"tamil_mani"},
    {"img":"image3","name":"mark_lukse"},
    {"img":"image4","name":"tony_stark"},
    {"img":"image5","name":"steve_jobs"},
    {"img":"image6","name":"lames_roods"},
  ];

  var clipsList = [
    {"img":"pet1"},
    {"img":"pet2"},
    {"img":"pet3"},
    {"img":"pet4"},
    {"img":"pet5"},
  ];

  var postList = [
    {"img":"post1","name":"Bharath","period":"just now","userImg":"person1"},
    {"img":"post2","name":"Tamil","period":"5 min ago","userImg":"person2"},
    {"img":"post3","name":"Vishwa","period":"11 min ago","userImg":"person3"},
    {"img":"post4","name":"Ajith","period":"20 min ago","userImg":"person4"},
    {"img":"post5","name":"Vijay","period":"1 hrs ago","userImg":"person5"},
  ];

  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context){

    return Scaffold(
      drawer: customDrawer(context),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_rounded,color: blueCl,),label: '',),
          BottomNavigationBarItem(icon: Icon(Icons.search,color: blueCl,),label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.add,color: blueCl,),label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.category_rounded,color: blueCl,),label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.stars,color: blueCl,),label: ''),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: const Text("Petventures"),
            centerTitle: true,
            actions: [
              IconButton(onPressed: (){}, icon: const Icon(Icons.notifications_sharp)),
              IconButton(onPressed: (){}, icon: const Icon(Icons.message_outlined)),
            ],
          ),
          SliverToBoxAdapter(
            child: statusView(),
          ),
          SliverToBoxAdapter(
            child: clipsView(),
          ),
          SliverToBoxAdapter(
            child: postView(),
          )
        ],
      ),
    );
    
  }

  statusView(){
    return Container(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(statusList.length + 1, (index){
            if(index == 0){
              return Column(
                children: [
                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: blueCl,width: 2),
                        ),
                        margin: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                        padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                        child: const Icon(Icons.person,color: Colors.grey,size: 50,),
                      ),
                      Icon(Icons.add_circle_outlined,color: blueCl,)
                    ],
                  ),
                  const Text("Add New")
                ],
              );
            }else{
              var imgData = statusList[index-1];
              return Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: blueCl,width: 2),
                    ),
                    margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.asset("lib/images/${imgData['img']}.jpeg",height: 60,width: 60,fit: BoxFit.fitHeight,)
                    ),
                  ),
                  Text("${imgData['name']} ",style: TextStyle(fontSize: 12),),
                ],
              );
            }
          }),
        ),
      ),
    );
  }

  clipsView(){
    return Container(
      margin: const EdgeInsets.fromLTRB(10, 10, 2, 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("  Clips",style: header,),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(clipsList.length , (index){
                var clipInfo = clipsList[index];
                return Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      margin: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset("lib/images/${clipInfo['img']}.jpeg",height: 120,width: 80,fit: BoxFit.fitHeight,)
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Icon(Icons.play_arrow_outlined,color: greyCl,),
                    )
                  ],
                );
              }),
            ),
          )
        ],
      ),
    );
  }

  postView(){
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 20, 0, 20),
      child: Column(
        children: List.generate(postList.length, (index){
          var postInfo = postList[index];
          return Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap:(){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> Profile(userData: postInfo,)));
                        },
                        child: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: index.isEven ? blueCl : greyCl,width: 2),
                              ),
                              margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: Image.asset("lib/images/${postInfo['userImg']}.jpeg",height: 40,width: 40,fit: BoxFit.fitHeight,),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("${postInfo['name']}"),
                                Text("${postInfo['period']}",style: TextStyle(color: greyCl,fontSize: 12),),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const Icon(Icons.menu_rounded)
                    ],
                  ),
                ),
          Container(
            // decoration: BoxDecoration(
            //   borderRadius: BorderRadius.circular(5),
            // ),
            margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
            child: Image.asset("lib/images/${postInfo['img']}.jpeg",width: MediaQuery.of(context).size.width,fit: BoxFit.fitWidth,),
          ),
              ],
            ),
          );
        }),
      ),
    );
  }

}
