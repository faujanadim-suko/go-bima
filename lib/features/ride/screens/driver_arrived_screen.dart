import 'package:flutter/material.dart';
import '../../../core/constants/colors.dart';
import 'in_trip_screen.dart';

class DriverArrivedScreen extends StatelessWidget {
  const DriverArrivedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Column(
          children: [
            Text('Driver sudah tiba', style: TextStyle(fontSize: 16)),
            Text('2 menit', style: TextStyle(fontSize: 12, color: AppColors.textSecondary, fontWeight: FontWeight.normal)),
          ],
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          // Mock Map
          Positioned.fill(
            child: Container(
              color: AppColors.greyBackground,
              child: Stack(
                children: [
                  // Mock roads
                  Positioned(top: 200, left: 0, right: 0, child: Container(height: 8, color: Colors.white)),
                  Positioned(top: 0, bottom: 200, left: 200, child: Container(width: 8, color: Colors.white)),
                  
                  // Mock Pins
                  Positioned(
                    top: 190,
                    left: 190,
                    child: Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 3),
                      ),
                      child: const Center(child: Icon(Icons.directions_car, color: Colors.white, size: 14)),
                    ),
                  ),
                  // Dropoff Pin (Blue)
                  Positioned(
                    top: 250,
                    left: 280,
                    child: Container(
                      width: 16,
                      height: 16,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 3),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          // Bottom Sheet
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10, offset: Offset(0, -5))],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('B 1234 KKI', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                          Text('Toyota Avanza - Silver', style: TextStyle(color: AppColors.textSecondary, fontSize: 14)),
                        ],
                      ),
                      Image.asset('assets/images/1.png', width: 60, height: 40, fit: BoxFit.cover, errorBuilder: (context, error, stackTrace) => const Icon(Icons.directions_car, size: 40, color: Colors.grey)),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Divider(),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.grey[300],
                            child: const Icon(Icons.person, color: Colors.white),
                          ),
                          const SizedBox(width: 12),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Budi Santoso', style: TextStyle(fontWeight: FontWeight.bold)),
                              Row(
                                children: [
                                  Icon(Icons.star, color: AppColors.yellowStar, size: 14),
                                  SizedBox(width: 4),
                                  Text('4.9', style: TextStyle(color: AppColors.textSecondary, fontSize: 12)),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          _buildIconButton(Icons.phone),
                          const SizedBox(width: 12),
                          _buildIconButton(Icons.message),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  const Row(
                    children: [
                      Icon(Icons.description, color: AppColors.textSecondary, size: 16),
                      SizedBox(width: 8),
                      Text('Silakan bersiap di titik jemput', style: TextStyle(color: AppColors.textSecondary, fontSize: 12)),
                    ],
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_) => const InTripScreen()));
                      },
                      child: const Text('Saya Siap'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIconButton(IconData icon) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.primary),
      ),
      child: Icon(icon, color: AppColors.primary, size: 20),
    );
  }
}
