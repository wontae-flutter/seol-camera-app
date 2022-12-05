import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

//! 사진을 안 찍거나 안 고르고 나오면 null check operator 에러가 뜹니다.
//! 이거 어떻게 없애나요?

class _CameraScreenState extends State<CameraScreen> {
  File? _image;
  final picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    //* 화면 세로 고정
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  }

  Future getImage(ImageSource imageSource) async {
    //* 카메라와 갤러리에서 이미지를 가져온다
    final image = await picker.pickImage(source: imageSource);

    setState(() {
      _image = File(image!.path);
    });
  }

  Widget showImage() {
    return Container(
        color: const Color(0xffd0cece),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.width,
        child: Center(
            child: _image == null
                ? Text('No image selected.')
                : Image.file(File(_image!.path))));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: const Color(0xfff4f3f9),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 25.0),
          showImage(),
          SizedBox(
            height: 50.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              // 카메라 촬영 버튼
              FloatingActionButton(
                heroTag: "taking button",
                child: Icon(Icons.add_a_photo),
                tooltip: 'take photos',
                onPressed: () {
                  getImage(ImageSource.camera);
                },
              ),

              // 갤러리에서 이미지를 가져오는 버튼
              FloatingActionButton(
                heroTag: "fetching button",
                child: Icon(Icons.wallpaper),
                tooltip: 'fetch image',
                onPressed: () {
                  getImage(ImageSource.gallery);
                },
              ),
            ],
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    //* 가로고정 혹은 세로고정 해제
    super.dispose();
    SystemChrome.setPreferredOrientations([]);
  }
}
