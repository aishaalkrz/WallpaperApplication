// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, sized_box_for_whitespace, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print, use_build_context_synchronously

import 'dart:typed_data';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:fluttertoast/fluttertoast.dart'; // استيراد حزمة fluttertoast

class FullScreen extends StatefulWidget {
  final String imagePath;
  FullScreen({required this.imagePath});

  @override
  State<FullScreen> createState() => _FullScreenState();
}

class _FullScreenState extends State<FullScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Hero(
            tag: widget.imagePath,
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: CachedNetworkImage(
                imageUrl: widget.imagePath,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 40.0),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    _save();
                  },
                  child: Container(
                    height: 70,
                    width: MediaQuery.of(context).size.width / 1.6,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white54,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(30),
                      gradient: LinearGradient(
                        colors: [
                          Color(0x36ffffff),
                          Color(0x0fffffff),
                        ],
                      ),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 10.0),
                        Text(
                          'Set Wallpaper',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontFamily: 'MyfontRegular',
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'Image will be saved in a gallery',
                          style: TextStyle(
                            fontSize: 14.0,
                            fontFamily: 'Poppins',
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Cancel',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                      fontFamily: 'Poppins',
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _save() async {
    try {
      var response = await Dio().get(
        widget.imagePath,
        options: Options(responseType: ResponseType.bytes),
      );
      final result = await ImageGallerySaver.saveImage(
        Uint8List.fromList(response.data),
      );
      print(result);

      Fluttertoast.showToast(
        msg: "Image saved to gallery!",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,

        backgroundColor: Colors.black.withOpacity(0.7),
        textColor: Colors.white,
        fontSize: 16.0,
      );

      Navigator.pop(context);
    } catch (e) {
      print(e);
      Fluttertoast.showToast(
        msg: "Failed to save image!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red.withOpacity(0.7),
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }
}
