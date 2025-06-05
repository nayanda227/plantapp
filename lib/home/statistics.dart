import 'package:flutter/material.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/navbar.dart';

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor, // dari constants.dart
      bottomNavigationBar: const NavBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            children: const [
              SizedBox(height: 20),
              Text(
                'Statistics',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: kTextColor,
                ),
              ),
              SizedBox(height: 15),
              TabSelector(),
              SizedBox(height: 20),
              OverviewCard(),
              SizedBox(height: 20),
              WaterLevelCard(),
              SizedBox(height: 20),
              PlantsCard(),
            ],
          ),
        ),
      ),
    );
  }
}

class TabSelector extends StatelessWidget {
  const TabSelector({super.key});

  final List<String> tabs = const ['Garden', 'Rooftop', 'Backyard'];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: tabs.map((tab) {
        final isSelected = tab == 'Garden'; // default
        return Container(
          margin: const EdgeInsets.only(right: 10),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: isSelected ? kSecondaryColor.withOpacity(0.2) : Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: kSecondaryColor),
          ),
          child: Text(
            tab,
            style: TextStyle(
              color: kPrimaryColor,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        );
      }).toList(),
    );
  }
}

class OverviewCard extends StatelessWidget {
  const OverviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: const BorderSide(color: Colors.grey), // Border abu-abu
      ),
      color: Colors.white, // Box putih
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Overview",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: kTextColor,
                  ),
                ),
                const SizedBox(height: 10),

                // Box Conditions Good
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF3F4F6),
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.location_searching_outlined,
                          color: kEmoColor, size: 14),
                      SizedBox(width: 5),
                      Text(
                        "Conditions",
                        style: TextStyle(color: kTextColor),
                      ),
                      Text(
                        " Good",
                        style: TextStyle(color: kEmoColor),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // Suhu dan Kelembaban
                const Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("25°C",
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold)),
                        const Text("Temperature",
                            style: TextStyle(fontSize: 12)),
                      ],
                    ),
                    SizedBox(width: 40),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("70%",
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold)),
                        const Text("Humidity", style: TextStyle(fontSize: 12)),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const Icon(Icons.emoji_emotions, color: kEmoColor, size: 100),
          ],
        ),
      ),
    );
  }
}

class WaterLevelCard extends StatelessWidget {
  const WaterLevelCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: const BorderSide(color: Colors.grey), // Border abu-abu
      ),
      color: Colors.white, // Box putih
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Water Level",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: kTextColor,
                  ),
                ),
                const SizedBox(height: 10),

                // Box Conditions Good
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF3F4F6),
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.timer_outlined, color: kTextColor, size: 10),
                      SizedBox(width: 5),
                      Text(
                        "2 days left",
                        style: TextStyle(color: kTextColor),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // Water and Filled
                const Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("180 ml",
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold)),
                        const Text("Water", style: TextStyle(fontSize: 12)),
                      ],
                    ),
                    SizedBox(width: 40),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("45%",
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold)),
                        const Text("Filled", style: TextStyle(fontSize: 12)),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const Icon(Icons.water_drop_outlined, color: kEmoColor, size: 100),
          ],
        ),
      ),
    );
  }
}

class PlantsCard extends StatelessWidget {
  const PlantsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: const BorderSide(color: Colors.grey), // Border abu-abu
      ),
      color: Colors.white, // Box putih
      elevation: 1,
      child: const Padding(
        padding: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Plants",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: kTextColor,
                  ),
                ),
                SizedBox(height: 10),

                // Water and Filled
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("2",
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold)),
                        const Text("Plants", style: TextStyle(fontSize: 12)),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Icon(Icons.local_florist_outlined, color: kEmoColor, size: 100),
          ],
        ),
      ),
    );
  }
}
