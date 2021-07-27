import 'package:flutter/material.dart';
import 'package:katchymemes/models/notifications.dart';

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          AppBar(
            elevation: 0,
            centerTitle: true,
            backgroundColor: Colors.white,
            title: Text(
              "Notifications",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ),
          ListView.builder(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              itemCount: listOfNotification.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(20, 14, 20, 0),
                  child: Container(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 24,
                              backgroundImage: NetworkImage(
                                  listOfNotification[index].coverImageUrl!),
                            ),
                            SizedBox(
                              width: 14,
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RichText(
                                      text: TextSpan(children: <TextSpan>[
                                    TextSpan(
                                        text: listOfNotification[index]
                                                .username! +
                                            " ",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16)),
                                    TextSpan(
                                        text: listOfNotification[index]
                                            .notification,
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.black))
                                  ])),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    listOfNotification[index].timeDateText!,
                                    style: TextStyle(
                                        fontSize: 14, color: Color(0xff707070)),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 14,
                        ),
                        Container(
                          color: Color(0xffe1e1e1),
                          width: double.infinity,
                          height: 1,
                        )
                      ],
                    ),
                  ),
                );
              })
        ],
      ),
    );
  }
}
