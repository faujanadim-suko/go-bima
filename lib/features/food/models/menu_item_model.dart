class MenuItemModel {
  final String id;
  final String restaurantId;
  final String name;
  final String description;
  final double price;
  final String imageUrl;

  MenuItemModel({
    required this.id,
    required this.restaurantId,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
  });
}

// Dummy Data
final List<MenuItemModel> dummyMenuItems = [
  // McDonald's
  MenuItemModel(
    id: 'm1',
    restaurantId: 'r1',
    name: 'PaNas 1',
    description: '1 Ayam Krispy, 1 Nasi, 1 Fruit Tea',
    price: 35000,
    imageUrl: '', // Will use an icon fallback if empty
  ),
  MenuItemModel(
    id: 'm2',
    restaurantId: 'r1',
    name: 'McChicken',
    description: 'Burger daging ayam spesial',
    price: 25000,
    imageUrl: '',
  ),
  MenuItemModel(
    id: 'm3',
    restaurantId: 'r1',
    name: 'French Fries (Large)',
    description: 'Kentang goreng renyah',
    price: 18000,
    imageUrl: '',
  ),
  
  // KFC
  MenuItemModel(
    id: 'k1',
    restaurantId: 'r2',
    name: 'Super Besar 1',
    description: '1 Ayam, 1 Nasi, 1 Coca Cola',
    price: 38000,
    imageUrl: '',
  ),
  MenuItemModel(
    id: 'k2',
    restaurantId: 'r2',
    name: 'O.R. Burger',
    description: 'Burger dengan patty ayam original',
    price: 20000,
    imageUrl: '',
  ),
];
