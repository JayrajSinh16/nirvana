import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ArtScreen extends StatefulWidget {
  const ArtScreen({super.key});

  @override
  State<ArtScreen> createState() => _ArtScreenState();
}

class _ArtScreenState extends State<ArtScreen> {
  List imglist = [];

  getImages() async {
    final directory = Directory("storage/emulated/0/Nirvana");
    imglist = directory.listSync();

    print(imglist);
  }

  @override
  void initState() {
    super.initState();
    getImages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading:  IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new_rounded,
            size: 24,)
          ),
          title:  Text(
            'Art Gallery',
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 24,
              fontWeight: FontWeight.w600,
              letterSpacing: 1,
            ),
          ),
        ),
        body: MasonryGridView.builder(
          gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
          itemCount: imglist.length,
          itemBuilder: (context, index) {
            return Image.file(imglist[index]);
          },
        ));
  }
}
