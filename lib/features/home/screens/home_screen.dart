import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/constants/colors.dart';
import '../../../core/widgets/service_item.dart';
import '../../ride/screens/route_picker_screen.dart';
import '../../food/screens/food_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  PageController? _promoPageController;
  int _currentPromoPage = 0;
  Timer? _promoTimer;

  @override
  void initState() {
    super.initState();
    _promoPageController = PageController();
    _startPromoTimer();
  }

  void _startPromoTimer() {
    _promoTimer?.cancel();
    _promoTimer = Timer.periodic(const Duration(seconds: 5), (timer) {
      final controller = _promoPageController;
      if (controller != null && controller.hasClients) {
        int nextPage = (_currentPromoPage + 1) % 2;
        controller.animateToPage(
          nextPage,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _promoTimer?.cancel();
    _promoPageController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _promoPageController ??= PageController();
    if (_promoTimer == null || !_promoTimer!.isActive) {
      _startPromoTimer();
    }
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
                        icon: const Icon(
                          Icons.qr_code_scanner,
                          color: Colors.white,
                          size: 28,
                        ),
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
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 14,
                    ),
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
                        SvgPicture.asset(
                          'assets/icons/search.svg',
                          width: 22,
                          height: 22,
                          colorFilter: const ColorFilter.mode(
                            AppColors.textSecondary,
                            BlendMode.srcIn,
                          ),
                        ),
                        const SizedBox(width: 12),
                        const Expanded(
                          child: Text(
                            'Mau ke mana hari ini?',
                            style: TextStyle(
                              color: AppColors.textSecondary,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        CircleAvatar(
                          radius: 16,
                          backgroundColor: AppColors.greyBackground,
                          child: const Icon(
                            Icons.person,
                            size: 20,
                            color: AppColors.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
             const SizedBox(height: 36), // Space for the overlapping search card
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 6,
                                  vertical: 2,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.ovoPurple.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: const Text(
                                  'OVO',
                                  style: TextStyle(
                                    color: AppColors.ovoPurple,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 6),
                              const Text(
                                'Saldo',
                                style: TextStyle(
                                  color: AppColors.textSecondary,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 6),
                          Row(
                            children: [
                              const Text(
                                'Rp 125.000',
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(width: 4),
                              Container(
                                padding: const EdgeInsets.all(2),
                                decoration: const BoxDecoration(
                                  color: AppColors.greyBackground,
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.keyboard_arrow_down,
                                  size: 16,
                                  color: AppColors.textPrimary,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(width: 1, height: 40, color: AppColors.border),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(
                                'assets/icons/goclub.svg',
                                width: 14,
                                height: 14,
                              ),
                              const SizedBox(width: 6),
                              const Text(
                                'Poin',
                                style: TextStyle(
                                  color: AppColors.textSecondary,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 6),
                          Row(
                            children: [
                              const Text(
                                '1.250',
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(width: 4),
                              const Icon(
                                Icons.arrow_forward_ios,
                                size: 12,
                                color: AppColors.textSecondary,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 12),

            // Services Grid
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 4,
                mainAxisSpacing: 10,
                crossAxisSpacing: 12,
                childAspectRatio: 0.72,
                children: [
                  ServiceItem(
                    title: 'Mobil',
                    iconPath: 'assets/icons/gocar.svg',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const RoutePickerScreen(),
                        ),
                      );
                    },
                  ),
                  ServiceItem(
                    title: 'Motor',
                    iconPath: 'assets/icons/goride.svg',
                    onTap: () {},
                  ),
                  ServiceItem(
                    title: 'Makanan',
                    iconPath: 'assets/icons/gofood.svg',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const FoodScreen(),
                        ),
                      );
                    },
                  ),
                  ServiceItem(
                    title: 'Pengantaran',
                    iconPath: 'assets/icons/gosend.svg',
                    onTap: () {},
                  ),
                  ServiceItem(
                    title: 'Mart',
                    iconPath: 'assets/icons/gomart.svg',
                    onTap: () {},
                  ),
                  ServiceItem(
                    title: 'Express',
                    iconPath: 'assets/icons/express.svg',
                    onTap: () {},
                  ),
                  ServiceItem(
                    title: 'Pulsa/Top Up',
                    iconPath: 'assets/icons/gopulsa.svg',
                    onTap: () {},
                  ),
                  ServiceItem(
                    title: 'Lainnya',
                    iconPath: 'assets/icons/other.svg',
                    onTap: () {},
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Promos Section
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Yuk, Jelajahi Go-Bima',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -0.5,
                ),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 160,
              child: PageView(
                controller: _promoPageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentPromoPage = index;
                  });
                },
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Expanded(child: _buildPromoCard('assets/images/1.png', 'Promo 1')),
                        const SizedBox(width: 16),
                        Expanded(child: _buildPromoCard('assets/images/2.png', 'Promo 2')),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Expanded(child: _buildPromoCard('assets/images/3.png', 'Promo 3')),
                        const SizedBox(width: 16),
                        Expanded(child: _buildPromoCard('assets/images/1.png', 'Promo 4')),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(2, (index) {
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  height: 6,
                  width: _currentPromoPage == index ? 20 : 6,
                  decoration: BoxDecoration(
                    color: _currentPromoPage == index
                        ? AppColors.primary
                        : AppColors.border,
                    borderRadius: BorderRadius.circular(3),
                  ),
                );
              }),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(top: 8, bottom: 8), // adds visual height
        decoration: BoxDecoration(
          color: Colors.white,
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
          backgroundColor: Colors.transparent, // transparent so Container color shows
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
                child: SvgPicture.asset(
                  'assets/icons/homepage.svg',
                  width: 24,
                  height: 24,
                  colorFilter: ColorFilter.mode(
                    _selectedIndex == 0
                        ? AppColors.primary
                        : AppColors.textSecondary,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              label: 'Beranda',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 4.0),
                child: SvgPicture.asset(
                  'assets/icons/activity.svg',
                  width: 24,
                  height: 24,
                  colorFilter: ColorFilter.mode(
                    _selectedIndex == 1
                        ? AppColors.primary
                        : AppColors.textSecondary,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              label: 'Aktivitas',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 4.0),
                child: SvgPicture.asset(
                  'assets/icons/payment.svg',
                  width: 24,
                  height: 24,
                  colorFilter: ColorFilter.mode(
                    _selectedIndex == 2
                        ? AppColors.primary
                        : AppColors.textSecondary,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              label: 'Pembayaran',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 4.0),
                child: SvgPicture.asset(
                  'assets/icons/message.svg',
                  width: 24,
                  height: 24,
                  colorFilter: ColorFilter.mode(
                    _selectedIndex == 3
                        ? AppColors.primary
                        : AppColors.textSecondary,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              label: 'Pesan',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 4.0),
                child: SvgPicture.asset(
                  'assets/icons/account.svg',
                  width: 24,
                  height: 24,
                  colorFilter: ColorFilter.mode(
                    _selectedIndex == 4
                        ? AppColors.primary
                        : AppColors.textSecondary,
                    BlendMode.srcIn,
                  ),
                ),
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
          height: 160,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) => Container(
            height: 160,
            color: Colors.grey[300],
            child: Center(
              child: Text(
                fallbackText,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
