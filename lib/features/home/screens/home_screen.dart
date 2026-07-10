import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/constants/colors.dart';
import '../../../core/widgets/service_item.dart';
import '../../ride/screens/route_picker_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with separate Search Card
            Stack(
              clipBehavior: Clip.none,
              children: [
                // Red Header Background
                Container(
                  height: 160,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(24),
                      bottomRight: Radius.circular(24),
                    ),
                  ),
                  padding: const EdgeInsets.only(top: 60, left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Go-Bima',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.qr_code_scanner, color: Colors.white, size: 28),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
                // Overlapping Search Card
                Positioned(
                  top: 130,
                  left: 20,
                  right: 20,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.08),
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset('assets/icons/search.svg', width: 22, height: 22, colorFilter: const ColorFilter.mode(AppColors.textSecondary, BlendMode.srcIn)),
                        const SizedBox(width: 12),
                        const Expanded(
                          child: Text(
                            'Mau ke mana hari ini?',
                            style: TextStyle(color: AppColors.textSecondary, fontSize: 16),
                          ),
                        ),
                        CircleAvatar(
                          radius: 16,
                          backgroundColor: AppColors.greyBackground,
                          child: const Icon(Icons.person, size: 20, color: AppColors.primary),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 50), // Space for the overlapping search card
            
            // Payment / Balance Card (Separated)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.04),
                      blurRadius: 15,
                      offset: const Offset(0, 5),
                    ),
                  ],
                  border: Border.all(color: AppColors.border.withOpacity(0.5)),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: AppColors.ovoPurple.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: const Text('OVO', style: TextStyle(color: AppColors.ovoPurple, fontWeight: FontWeight.bold, fontSize: 12)),
                          ),
                          const SizedBox(width: 12),
                          const Text('Rp 125.000', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16)),
                        ],
                      ),
                    ),
                    Container(width: 1, height: 30, color: AppColors.border),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Row(
                        children: [
                          SvgPicture.asset('assets/icons/goclub.svg', width: 20, height: 20),
                          const SizedBox(width: 8),
                          const Text('1.250', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            
            const SizedBox(height: 32),
            
            // Services Grid
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 4,
                mainAxisSpacing: 24,
                crossAxisSpacing: 12,
                children: [
                  ServiceItem(title: 'Mobil', iconPath: 'assets/icons/gocar.svg', onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) => const RoutePickerScreen()));
                  }),
                  ServiceItem(title: 'Motor', iconPath: 'assets/icons/goride.svg', onTap: () {}),
                  ServiceItem(title: 'Makanan', iconPath: 'assets/icons/gofood.svg', onTap: () {}),
                  ServiceItem(title: 'Pengantaran', iconPath: 'assets/icons/gosend.svg', onTap: () {}),
                  ServiceItem(title: 'Mart', iconPath: 'assets/icons/gomart.svg', onTap: () {}),
                  ServiceItem(title: 'Express', iconPath: 'assets/icons/express.svg', onTap: () {}),
                  ServiceItem(title: 'Pulsa/Top Up', iconPath: 'assets/icons/gopulsa.svg', onTap: () {}),
                  ServiceItem(title: 'Lainnya', iconPath: 'assets/icons/other.svg', onTap: () {}),
                ],
              ),
            ),
            
            const SizedBox(height: 40),
            
            // Promos Section
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Yuk, Jelajahi Go-Bima',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, letterSpacing: -0.5),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 160,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: [
                  _buildPromoCard('assets/images/1.png', 'Promo 1'),
                  const SizedBox(width: 16),
                  _buildPromoCard('assets/images/2.png', 'Promo 2'),
                ],
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 20,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: AppColors.primary,
          unselectedItemColor: AppColors.textSecondary,
          showUnselectedLabels: true,
          selectedFontSize: 12,
          unselectedFontSize: 12,
          elevation: 0,
          items: [
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 4.0),
                child: SvgPicture.asset('assets/icons/homepage.svg', width: 24, height: 24, colorFilter: ColorFilter.mode(_selectedIndex == 0 ? AppColors.primary : AppColors.textSecondary, BlendMode.srcIn)),
              ),
              label: 'Beranda',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 4.0),
                child: SvgPicture.asset('assets/icons/activity.svg', width: 24, height: 24, colorFilter: ColorFilter.mode(_selectedIndex == 1 ? AppColors.primary : AppColors.textSecondary, BlendMode.srcIn)),
              ),
              label: 'Aktivitas',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 4.0),
                child: SvgPicture.asset('assets/icons/payment.svg', width: 24, height: 24, colorFilter: ColorFilter.mode(_selectedIndex == 2 ? AppColors.primary : AppColors.textSecondary, BlendMode.srcIn)),
              ),
              label: 'Pembayaran',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 4.0),
                child: SvgPicture.asset('assets/icons/message.svg', width: 24, height: 24, colorFilter: ColorFilter.mode(_selectedIndex == 3 ? AppColors.primary : AppColors.textSecondary, BlendMode.srcIn)),
              ),
              label: 'Pesan',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 4.0),
                child: SvgPicture.asset('assets/icons/account.svg', width: 24, height: 24, colorFilter: ColorFilter.mode(_selectedIndex == 4 ? AppColors.primary : AppColors.textSecondary, BlendMode.srcIn)),
              ),
              label: 'Akun',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPromoCard(String assetPath, String fallbackText) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.asset(
          assetPath,
          width: 300,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) => Container(
            width: 300,
            color: Colors.grey[300],
            child: Center(
              child: Text(fallbackText, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black54)),
            ),
          ),
        ),
      ),
    );
  }
}
