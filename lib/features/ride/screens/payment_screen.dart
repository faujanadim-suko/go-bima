import 'package:flutter/material.dart';
import '../../../core/constants/colors.dart';
import 'rating_screen.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Pembayaran'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Total
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Total', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                const Text('Rp25.000', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
              ],
            ),
            const SizedBox(height: 32),
            
            // Dibayar dengan
            const Text('Dibayar dengan', style: TextStyle(color: AppColors.textSecondary, fontSize: 14)),
            const SizedBox(height: 16),
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
                    const Text('OVO Cash', style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
                const Text('Rp 125.000', style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 16),
            const Text('+ Tambah Metode Pembayaran', style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold)),
            
            const SizedBox(height: 32),
            const Divider(),
            const SizedBox(height: 16),
            
            // Rincian
            const Text('Rincian', style: TextStyle(color: AppColors.textSecondary, fontSize: 14)),
            const SizedBox(height: 16),
            _buildDetailRow('Tarif Perjalanan', 'Rp25.000', false),
            const SizedBox(height: 12),
            _buildDetailRow('Biaya Layanan', 'Rp5.000', false),
            const SizedBox(height: 12),
            _buildDetailRow('Promo', '-Rp5.000', true),
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
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                Text('Rp20.000', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              ],
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const RatingScreen()));
                },
                child: const Text('Bayar'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String title, String amount, bool isDiscount) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: const TextStyle(fontSize: 14)),
        Text(amount, style: TextStyle(fontSize: 14, color: isDiscount ? AppColors.primary : AppColors.textPrimary)),
      ],
    );
  }
}
