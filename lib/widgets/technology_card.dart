import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:widgets/widgets/formating.dart';

// GridCard
Widget technologyGridCard(String label, Color color ) {
  return InkWell(
    onTap: () {},
    splashColor: color.withOpacity(0.1),
    borderRadius: BorderRadius.circular(15),
    child: Container(
      padding: const EdgeInsets.all(10),
      width: 170,
      height: 200,
      decoration: BoxDecoration(
        color:  color.withOpacity(0.1),
        border: Border.all(
          width: 1,
          color: color.withOpacity(0.3),
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 80,
            child: SvgPicture.asset(
              'assets/svg/app_logo.svg',
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
            customHeading(label),
        ],
      ),
    ),
  );
}

// List card
Widget technologyListCard(String label, Color color) {
  return InkWell(
    onTap: () {},
    splashColor: color.withOpacity(0.1),
    borderRadius: BorderRadius.circular(10),
    child: Container(
        padding: const EdgeInsets.all(20),
        width: 340,
        height: 120,
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          border: Border.all(
            color: color.withOpacity(0.3),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(10),
          //background light image
          image: const DecorationImage(
              opacity: 0.1,
              image: AssetImage('assets/png/app_icon.png'),
              fit: BoxFit.contain),
        ),
        child: Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            customHeading(label),
            const CircleAvatar(
              maxRadius: 39,
              backgroundColor: Colors.white,
              foregroundImage: AssetImage('assets/png/app_icon.png'),
            )
          ],
        ))),
  );
}
