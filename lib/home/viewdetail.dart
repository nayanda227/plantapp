import 'package:flutter/material.dart';

class PlantDetailsPage extends StatelessWidget {
  const PlantDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE8F5E9),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'My Plants',
          style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 250,
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage('assets/images/4.png'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Depea Plant',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text('23 weeks | 10% Humidity | 25% Filled | Next watering in 37 min',
                style: TextStyle(color: Colors.black54)),
            const SizedBox(height: 16),
            Container(
              height: 60,
              decoration: BoxDecoration(
                color: const Color(0xFF81C784),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(
                child: Text(
                  'Please Fill the water tank!',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(7, (index) => _buildDateCircle(index + 8)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDateCircle(int date) {
    return Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.black12),
        ),
        child: Center(
            child: Text(
              '$date',
              style: const TextStyle(color: Colors.black54),
            ),
        ),
        );
    }
}
