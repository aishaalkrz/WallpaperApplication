// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:wallpaper_app/pages/all_wallpaper.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 50.0),
          child: Column(
            children: [
              Center(
                child: Text(
                  'Categories',
                  style: TextStyle(
                    fontSize: 28.0,
                    color: Colors.deepPurple,
                    fontFamily: 'MyfontRegular',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => AllWallpaper(category: 'Flowers',)));
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                  child: Stack(
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(22),
                          child: Image.asset(
                            'assets/img/flower.jpg',
                            width: MediaQuery.of(context).size.width,
                            height: 180,
                            fit: BoxFit.cover,
                          )),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 180,
                        decoration: BoxDecoration(
                          color: Colors.black26,
                          borderRadius: BorderRadius.circular(22),
                        ),
                        child: Center(
                            child: Text(
                          'Flowers',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'MyfontRegular',
                              fontSize: 28.0,
                              fontWeight: FontWeight.bold),
                        )),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => AllWallpaper(category: 'Foods',)));
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                  child: Stack(
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(22),
                          child: Image.asset(
                            'assets/img/pizza.jpg',
                            width: MediaQuery.of(context).size.width,
                            height: 180,
                            fit: BoxFit.cover,
                          )),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 180,
                        decoration: BoxDecoration(
                          color: Colors.black26,
                          borderRadius: BorderRadius.circular(22),
                        ),
                        child: Center(
                            child: Text(
                          'Foods',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'MyfontRegular',
                              fontSize: 28.0,
                              fontWeight: FontWeight.bold),
                        )),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                      onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => AllWallpaper(category: 'Cities',)));
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                  child: Stack(
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(22),
                          child: Image.asset(
                            'assets/img/city.jpg',
                            width: MediaQuery.of(context).size.width,
                            height: 180,
                            fit: BoxFit.cover,
                          )),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 180,
                        decoration: BoxDecoration(
                          color: Colors.black26,
                          borderRadius: BorderRadius.circular(22),
                        ),
                        child: Center(
                            child: Text(
                          'Cities',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'MyfontRegular',
                              fontSize: 28.0,
                              fontWeight: FontWeight.bold),
                        )),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                      onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => AllWallpaper(category: 'Natural',)));
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                  child: Stack(
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(22),
                          child: Image.asset(
                            'assets/img/natural.jpg',
                            width: MediaQuery.of(context).size.width,
                            height: 180,
                            fit: BoxFit.cover,
                          )),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 180,
                        decoration: BoxDecoration(
                          color: Colors.black26,
                          borderRadius: BorderRadius.circular(22),
                        ),
                        child: Center(
                            child: Text(
                          'Natural',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'MyfontRegular',
                              fontSize: 28.0,
                              fontWeight: FontWeight.bold),
                        )),
                      ),
                      
                    ],
                  ),
                ),
              ),
               GestureDetector(
                      onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => AllWallpaper(category: 'Animals')));
                },
                 child: Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                  child: Stack(
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(22),
                          child: Image.asset(
                            'assets/img/animal.jpg',
                            width: MediaQuery.of(context).size.width,
                            height: 180,
                            fit: BoxFit.cover,
                          )),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 180,
                        decoration: BoxDecoration(
                          color: Colors.black26,
                          borderRadius: BorderRadius.circular(22),
                        ),
                        child: Center(
                            child: Text(
                          'Animals',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'MyfontRegular',
                              fontSize: 28.0,
                              fontWeight: FontWeight.bold),
                        )),
                      ),
                    ],
                  ),
                               ),
               ),
            ],
          ),
        ),
      ),
    );
  }
}
