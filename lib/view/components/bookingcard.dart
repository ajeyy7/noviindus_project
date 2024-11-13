import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:noviindus_project/constants/colors.dart';

class BookingCard extends StatelessWidget {
  final int index;

  const BookingCard({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$index. Vikram Singh',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(height: 5),
                const Text(
                  'Couple Combo Package (Rejuvenation)',
                  style: TextStyle(color: Colors.green, fontSize: 14),
                ),
                const SizedBox(height: 5),
                const Row(
                  children: [
                    Icon(Icons.calendar_today, size: 16, color: Colors.grey),
                    SizedBox(width: 5),
                    Text('31/01/2024'),
                    SizedBox(width: 20),
                    Icon(Icons.person, size: 16, color: Colors.grey),
                    SizedBox(width: 5),
                    Text('Jithesh'),
                  ],
                ),
              ],
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'View Booking details',
                  style: TextStyle(
                      color: index == 3 ? Colors.white : Colors.black),
                ),
                const Icon(Icons.arrow_forward_ios_sharp,
                    size: 16, color: primary),
              ],
            ),
          ),
        ],
      ),
    );
  }
}