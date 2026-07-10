import 'package:flutter/material.dart';
import '../../../core/constants/colors.dart';
import 'driver_arrived_screen.dart';

class DriverOnWayScreen extends StatelessWidget {
  const DriverOnWayScreen({super.key});

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
            Text('Driver sedang menuju', style: TextStyle(fontSize: 16)),
            Text('3 menit lagi', style: TextStyle(fontSize: 12, color: AppColors.textSecondary, fontWeight: FontWeight.normal)),
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
                  Positioned(top: 150, left: 100, right: 0, child: Container(height: 8, color: Colors.white)),
                  Positioned(top: 150, bottom: 200, left: 100, child: Container(width: 8, color: Colors.white)),
                  Positioned(top: 350, left: 100, right: 100, child: Container(height: 8, color: Colors.white)),
                  
                  // Path Line
                  Positioned(
                    top: 154, left: 104, child: Container(width: 150, height: 4, color: AppColors.primary),
                  ),
                  
                  // Mock Pins
                  Positioned(
                    top: 140,
                    left: 90,
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
                  Positioned(
                    top: 140,
                    left: 240,
                    child: Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 3),
                      ),
                      child: const Center(child: Icon(Icons.location_on, color: Colors.white, size: 14)),
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          // Pusat Bantuan Button
          Positioned(
            top: 20,
            right: 20,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 4)],
              ),
              child: const Row(
                children: [
                  Icon(Icons.headset_mic, color: AppColors.primary, size: 16),
                  SizedBox(width: 4),
                  Text('Pusat Bantuan', style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold, fontSize: 12)),
                ],
              ),
            ),
          ),
          
          // Bottom Sheet
          Align(
            alignment: Alignment.bottomCenter,
            child: GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => const DriverArrivedScreen()));
              },
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
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: AppColors.greyBackground,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Row(
                        children: [
                          Icon(Icons.description, color: AppColors.textSecondary, size: 16),
                          SizedBox(width: 8),
                          Text('Ini bukan transaksi tunai', style: TextStyle(color: AppColors.textSecondary, fontSize: 12)),
                        ],
                      ),
                    ),
                  ],
                ),
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
