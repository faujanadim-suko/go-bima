import 'package:flutter/material.dart';
import '../../../core/constants/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'restaurant_detail_screen.dart';
import '../models/restaurant_model.dart';

class FoodScreen extends StatelessWidget {
  const FoodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textPrimary),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.location_on, color: AppColors.primary, size: 14),
                SizedBox(width: 4),
                Text('Kirim ke', style: TextStyle(fontSize: 12, color: AppColors.textSecondary)),
              ],
            ),
            Row(
              children: [
                Text('Jl. Melawai No. 10', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                Icon(Icons.keyboard_arrow_down, size: 16),
              ],
            ),
          ],
        ),
        titleSpacing: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: AppColors.greyBackground,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  children: [
                    SvgPicture.asset('assets/icons/search.svg', width: 20, height: 20, colorFilter: const ColorFilter.mode(AppColors.textSecondary, BlendMode.srcIn)),
                    const SizedBox(width: 12),
                    const Expanded(
                      child: Text(
                        'Mau makan apa hari ini?',
                        style: TextStyle(color: AppColors.textSecondary, fontSize: 14),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            
            // Chips
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  _buildChip('Semua', true),
                  const SizedBox(width: 8),
                  _buildChip('Promo', false),
                  const SizedBox(width: 8),
                  _buildChip('Terlaris', false),
                  const SizedBox(width: 8),
                  _buildChip('Terdekat', false),
                ],
              ),
            ),
            
            const SizedBox(height: 24),
            
            // Promo Banner
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text('Promo untukmu', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset('assets/images/3.png', width: double.infinity, height: 140, fit: BoxFit.cover, errorBuilder: (context, error, stackTrace) => Container(width: double.infinity, height: 140, color: AppColors.primary, child: const Center(child: Text('Promo Banner', style: TextStyle(color: Colors.white))))),
              ),
            ),
            
            const SizedBox(height: 32),
            
            // Popular List
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text('Populer di Sekitarmu', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            ),
            const SizedBox(height: 16),
            ...dummyRestaurants.map((restaurant) => _buildRestaurantItem(context, restaurant)),
          ],
        ),
      ),
    );
  }

  Widget _buildChip(String label, bool isSelected) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.primary.withOpacity(0.1) : Colors.white,
        border: Border.all(color: isSelected ? AppColors.primary : AppColors.border),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isSelected ? AppColors.primary : AppColors.textSecondary,
          fontSize: 12,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }

  Widget _buildRestaurantItem(BuildContext context, RestaurantModel restaurant) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => RestaurantDetailScreen(restaurant: restaurant)));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(12),
              ),
              child: restaurant.imageUrl.isEmpty
                  ? const Icon(Icons.fastfood, color: Colors.white, size: 40)
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(restaurant.imageUrl, fit: BoxFit.cover, errorBuilder: (_, __, ___) => const Icon(Icons.fastfood, color: Colors.white, size: 40)),
                    ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(restaurant.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.star, color: AppColors.yellowStar, size: 14),
                      const SizedBox(width: 4),
                      Text(restaurant.rating.toString(), style: const TextStyle(fontSize: 12)),
                      const SizedBox(width: 8),
                      Text('•', style: TextStyle(color: Colors.grey[400], fontSize: 12)),
                      const SizedBox(width: 8),
                      Text(restaurant.distanceStr, style: const TextStyle(color: AppColors.textSecondary, fontSize: 12)),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(restaurant.deliveryFeeStr, style: const TextStyle(color: AppColors.textSecondary, fontSize: 12)),
                  if (restaurant.promo.isNotEmpty) ...[
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.orange.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.local_offer, color: Colors.orange, size: 12),
                          const SizedBox(width: 4),
                          Text(restaurant.promo, style: const TextStyle(color: Colors.orange, fontSize: 10, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
