import 'package:flutter/material.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/navbar.dart';
import 'viewdetail.dart';

class PlantHomePage extends StatelessWidget {
  const PlantHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView( // <-- scroll agar anti overflow
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // My Plants header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'My Plants',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: kTextColor,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: kSecondaryColor,
                      ),
                      child: const Icon(Icons.more_horiz, color: kBackgroundColor),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // My Plants list
                SizedBox(
                  height: 300,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: const [
                      MyPlantCard(
                        image: 'assets/images/plant.png',
                        name: 'Depea Plant',
                        location: 'Backyard',
                        water: '150 ml',
                      ),
                      SizedBox(width: 20),
                      MyPlantCard(
                        image: 'assets/images/pohon 2.png',
                        name: 'Yaudah Plant',
                        location: 'Garden',
                        water: '210 ml',
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),

                // Explore header
                const Text(
                  'Explore',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: kTextColor,
                  ),
                ),
                const SizedBox(height: 16),

                // Explore list
                SizedBox(
                  height: 200,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: const [
                      ExplorePlant(image: 'assets/images/image 4.png'),
                      SizedBox(width: 16),
                      ExplorePlant(image: 'assets/images/image 5.png'),
                      SizedBox(width: 16),
                      ExplorePlant(image: 'assets/images/99.png'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const NavBar(),
    );
  }
}

class MyPlantCard extends StatelessWidget {
  final String image;
  final String name;
  final String location;
  final String water;

  const MyPlantCard({
    super.key,
    required this.image,
    required this.name,
    required this.location,
    required this.water,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 174,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: kBackgroundColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: kThirdColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image
          Container(
            height: 140,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(height: 10),

          // Title & Info
          // Judul
          Text(
            '$name',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),

          Row(
            children: [
              Icon(Icons.location_on_outlined, color: kTextColor, size: 14),
              const SizedBox(width: 4),
              Text(
                '$location',
                style: const TextStyle(color: kTextColor, fontSize: 12),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),

// Air
          Row(
            children: [
              Icon(Icons.water_drop_outlined, color: kTextColor, size: 14),
              const SizedBox(width: 4),
              Text(
                '$water',
                style: const TextStyle(color: kTextColor, fontSize: 12),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
          const SizedBox(height: 10),


          // Button
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PlantDetailsPage()),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: kThirdColor,
              foregroundColor: kTextColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40),
              ),
              minimumSize: const Size.fromHeight(30),
              padding: EdgeInsets.zero,
            ),
            child: const Text('View details', style: TextStyle(fontSize: 12)),
          ),
        ],
      ),
    );
  }
}

class ExplorePlant extends StatelessWidget {
  final String image;

  const ExplorePlant({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 150,
          height: 150,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: kThirdColor, // warna latar bulatan
          ),
          child: ClipOval(
            child: Image.asset(
              image,
              width: 120,
              height: 120,
              fit: BoxFit.cover, // biar nutupin penuh
            ),
          ),
        ),

        const SizedBox(height: 10),
        const Text(
          'Bamboo',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const Text(
          'Indoor',
          style: TextStyle(fontSize: 14, color: kTextColor),
        ),
      ],
    );
  }
}
