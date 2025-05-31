import 'package:flutter/material.dart';
import 'package:plant_app/home/backyard.dart';
import 'package:plant_app/home/home_screen.dart';
import 'package:plant_app/navbar.dart';
import '../constants.dart';

class RooftopPage extends StatefulWidget {
  const RooftopPage({super.key});

  @override
  State<RooftopPage> createState() => _RooftopState();
}

class _RooftopState extends State<RooftopPage> {
  String selectedFilter = "Rooftop";

  void onFilterTap(String filterName) {
    setState(() {
      selectedFilter = filterName;
    });

    if (filterName == "Garden") {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    } else if (filterName == "Backyard") {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => BackyardPage()),
      );
    } else if (filterName == "Add") {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Add button clicked')),
      );
    }
  }

  Widget buildFilterChip(String label, {IconData? icon}) {
    final bool isSelected = selectedFilter == label;
    return GestureDetector(
      onTap: () => onFilterTap(label),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? kPrimaryColor : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: kPrimaryColor),
        ),
        child: Row(
          children: [
            if (icon != null)
              Icon(icon, size: 16, color: isSelected ? Colors.white : kPrimaryColor),
            if (icon != null) const SizedBox(width: 5),
            Text(
              label,
              style: TextStyle(color: isSelected ? Colors.white : kPrimaryColor),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Filter Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildFilterChip("Garden"),
                  buildFilterChip("Rooftop"),
                  buildFilterChip("Backyard"),
                  buildFilterChip("Add", icon: Icons.add),
                ],
              ),
              const SizedBox(height: 20),

              // Stats Panel
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: kPrimaryColor),
                ),
                child: const Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: _StatItemRow(
                            icon: Icons.thermostat,
                            value: "28°C",
                            label: "Temperature",
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: _StatItemRow(
                            icon: Icons.water_drop,
                            value: "95%",
                            label: "Water Level",
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                          child: _StatItemRow(
                            icon: Icons.water,
                            value: "80%",
                            label: "Humidity",
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: _StatItemRow(
                            icon: Icons.local_florist,
                            value: "4",
                            label: "Plants",
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Plant Cards
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  PlantCard(
                    name: "Sereh Plant",
                    imageUrl: "assets/images/img.png",
                    frequency: "every day",
                    humidity: "90%",
                  ),
                  PlantCard(
                    name: "Kaktus Plant",
                    imageUrl: "assets/images/1.png",
                    frequency: "every 1 week",
                    humidity: "78%",
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  PlantCard(
                    name: "Something Plant",
                    imageUrl: "assets/images/4.png",
                    frequency: "every week",
                    humidity: "80%",
                  ),
                  PlantCard(
                    name: "Bamboo Plant",
                    imageUrl: "assets/images/image 5.png",
                    frequency: "every day",
                    humidity: "88%",
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Add new plant
              Container(
                height: 220,
                width: 180,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: kPrimaryColor),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: kSecondaryColor,
                        ),
                        child: const Icon(Icons.local_florist, size: 30, color: kTextColor),
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        "Add new plant",
                        style: TextStyle(
                          color: kPrimaryColor,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
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

class _StatItemRow extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;

  const _StatItemRow({
    required this.icon,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(icon, size: 30, color: kPrimaryColor),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                value,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              Text(
                label,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class PlantCard extends StatelessWidget {
  final String name;
  final String imageUrl;
  final String frequency;
  final String humidity;

  const PlantCard({
    required this.name,
    required this.imageUrl,
    required this.frequency,
    required this.humidity,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180,
      height: 220,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: kPrimaryColor),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              frequency,
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
            const SizedBox(height: 4),
            Text(
              humidity,
              style: const TextStyle(fontSize: 12, color: kSecondaryColor),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  imageUrl,
                  fit: BoxFit.cover,
                  height: 120,
                  width: 120,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
