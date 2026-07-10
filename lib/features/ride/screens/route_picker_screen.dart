import 'package:flutter/material.dart';
import '../../../core/constants/colors.dart';
import 'choose_service_screen.dart';
import 'driver_on_way_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RoutePickerScreen extends StatelessWidget {
  const RoutePickerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          // Mock Map Background
          Positioned.fill(
            child: Container(
              color: AppColors.greyBackground,
              child: Stack(
                children: [
                  // Mock roads
                  Positioned(top: 300, left: 0, right: 0, child: Container(height: 10, color: Colors.white)),
                  Positioned(top: 0, bottom: 0, left: 150, child: Container(width: 10, color: Colors.white)),
                  Positioned(top: 0, bottom: 0, left: 250, child: Container(width: 10, color: Colors.white)),
                  Positioned(top: 450, left: 0, right: 0, child: Container(height: 10, color: Colors.white)),
                  
                  // Mock Pins
                  Positioned(
                    top: 280,
                    left: 140,
                    child: Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 3),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 430,
                    left: 240,
                    child: Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 3),
                      ),
                    ),
                  ),
                  
                  // Mock Cars (just icons)
                  Positioned(
                    top: 320,
                    left: 100,
                    child: Icon(Icons.directions_car, color: Colors.grey[700]),
                  ),
                  Positioned(
                    top: 400,
                    left: 180,
                    child: Icon(Icons.directions_car, color: Colors.grey[700]),
                  ),
                ],
              ),
            ),
          ),
          
          // Back Button & Search Fields
          Positioned(
            top: 50,
            left: 16,
            right: 16,
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: const Icon(Icons.arrow_back),
                      ),
                      const SizedBox(width: 16),
                      const Expanded(
                        child: Text(
                          'Lokasi Anda',
                          style: TextStyle(fontSize: 14, color: AppColors.textSecondary),
                        ),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                    child: Divider(height: 1),
                  ),
                  Row(
                    children: [
                      Container(
                        width: 8,
                        height: 8,
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 16),
                      const Expanded(
                        child: Text(
                          'Pasaraya Blok M',
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const Icon(Icons.add, color: AppColors.textSecondary),
                    ],
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
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Rekomendasi Rute', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (_) => const ChooseServiceScreen()));
                        },
                        child: const Text('Lihat semua', style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  
                  // GoCar Item
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: AppColors.primary.withOpacity(0.2)),
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset('assets/icons/gocar.svg', width: 40, height: 40),
                        const SizedBox(width: 12),
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('GoCar', style: TextStyle(fontWeight: FontWeight.bold)),
                              Text('4 kursi', style: TextStyle(color: AppColors.textSecondary, fontSize: 12)),
                            ],
                          ),
                        ),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text('Rp25.000', style: TextStyle(fontWeight: FontWeight.bold)),
                            Text('3 - 5 menit', style: TextStyle(color: AppColors.textSecondary, fontSize: 12)),
                          ],
                        ),
                      ],
                    ),
                  ),
                  
                  const SizedBox(height: 16),
                  const Divider(),
                  const SizedBox(height: 8),
                  
                  // Payment Method
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: AppColors.ovoPurple.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: const Text('OVO', style: TextStyle(color: AppColors.ovoPurple, fontWeight: FontWeight.bold, fontSize: 10)),
                          ),
                          const SizedBox(width: 8),
                          const Text('OVO', style: TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                      const Row(
                        children: [
                          Text('Rp 125.000', style: TextStyle(fontWeight: FontWeight.bold)),
                          SizedBox(width: 8),
                          Icon(Icons.chevron_right, color: AppColors.textSecondary),
                        ],
                      ),
                    ],
                  ),
                  
                  const SizedBox(height: 20),
                  
                  // Primary Button
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_) => const DriverOnWayScreen()));
                      },
                      child: const Text('Pesan GoCar'),
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
}
