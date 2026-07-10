import 'package:flutter/material.dart';
import '../../../core/constants/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'driver_on_way_screen.dart';

class ChooseServiceScreen extends StatefulWidget {
  const ChooseServiceScreen({super.key});

  @override
  State<ChooseServiceScreen> createState() => _ChooseServiceScreenState();
}

class _ChooseServiceScreenState extends State<ChooseServiceScreen> {
  String _selectedService = 'GoCar';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Pilih Layanan'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Ekonomi', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 4),
            const Text('Harga terjangkau, cocok untuk sehari-hari.', style: TextStyle(color: AppColors.textSecondary, fontSize: 12)),
            const SizedBox(height: 16),
            _buildServiceItem('GoCar', 'assets/icons/gocar.svg', '4 kursi', 'Rp25.000', '3 - 5 menit'),
            const SizedBox(height: 12),
            _buildServiceItem('GoBike', 'assets/icons/goride.svg', '1 kursi', 'Rp12.000', '1 - 3 menit'),
            const SizedBox(height: 24),
            const Text('Kendaraan Lebih Besar', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 16),
            _buildServiceItem('GoCar XL', 'assets/icons/gocar.svg', '6 kursi', 'Rp40.000', '5 - 7 menit'),
            const SizedBox(height: 12),
            _buildServiceItem('GoCar Airport', 'assets/icons/gocar.svg', '4 kursi', 'Rp35.000', '5 - 7 menit'),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              offset: const Offset(0, -5),
              blurRadius: 10,
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
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
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const DriverOnWayScreen()));
                },
                child: Text('Pesan $_selectedService'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildServiceItem(String title, String icon, String subtitle, String price, String time) {
    bool isSelected = _selectedService == title;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedService = title;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary.withOpacity(0.05) : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: isSelected ? AppColors.primary.withOpacity(0.5) : AppColors.border),
        ),
        child: Row(
          children: [
            SvgPicture.asset(icon, width: 40, height: 40),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
                  Text(subtitle, style: const TextStyle(color: AppColors.textSecondary, fontSize: 12)),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(price, style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(time, style: const TextStyle(color: AppColors.textSecondary, fontSize: 12)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
