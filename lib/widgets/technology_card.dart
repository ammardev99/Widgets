import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widgets/models/dummy.dart';
import 'package:widgets/routes/routes_name.dart';
import 'package:widgets/widgets/formating.dart';

// GridCard
Widget technologyGridCard(Mytechnology object) {
  return InkWell(
    onTap: () {
      Get.toNamed(RouteName.collection, arguments: object.id);
    },
    splashColor: object.color.withOpacity(0.3),
    borderRadius: BorderRadius.circular(15),
    child: Container(
      padding: const EdgeInsets.all(10),
      width: 170,
      height: 200,
      decoration: BoxDecoration(
        color: object.color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: 80,
            child: Image.asset(object.icon),
          ),
          customHeading(object.title),
        ],
      ),
    ),
  );
}

// List card
Widget technologyListCard(Mytechnology object) {
  return InkWell(
    onTap: () {
      Get.toNamed(RouteName.collection, arguments: object.id);
    },
    splashColor: object.color.withOpacity(0.1),
    borderRadius: BorderRadius.circular(10),
    child: Container(
        padding: const EdgeInsets.all(20),
        width: 340,
        height: 120,
        decoration: BoxDecoration(
          color: object.color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),
          //background light image
          image: DecorationImage(
              opacity: 0.1,
              image: AssetImage(object.icon),
              fit: BoxFit.contain),
        ),
        child: Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            customHeading(object.title),
            CircleAvatar(
              maxRadius: 40,
              backgroundColor: Colors.white,
              foregroundImage: AssetImage(object.icon),
            )
          ],
        ))),
  );
}
