import 'dart:async';

import 'package:flutter/material.dart';
import 'package:plant_app/models/location_status.dart';
import 'package:plant_app/services/api_location_status.dart';
import '../../constants.dart';
import 'package:plant_app/home/rooftop.dart';
import 'package:plant_app/home/backyard.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late Future<LocationStatus> _futureStatus;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _futureStatus = ApiLocationStatus.fetchLocationStatus();
    _timer = Timer.periodic(const Duration(minutes: 1), (timer) {
      setState(() {
        _futureStatus = ApiLocationStatus.fetchLocationStatus();
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  String selectedFilter = "Garden";

  void onFilterTap(String filterName) {
    setState(() {
      selectedFilter = filterName;
    });

    if (filterName == "Rooftop") {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const RooftopPage()),
      );
    } else if (filterName == "Backyard") {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const BackyardPage()),
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
              Icon(icon,
                  size: 16, color: isSelected ? Colors.white : kPrimaryColor),
            if (icon != null) const SizedBox(width: 5),
            Text(
              label,
              style:
                  TextStyle(color: isSelected ? Colors.white : kPrimaryColor),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                children: [
                  const CircleAvatar(
                    backgroundImage: AssetImage("assets/images/vernon.jpeg"),
                  ),
                  const SizedBox(width: 10),
                  const Expanded(
                    child: Text.rich(
                      TextSpan(
                        text: "Welcome, ",
                        style: TextStyle(fontSize: 16, color: kTextColor),
                        children: [
                          TextSpan(
                            text: "Vernon",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: kSecondaryColor,
                    ),
                    child:
                        const Icon(Icons.more_horiz, color: kBackgroundColor),
                  ),
                ],
              ),
              const SizedBox(height: 20),

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
              FutureBuilder<LocationStatus>(
                future: _futureStatus,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting)
                    return Center(child: CircularProgressIndicator());

                  if (snapshot.hasError)
                    return Center(child: Text('Error: ${snapshot.error}'));

                  final status = snapshot.data!;
                  return SingleChildScrollView(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        _StatItemRow(
                          icon: Icons.thermostat,
                          value: '${status.temperature} °C',
                          label: 'Temperature',
                        ),
                        _StatItemRow(
                          icon: Icons.water_drop,
                          value: '${status.humidity} %',
                          label: 'Humidity',
                        ),
                        _StatItemRow(
                          icon: Icons.opacity,
                          value: '${status.waterLevel} %',
                          label: 'Water Level',
                        ),
                        _StatItemRow(
                          icon: Icons.grass,
                          value: '${status.soilMoisture} %',
                          label: 'Soil Moisture',
                        ),
                        _StatItemRow(
                          icon: Icons.wb_sunny,
                          value: '${status.lightIntensity} lux',
                          label: 'Light Intensity',
                        ),
                        _StatItemRow(
                          icon: Icons.science,
                          value: '${status.phLevel}',
                          label: 'pH Level',
                        ),
                        _StatItemRow(
                          icon: Icons.local_florist,
                          value: '${status.plants}',
                          label: 'Plants',
                        ),
                      ]
                          .map((e) => Padding(
                              padding: const EdgeInsets.symmetric(vertical: 4),
                              child: e))
                          .toList(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),

              // Plant Cards
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  PlantCard(
                    name: "Janda Bolong Plant",
                    imageUrl: "assets/images/pohon1.png",
                    frequency: "every 1 week",
                    humidity: "78%",
                  ),
                  PlantCard(
                    name: "Kaktus Plant",
                    imageUrl: "assets/images/pohon 2.png",
                    frequency: "every 1 week",
                    humidity: "78%",
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
                        child: const Icon(Icons.local_florist,
                            size: 30, color: kTextColor),
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
