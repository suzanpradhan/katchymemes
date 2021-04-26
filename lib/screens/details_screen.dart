import 'package:cached_network_image/cached_network_image.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:katchymemes/models/comments_model.dart';

class DetailScreen extends StatefulWidget {
  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {

  final comments = Comments.fetchAll();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                width: size.width,
                height: size.height * 0.3,
                child: Image(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    "https://images.pexels.com/photos/325185/pexels-photo-325185.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"
                  )
                ),
              ),
              Positioned(
                top: 20.0,
                left: 20.0,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0)
                  ),
                  child: IconButton(
                    icon: Icon(EvaIcons.arrowIosBackOutline),
                    onPressed: (){},
                  ),
                )
              )
            ],
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(20.0),
              child: Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                        backgroundImage: CachedNetworkImageProvider(
                        "https://images.pexels.com/photos/38275/anonymous-studio-figure-photography-facial-mask-38275.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"
                      ),
                    ),
                    title: Text("bishal_magar"),
                    subtitle: Text("19min ago"),
                    trailing: TextButton(
                      child: Text("Follow"),
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.pink,
                        primary: Colors.white,
                        onSurface: Colors.grey,
                      ),
                      onPressed: (){
                        print("follow");
                      },
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(20.0),
                    child: Text(
                     "Lorem Ipsum is simply dummy text of the printing and typ industry. Lorem Ipsum has been the industry's standard dummy t ever since the 1500s, when an unknown printer took a galley of type  only five centuries, but also the leap into electronic typesetting"
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 10.0,
                    ),
                    child: Column(
                      children: [
                        Text(
                          "Comments",
                          textAlign: TextAlign.left,
                        ),
                       Expanded(
                        child: Container(
                          child: ListView.builder(
                             itemCount: comments.length,
                             itemBuilder: (context, index){
                               return  Padding(
                              padding: EdgeInsets.all(20.0),
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      child: CachedNetworkImage(
                                        imageUrl: comments[index].userImage
                                      ),
                                    )
                                  ],
                                ),
                              );
                             }
                           ),
                         ),
                       ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}