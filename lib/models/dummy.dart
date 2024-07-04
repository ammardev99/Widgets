// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widgets/utilities/color.dart';

class MyWidget {
  int id;
  String title;
  RxBool favorite;
  String img;
  String code;
  MyWidget({
    required this.id,
    required this.title,
    required this.favorite,
    required this.img,
    required this.code,
  });
}


final collection  = [
  MyWidget(id: 0,title: "New App Bar", favorite: true.obs, img: "assets/png/navbar/navbar1.png", code: 'New App Bar Code 1 componentCard( collection[1],RouteName.widgetsInfo),'),
  MyWidget(id: 1,title: "GitHub App Bar", favorite: true.obs, img: "assets/png/navbar/navbar2.png", code: 'GitHub bar 2 componentCard( collection[2],RouteName.widgetsInfo),'),
  MyWidget(id: 2,title: "Conversation Bar", favorite: true.obs, img: "assets/png/navbar/navbar3.png", code: 'Conversation Bar code 3 componentCard( collection[3],RouteName.widgetsInfo),'),
  MyWidget(id: 3,title: "Purple App Bar", favorite: true.obs, img: "assets/png/navbar/navbar4.png", code: 'Purple Bar Code4 componentCard( collection[4],RouteName.widgetsInfo),'),
  MyWidget(id: 4,title: "New App Bar", favorite: true.obs, img: "assets/png/navbar/navbar1.png", code: 'New App Bar Code 1 componentCard( collection[1],RouteName.widgetsInfo),'),
  MyWidget(id: 5,title: "GitHub App Bar", favorite: true.obs, img: "assets/png/navbar/navbar2.png", code: 'GitHub bar 2 componentCard( collection[2],RouteName.widgetsInfo),'),
  MyWidget(id: 6,title: "Conversation Bar", favorite: true.obs, img: "assets/png/navbar/navbar3.png", code: 'Conversation Bar code 3 componentCard( collection[3],RouteName.widgetsInfo),'),
  MyWidget(id: 7,title: "Purple App Bar", favorite: true.obs, img: "assets/png/navbar/navbar4.png", code: 'Purple Bar Code4 componentCard( collection[4],RouteName.widgetsInfo),'),
];



class Mytechnology {
  int id;
  String title;
  String icon;
  Color color;
  Mytechnology({
    required this.id,
    required this.title,
    required this.icon,
    required this.color,
  });
}

final myTechonology = [
  Mytechnology(id: 0,title: "Flutter", icon: "assets/png/technologies/flutter.png", color: Colors.blue),
  Mytechnology(id: 1,title: "Laravel", icon: "assets/png/technologies/laravel.png", color: const Color(0xFFF05340)),
  Mytechnology(id: 2,title: "Github", icon: "assets/png/technologies/github.png", color: Colors.black),
  Mytechnology(id: 3,title: "Html", icon: "assets/png/technologies/html.png" , color: Colors.red),
  Mytechnology(id: 4,title: "name", icon: "assets/png/technologies/extensions.png", color: const Color.fromARGB(255, 122, 122, 122)),
  Mytechnology(id: 5,title: "Widgets", icon: "assets/png/app_icon.png", color: AppColors.black),
];




