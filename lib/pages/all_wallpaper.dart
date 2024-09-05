// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, avoid_print, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:wallpaper_app/models/photo_model.dart';
import 'package:wallpaper_app/pages/full_screen.dart'; // أضف هذا الاستيراد

class AllWallpaper extends StatefulWidget {
  final String category;
  AllWallpaper({required this.category});

  @override
  State<AllWallpaper> createState() => _AllWallpaperState();
}

class _AllWallpaperState extends State<AllWallpaper> {
  List<PhotosModel> wallpapers = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchWallpapers();
  }

  fetchWallpapers() async {
    final response = await http.get(
      Uri.parse('https://api.pexels.com/v1/search?query=${widget.category}&per_page=40'),
      headers: {
        'Authorization': 'Cqm5zFLBJVNpaxVbNZBXi8TxDpEwad0fqVc7pYq2QlDVROhSEliLYwKP'
      },
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonData = jsonDecode(response.body);
      List<PhotosModel> newPhotos = [];
      jsonData['photos'].forEach((element) {
        PhotosModel photosModel = PhotosModel.fromMap(element);
        newPhotos.add(photosModel);
      });
      setState(() {
        wallpapers = newPhotos;
        isLoading = false;
      });
    } else {
      setState(() {
        isLoading = false;
      });
      print('Failed to load wallpapers: ${response.statusCode}');
    }
  }

  Widget buildWallpapers() {
    return isLoading
        ? Center(child: CircularProgressIndicator())
        : wallpapers.isEmpty
            ? Center(child: Text('No wallpapers found in this category.'))
            : GridView.builder(
                padding: EdgeInsets.zero,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.6,
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0,
                ),
                itemCount: wallpapers.length,
                itemBuilder: (context, index) {
                  final wallpaper = wallpapers[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FullScreen(
                            imagePath: wallpaper.src!.landscape!,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          wallpaper.src!.landscape!,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                },
              );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Container(
        margin: EdgeInsets.only(top: 50.0, left: 10.0, right: 10.0),
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back_ios_new_outlined, color: Colors.deepPurple,size: 28,),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                SizedBox(width: 100),
                Text(
                widget.category,
                style: TextStyle(
                  fontSize: 28.0,
                  color: Colors.deepPurple,
                  fontFamily: 'MyfontRegular',
                  fontWeight: FontWeight.bold,
                ),
                                )
              
              ],
            ),
            SizedBox(height: 10.0),
            Expanded(child: buildWallpapers()),
          ],
        ),
      ),
    );
  }
}
