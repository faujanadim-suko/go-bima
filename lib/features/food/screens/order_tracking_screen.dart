import 'package:flutter/material.dart';
import '../../../core/constants/colors.dart';
import '../../home/screens/home_screen.dart';

class OrderTrackingScreen extends StatelessWidget {
  const OrderTrackingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Column(
          children: [
            Text('Pesanan Diterima', style: TextStyle(color: Colors.white, fontSize: 16)),
            Text('GF-123', style: TextStyle(color: Colors.white70, fontSize: 12, fontWeight: FontWeight.normal)),
          ],
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            // Delivery Image
            Icon(Icons.delivery_dining, size: 100, color: AppColors.primary),
            const SizedBox(height: 24),
            const Text('Pesananmu sedang diantar!', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            const SizedBox(height: 8),
            const Text('Driver menuju ke restoran', style: TextStyle(color: AppColors.textSecondary, fontSize: 14)),
            
            const SizedBox(height: 40),
            
            // Progress Bar
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildDot(true),
                _buildLine(true),
                _buildDot(true),
                _buildLine(true),
                _buildDot(true),
                _buildLine(false),
                _buildDot(false),
              ],
            ),
            
            const SizedBox(height: 40),
            
            // Driver Detail
            const Align(
              alignment: Alignment.centerLeft,
              child: Text('Detail Driver', style: TextStyle(color: AppColors.textSecondary, fontSize: 12)),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.border),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
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
                          Text('Andi Saputra', style: TextStyle(fontWeight: FontWeight.bold)),
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
            ),
            
            const SizedBox(height: 24),
            
            // Order Detail
            const Align(
              alignment: Alignment.centerLeft,
              child: Text('Detail Pesanan', style: TextStyle(color: AppColors.textSecondary, fontSize: 12)),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.border),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('McDonald\'s - Melawai', style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 16),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('1x McChicken', style: TextStyle(color: AppColors.textSecondary)),
                      Text('Rp25.000'),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Divider(),
                  const SizedBox(height: 16),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Total', style: TextStyle(fontWeight: FontWeight.bold)),
                      Text('Rp25.000', style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => const HomeScreen()), (route) => false);
                },
                child: const Text('Kembali ke Beranda'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDot(bool isActive) {
    return Container(
      width: 12,
      height: 12,
      decoration: BoxDecoration(
        color: isActive ? AppColors.primary : Colors.grey[300],
        shape: BoxShape.circle,
      ),
    );
  }

  Widget _buildLine(bool isActive) {
    return Container(
      width: 60,
      height: 2,
      color: isActive ? AppColors.primary : Colors.grey[300],
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
