import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:katchymemes/blocs/recentMemes/recentmemes_bloc.dart';
import 'package:katchymemes/models/posts_model.dart';
import 'package:katchymemes/utils/contants/api_constants.dart';
import 'package:katchymemes/widgets/post_card.dart';
import '../details_screen.dart';
import 'package:share_plus/share_plus.dart';

class RecentTab extends StatefulWidget {
  @override
  _RecentTabState createState() => _RecentTabState();
}

class _RecentTabState extends State<RecentTab> {
  @override
  void initState() {
    super.initState();
    // fetchPosts();
  }

  @override
  void dispose() {
    super.dispose();
  }

  final apiUrl = ApiConstants.baseUrl +
      ApiConstants.postsUrl +
      "key=" +
      ApiConstants.apiKey;

  List<Post> listOfPost = [];

  // Future fetchPosts() async {
  //   var uri = Uri.parse(apiUrl);
  //   var response = await http.get(uri);
  //   List result = json.decode(response.body)["success"]["data"];
  //   print(listOfPost);
  //   listOfPost = result.map((data) => Post.fromJson(data)).toList();
  //   print(listOfPost[0].postImage);
  //   var date = listOfPost[0].postedDate!.split(" ");
  //   print(date);
  //   var sliceDate = date[0].replaceAll(RegExp(r'-'), '/');
  //   print(sliceDate);
  // }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RecentmemesBloc()..add(RequestRecentMemes()),
      child: BlocConsumer<RecentmemesBloc, RecentmemesState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is RecentMemesListLoaded) {
            return ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: state.memesList.length,
              itemBuilder: (context, index) {
                return PostCard(
                    username: state.memesList[index].username,
                    userImage: state.memesList[index].userImage,
                    time: state.memesList[index].postedDate,
                    imageUrl: state.memesList[index].postImage,
                    likeCount: state.memesList[index].likesCount,
                    commentCount: state.memesList[index].commentsCount,
                    onPress: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  DetailScreen(post: state.memesList[index])));
                    },
                    onShare: () {
                      String text = state.memesList[index].postImage!;
                      String subject = 'Share';
                      Share.share(text, subject: subject);
                    });
              },
            );
          } else if (state is RecentMemesListLoadFailed) {
            return Center(
                child: Text(
              state.message,
              style: TextStyle(color: Color(0xffbfbfbf), fontSize: 14),
            ));
          } else if (state is RecentMemesLaoding) {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.pink,
                strokeWidth: 1,
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.pink,
                strokeWidth: 1,
              ),
            );
          }
        },
      ),
    );
  }
}
