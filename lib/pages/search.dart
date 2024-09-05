// ignore_for_file: unused_import, avoid_print, prefer_const_constructors

import 'package:flutter/material.dart';


import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:wallpaper_app/models/photo_model.dart';
import 'package:wallpaper_app/widget/widget.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<PhotosModel> photos = [];
  List<PhotosModel> randomPhotos = [];
  TextEditingController searchController = TextEditingController();
  bool search = false;

  @override
  void initState() {
    super.initState();
    fetchRandomPhotos();
  }

  fetchRandomPhotos() async {
    final response = await http.get(
      Uri.parse('https://api.pexels.com/v1/curated?per_page=80'),
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
        randomPhotos = newPhotos;
      });
      print('Random photos fetched successfully: ${randomPhotos.length}');
    } else {
      print('Failed to load random photos: ${response.statusCode}');
    }
  }

  getSearchWallpaper(String searchQuery) async {
    print('Starting HTTP request for search query: $searchQuery');
    final response = await http.get(
      Uri.parse('https://api.pexels.com/v1/search?query=$searchQuery&per_page=40'),
      headers: {
        'Authorization': 'Cqm5zFLBJVNpaxVbNZBXi8TxDpEwad0fqVc7pYq2QlDVROhSEliLYwKP'
      },
    );

    if (response.statusCode == 200) {
      print('HTTP request successful');
      Map<String, dynamic> jsonData = jsonDecode(response.body);
      List<PhotosModel> newPhotos = [];
      jsonData['photos'].forEach((element) {
        PhotosModel photosModel = PhotosModel.fromMap(element);
        newPhotos.add(photosModel);
      });
      setState(() {
        photos = newPhotos;
        search = true;
      });
      print('Photos updated: ${photos.length} photos fetched');
    } else {
      print('Failed to load photos: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.only(top: 50.0),
        child: Column(
          children: [
            Center(
              child: Text(
                'Search',
                style: TextStyle(
                  fontSize: 28.0,
                  color: Colors.deepPurple,
                  fontFamily: 'MyfontRegular',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 5.0),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 3.0),
              margin: EdgeInsets.only(top: 10, left: 20, right: 20),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Color(0xFFececf8),
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextField(
                controller: searchController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  suffixIcon: GestureDetector(
                    onTap: () {
                      getSearchWallpaper(searchController.text);
                    },
                    child: search
                        ? GestureDetector(
                            onTap: () {
                              setState(() {
                                photos = [];
                                search = false;
                                searchController.clear();
                              });
                            },
                            child: Icon(
                              Icons.close,
                              color: Color.fromARGB(255, 84, 87, 93),
                            ),
                          )
                        : Icon(
                            Icons.search,
                            color: Color.fromARGB(255, 84, 87, 93),
                          ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 15.0),
            Expanded(
              child: Wallpaper(search ? photos : randomPhotos, context),
            ),
          ],
        ),
      ),
    );
  }
}
