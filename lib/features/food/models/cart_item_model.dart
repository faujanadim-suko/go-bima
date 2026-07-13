import 'menu_item_model.dart';
import 'restaurant_model.dart';

class CartItemModel {
  final MenuItemModel menuItem;
  int quantity;
  String? notes;

  CartItemModel({
    required this.menuItem,
    required this.quantity,
    this.notes,
  });

  double get totalPrice => menuItem.price * quantity;
}

// Global simple state for the cart for demo purposes
class CartData {
  static RestaurantModel? currentRestaurant;
  static List<CartItemModel> items = [];

  static void addItem(RestaurantModel restaurant, MenuItemModel item, int quantity, {String? notes}) {
    if (currentRestaurant?.id != restaurant.id) {
      // Clear cart if ordering from a different restaurant
      currentRestaurant = restaurant;
      items.clear();
    }

    // Check if item already in cart
    final index = items.indexWhere((element) => element.menuItem.id == item.id);
    if (index != -1) {
      items[index].quantity += quantity;
      if (notes != null) {
        items[index].notes = notes;
      }
    } else {
      items.add(CartItemModel(menuItem: item, quantity: quantity, notes: notes));
    }
  }

  static double get subTotal {
    return items.fold(0, (sum, item) => sum + item.totalPrice);
  }

  static int get totalQuantity {
    return items.fold(0, (sum, item) => sum + item.quantity);
  }

  static void clear() {
    currentRestaurant = null;
    items.clear();
  }
}
