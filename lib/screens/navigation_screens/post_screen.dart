import 'dart:io';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:katchymemes/blocs/uploadBloc/uploadbloc_bloc.dart';
import 'package:katchymemes/repository/post_repository.dart';

class PostScreen extends StatefulWidget {
  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  final _postTextController = new TextEditingController();
  final ImagePicker _imagePicker = ImagePicker();
  File? _image;
  Future _pickImage(ImageSource source) async {
    var _pickedImage = await _imagePicker.pickImage(source: source);
    setState(() {
      _image = File(_pickedImage!.path);
    });
  }

  late final String username;

  @override
  void initState() {
    super.initState();
    var box = Hive.box('login');
    username = box.values.elementAt(0);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UploadblocBloc, UploadblocState>(
      listener: (context, state) {
        if (state is UploadLoading) {
          print(state);
        } else if (state is UploadSuccess) {
          print(state);
        } else if (state is UploadFailed) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
              state.message.toString(),
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.red,
          ));
        }
      },
      builder: (context, state) {
        return SingleChildScrollView(
          child: Column(
            children: [
              AppBar(
                elevation: 0,
                // centerTitle: true,
                backgroundColor: Colors.white,
                title: Text(
                  "Add Post",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                actions: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.pink,
                        ),
                        onPressed: () {
                          BlocProvider.of<UploadblocBloc>(context)
                            ..add(RequestPostUpload(
                                image: File(_image!.path),
                                description: _postTextController.text,
                                username: username));
                        },
                        child: Text("Share")),
                  )
                ],
              ),
              Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      height: 200,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white),
                      child: TextField(
                        keyboardType: TextInputType.multiline,
                        scrollPhysics: BouncingScrollPhysics(),
                        maxLines: null,
                        style:
                            TextStyle(color: Color(0xff0d0d0d), fontSize: 16),
                        controller: _postTextController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Please enter text here.",
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      decoration: BoxDecoration(color: Colors.white),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              IconButton(
                                  icon: Icon(
                                    EvaIcons.image,
                                    color: Color(0xff707070),
                                  ),
                                  onPressed: () {
                                    _pickImage(ImageSource.gallery);
                                  }),
                              IconButton(
                                  icon: Icon(EvaIcons.video,
                                      color: Color(0xff707070)),
                                  onPressed: () {})
                            ],
                          ),
                          IconButton(
                              icon: Icon(EvaIcons.moreHorizotnal,
                                  color: Color(0xff707070)),
                              onPressed: () {})
                        ],
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 20),
              Stack(children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                  ),
                  child: (_image != null)
                      ? Image.file(
                          File(_image!.path),
                          fit: BoxFit.cover,
                        )
                      : Text("You haven't picked any image"),
                ),
                Positioned(
                  right: 40,
                  top: 20,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          _image = null;
                        });
                      },
                      icon: Icon(
                        EvaIcons.closeOutline,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ]),
            ],
          ),
        );
      },
    );
  }
}
