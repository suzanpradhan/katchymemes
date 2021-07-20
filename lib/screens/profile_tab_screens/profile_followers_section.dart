import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:katchymemes/models/profile.dart';

class ProfileFollowersScreen extends StatefulWidget {
  @override
  _ProfileFollowersScreenState createState() => _ProfileFollowersScreenState();
}

class _ProfileFollowersScreenState extends State<ProfileFollowersScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      itemCount: listOfProfile.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 24,
                    backgroundImage: CachedNetworkImageProvider(
                        listOfProfile[index].coverImageUrl!),
                  ),
                  SizedBox(
                    width: 14,
                  ),
                  Text(
                    listOfProfile[index].username!,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      elevation: 0,
                      primary: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                          side:
                              BorderSide(width: 1, color: Color(0xffbfbfbf)))),
                  onPressed: () {},
                  child: Text(
                    "Remove",
                    style: TextStyle(color: Colors.black, fontSize: 14),
                  ))
            ],
          ),
        );
      },
    );
  }
}
