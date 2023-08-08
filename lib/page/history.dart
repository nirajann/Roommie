import 'package:flutter/material.dart';

class Booking {
  final String hotelName;
  final String imageUrl;
  final DateTime bookingDate;

  Booking({
    required this.hotelName,
    required this.imageUrl,
    required this.bookingDate,
  });
}

class BookingHistoryPage extends StatelessWidget {
  final List<Booking> bookings = [
    Booking(
      hotelName: 'Luxury Resort',
      imageUrl:
          'assets/apartment1.jfif', // Replace with actual image asset path
      bookingDate: DateTime(2023, 8, 8), // Replace with actual booking date
    ),
    // Add more bookings as needed
  ];

  BookingHistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Booking History'),
      ),
      body: Container(
        color: Colors.brown, // Set the background color to brown
        child: ListView.builder(
          itemCount: bookings.length,
          itemBuilder: (context, index) {
            final booking = bookings[index];
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: ListTile(
                  leading: Image.asset(
                    booking.imageUrl,
                    width: 60,
                    height: 60,
                  ),
                  title: Text(
                    booking.hotelName,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    'Last Booked: ${booking.bookingDate.toString()}',
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
