import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class messangerhome extends StatelessWidget {
  // const messangerhome({super.key});

  List<Usermodel> model = [Usermodel(id: 1, message: 
                          "kareem alfara is mobile application developer",

   name: 'kareem alfara',),
   Usermodel(id: 1, message: 
                          "ahmed is mobile application developer",

   name: 'ahmed alfara',),
   Usermodel(id: 1, message: 
                          "kareem alfara is mobile application developer",

   name: 'kareem alfara',),
   Usermodel(id: 1, message: 
                          "ahmed is mobile application developer",

   name: 'ahmed alfara',),
   Usermodel(id: 1, message: 
                          "kareem alfara is mobile application developer",

   name: 'kareem alfara',),
   Usermodel(id: 1, message: 
                          "ahmed is mobile application developer",

   name: 'ahmed alfara',),
   ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage("assets/41.jpg"),
              radius: 25,
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              "Chats",
              style: TextStyle(color: Colors.black, fontSize: 22),
            ),
          ],
        ),
        actions: [
          IconButton(
              color: Colors.white,
              onPressed: () {},
              icon: CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: Icon(
                    Icons.camera_alt,
                    color: Colors.white,
                  ))),
          IconButton(
              onPressed: () {},
              icon: CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: Icon(
                    Icons.edit,
                    color: Colors.white,
                  )))
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 40, 10, 20),
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(22)),
                child: Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Icon(Icons.search),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "search",
                      style: TextStyle(color: Colors.black, fontSize: 22),
                    ),
                  ],
                ),
              ),
            ),
            Container(
                height: 100,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    // shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) => defultOnline(),
                    separatorBuilder: (context, index) => SizedBox(
                          width: 20,
                        ),
                    itemCount: 10)),
            SizedBox(
              height: 20,
            ),
            Container(
              child: ListView.separated(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) => defultChats(model[index]),
                  separatorBuilder: (context, index) => Container(
                        margin: EdgeInsets.all(10),
                        height: 1,
                        color: Colors.grey,
                        width: double.infinity,
                      ),
                  itemCount: model.length),
            )
          ],
        ),
      ),
    );
  }

  Widget defultOnline() => Column(
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage("assets/41.jpg"),
                radius: 30,
              ),
              CircleAvatar(
                backgroundColor: Colors.green,
                radius: 7,
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text("kareem Alfara"),
        ],
      );
  Widget defultChats(Usermodel model) => Row(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage("assets/41.jpg"),
            radius: 30,
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 7,
              ),
              Text(
                "${model.name}",
                style: TextStyle(color: Colors.black, fontSize: 22),
              ),
              SizedBox(
                height: 7,
              ),
              Row(
                children: [
                  Container(
                      width: 220,
                      child: Text(
                        "${model.message}",
                        style: TextStyle(color: Colors.grey, fontSize: 17),
                      )),
                  Text(
                    "02:00 PM",
                    style: TextStyle(color: Colors.grey, fontSize: 18),
                  ),
                ],
              ),
              SizedBox(
                height: 7,
              ),
            ],
          ),
        ],
      );
}

class Usermodel {
  final int id;
  final String name;
  final String message;
  Usermodel({
    required this.id,
    required this.message,
    required this.name,
  });
}
