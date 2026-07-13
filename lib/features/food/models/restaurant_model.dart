class RestaurantModel {
  final String id;
  final String name;
  final double rating;
  final String distanceStr;
  final String deliveryFeeStr;
  final String promo;
  final String imageUrl;

  RestaurantModel({
    required this.id,
    required this.name,
    required this.rating,
    required this.distanceStr,
    required this.deliveryFeeStr,
    required this.promo,
    required this.imageUrl,
  });
}

// Dummy Data
final List<RestaurantModel> dummyRestaurants = [
  RestaurantModel(
    id: 'r1',
    name: 'McDonald\'s - Melawai',
    rating: 4.8,
    distanceStr: '15 min • 1.2 km',
    deliveryFeeStr: 'Rp9.000 Delivery',
    promo: 'Diskon 20% s/d 20rb',
    imageUrl: 'assets/images/3.png',
  ),
  RestaurantModel(
    id: 'r2',
    name: 'KFC - Melawai',
    rating: 4.6,
    distanceStr: '20 min • 1.5 km',
    deliveryFeeStr: 'Rp10.000 Delivery',
    promo: 'Diskon 20% s/d 20rb',
    imageUrl: 'assets/images/3.png', // Fallback
  ),
];
