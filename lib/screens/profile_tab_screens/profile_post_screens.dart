import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:katchymemes/blocs/userPosts/bloc/userposts_bloc.dart';
import 'package:katchymemes/screens/details_screen.dart';
import 'package:katchymemes/widgets/post_card.dart';
import 'package:share_plus/share_plus.dart';

class ProfilePostScreens extends StatefulWidget {
  @override
  _ProfilePostScreensState createState() => _ProfilePostScreensState();
}

class _ProfilePostScreensState extends State<ProfilePostScreens> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserpostsBloc()
        ..add(UserPostLoadBegin(
            userId: Hive.box('login').values.elementAt(0).userId)),
      child: BlocConsumer<UserpostsBloc, UserpostsState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is UserPostsLoading) {
            return CircularProgressIndicator();
          } else if (state is UserPostsLoadSuccess) {
            return ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: state.userMemesList.length,
              itemBuilder: (context, index) {
                return PostCard(
                  username: state.userMemesList[index].username,
                  userImage: state.userMemesList[index].userImage,
                  time: state.userMemesList[index].postedDate,
                  imageUrl: state.userMemesList[index].postImage,
                  likeCount: state.userMemesList[index].likesCount,
                  commentCount: state.userMemesList[index].commentsCount,
                  onShare: () {
                    String text = state.userMemesList[index].postImage!;
                    String subject = 'Share';
                    Share.share(text, subject: subject);
                  },
                  onPress: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailScreen(
                                  post: state.userMemesList[index],
                                )));
                  },
                );
              },
            );
          } else if (state is UserPostsLoadFailed) {
            return Center(
              child: Text("Couldnot load your posts"),
            );
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
