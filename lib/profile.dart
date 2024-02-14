import 'package:bharath_task/styles.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  final dynamic userData;
  const Profile({super.key,this.userData});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with TickerProviderStateMixin{

  var userData = {};
  late TabController tabController;
  var imageList = [
    {"img":"cat1"},
    {"img":"cat2"},
    {"img":"dog1"},
    {"img":"dog2"},
    {"img":"dog3"},
    {"img":"cat3"},
    {"img":"cat4"},
    {"img":"dog4"},
    {"img":"dog5"},
  ];

  @override
  void initState() {
    super.initState();
    setState((){
      userData = widget.userData;
      tabController = TabController(length: 3, vsync: this);
    });
  }

  @override
  Widget build(BuildContext context) {

    print(userData);


    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("lib/images/forestBG.jpeg"),
                    fit: BoxFit.fitWidth,
                    opacity: 0.8,
                    alignment: Alignment.topCenter
                  ),
              ),
              child: Column(
                children: [
                  AppBar(
                    backgroundColor: Colors.transparent,
                    title: Text("${userData['name']}",style: const TextStyle(color: Colors.white,fontWeight: FontWeight.w600),),
                    centerTitle: true,
                    leading: IconButton(
                      onPressed: (){ Navigator.pop(context);},
                      icon: const Icon(Icons.arrow_back_ios_new_rounded,color: Colors.white,),
                    ),
                    actions: [
                      IconButton(onPressed: (){}, icon: const Icon(Icons.menu_rounded,color: Colors.white,)),
                    ],
                  ),
                  const SizedBox( height: 60, ),
                  Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 60, 0, 0),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15),),
                          color: Colors.white
                        ),
                        child: Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  ElevatedButton(
                                    style:  ElevatedButton.styleFrom(
                                      foregroundColor: Colors.white,
                                      backgroundColor: Colors.blue,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(25),
                                      ),
                                      elevation: 4.0,
                                    ),
                                      onPressed: (){},
                                      child: const Text("Following")
                                  ),
                                  IconButton(
                                      onPressed: (){},
                                      icon: const Icon(Icons.message_outlined,color: Colors.blue,size: 30,),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  margin: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                                  padding: const EdgeInsets.all(6),
                                  height: 150,
                                  width: 150,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(80),
                                    child: Image.asset("lib/images/${userData['userImg']}.jpeg",height: 40,fit: BoxFit.fitHeight,),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("${userData['name']}",style: const TextStyle(fontSize: 30,fontWeight: FontWeight.w800),),
                                      Text("Cat Lover",style: TextStyle(color: greyCl,fontSize: 16),),
                                      Text("Love Pet Pics",style: TextStyle(color: greyCl,fontSize: 16),),
                                      Text("Love Funny Videos",style: TextStyle(color: greyCl,fontSize: 16),),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const IntrinsicHeight(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Column(
                                    children: [
                                      Text("16K",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w800,fontSize: 20,height: 0.9),),
                                      Text("Follwers",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 20),),
                                    ],
                                  ),
                                  VerticalDivider(color: Colors.white,thickness: 3,indent: 2,endIndent: 2,),
                                  Column(
                                    children: [
                                      Text("16K",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w800,fontSize: 20,height: 0.9),),
                                      Text("Following ",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 20),),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  ///------------------------
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: TabBar(
                      controller: tabController,
                        tabs: [
                          Tab(child: Icon(Icons.image,color: Colors.blue,),),
                          Tab(child: Icon(Icons.play_circle_outline_rounded,color: Colors.blue,),),
                          Tab(child: Icon(Icons.cached_sharp,color: Colors.blue,),),
                        ]
                    ),
                  ),
                  Container(
                    height: 300,
                    margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                    child: TabBarView(
                      controller: tabController,
                      children: [
                        imageView(),
                        Text("Vedios"),
                        Text("All"),

                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      )
    );
  }

  imageView(){
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        runAlignment: WrapAlignment.spaceBetween,
        alignment: WrapAlignment.spaceBetween,
        runSpacing: 15,
        spacing: 4,
        children: List.generate(imageList.length, (index){
          var imgInfo = imageList[index];
          return ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset("lib/images/${imgInfo['img']}.jpeg",height: 80,width: 100,fit: BoxFit.fitHeight,),
          );
        }),
      ),
    );
  }


}










