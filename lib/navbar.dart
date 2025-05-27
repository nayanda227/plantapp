import 'package:flutter/material.dart';
import 'package:plant_app/home/home_screen.dart';
import 'package:plant_app/home/myplants.dart';
import 'package:plant_app/home/profile.dart';
import 'package:plant_app/home/statistics.dart';

import '../constants.dart';

class NavBar extends StatelessWidget {
  const NavBar({
    super.key,
  });

  Color desaturate(Color color) {
    final hsl = HSLColor.fromColor(color);
    final newHsl = hsl.withSaturation(hsl.saturation * 0.5);
    return newHsl.toColor();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: defaultPadding * 2,
        right: defaultPadding * 2,
        bottom: defaultPadding,
      ),
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, -10),
            blurRadius: 35,
            color: kPrimaryColor.withOpacity(0.38),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.home_filled, color:desaturate(kPrimaryColor)),
            onPressed: () {
              Navigator.push(
                context,
                //Berpindah ke halaman Home
                MaterialPageRoute(builder: (context) => const HomeScreen()),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.history, color: desaturate(kPrimaryColor)),
            onPressed: () {
              Navigator.push(
                context,
                //Berpindah ke halaman Statistics
                MaterialPageRoute(builder: (context) => const StatisticsScreen()),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.local_florist_outlined, color: desaturate(kPrimaryColor)),
            onPressed: () {
              Navigator.push(
                context,
                //Berpindah ke halaman MyPlant
                MaterialPageRoute(builder: (context) => const PlantHomePage()),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.settings_rounded, color: desaturate(kPrimaryColor)),
            onPressed: () {
              Navigator.push(
                context,
                //Berpindah ke halaman MyPlant
                MaterialPageRoute(builder: (context) => const ProfilePage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
