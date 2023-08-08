import 'package:flutter/material.dart';
import 'package:roomfinding/constants/app_colors.dart';

class Badge {
  final String imagePath; // Path to the badge image asset
  final String title;

  Badge({
    required this.imagePath,
    required this.title,
  });
}

class AchievementDetailPage extends StatelessWidget {
  final List<Badge> badges = [
    Badge(
      imagePath: 'assets/rich.png', // Replace with actual image asset path
      title: 'Rich Spender',
    ),
    Badge(
      imagePath: 'assets/best.png', // Replace with actual image asset path
      title: 'Most Hotel Booked',
    ),
    Badge(
      imagePath: 'assets/luxury.jpg', // Replace with actual image asset path
      title: 'Luxury Life',
    ),
    // Add more badges as needed
  ];

  AchievementDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Badge Details'),
        backgroundColor: AppColors.primaryColor, // Set app bar color
      ),
      body: Container(
        color: AppColors.primaryColor, // Set background color
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, // Number of items in each row
            mainAxisSpacing: 16.0, // Spacing between rows
            crossAxisSpacing: 16.0, // Spacing between columns
            childAspectRatio: 1.0, // Width to height ratio of each item
          ),
          itemCount: badges.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    badges[index].imagePath,
                    width: 50,
                    height: 50,
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    badges[index].title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
