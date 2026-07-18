import 'package:flutter/material.dart';
import '../../../core/constants/colors.dart';
import '../../../core/widgets/service_item.dart';

class OtherServicesScreen extends StatelessWidget {
  const OtherServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textPrimary),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Semua Layanan',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: AppColors.greyBackground,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: 'Cari layanan...',
                    hintStyle: TextStyle(color: AppColors.textSecondary),
                    icon: Icon(Icons.search, color: AppColors.textSecondary),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            
            _buildSection(
              title: 'Transportasi & Logistik',
              children: [
                ServiceItem(title: 'Mobil', iconPath: 'assets/icons/gocar.svg', onTap: () {}),
                ServiceItem(title: 'Motor', iconPath: 'assets/icons/goride.svg', onTap: () {}),
                ServiceItem(title: 'Pengantaran', iconPath: 'assets/icons/gosend.svg', onTap: () {}),
                ServiceItem(title: 'Express', iconPath: 'assets/icons/express.svg', onTap: () {}),
              ],
            ),
            
            _buildSection(
              title: 'Makanan & Belanja',
              children: [
                ServiceItem(title: 'Makanan', iconPath: 'assets/icons/gofood.svg', onTap: () {}),
                ServiceItem(title: 'Mart', iconPath: 'assets/icons/gomart.svg', onTap: () {}),
                ServiceItem(title: 'Toko', iconPath: 'assets/icons/other.svg', onTap: () {}), // Placeholder icon
              ],
            ),
            
            _buildSection(
              title: 'Pembayaran & Tagihan',
              children: [
                ServiceItem(title: 'Pulsa/Top Up', iconPath: 'assets/icons/gopulsa.svg', onTap: () {}),
                ServiceItem(title: 'Tagihan', iconPath: 'assets/icons/other.svg', onTap: () {}),
                ServiceItem(title: 'Investasi', iconPath: 'assets/icons/other.svg', onTap: () {}),
              ],
            ),
            
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
  
  Widget _buildSection({required String title, required List<Widget> children}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 4,
            mainAxisSpacing: 10,
            crossAxisSpacing: 12,
            childAspectRatio: 0.72,
            children: children,
          ),
        ),
        const SizedBox(height: 16),
        const Divider(height: 1),
      ],
    );
  }
}
