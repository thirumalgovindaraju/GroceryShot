import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CartModel()),
        ChangeNotifierProvider(create: (context) => UserModel()),
        ChangeNotifierProvider(create: (context) => OrderModel()),
      ],
      child: const QuickMartApp(),
    ),
  );
}

// Product Model
class Product {
  final String id;
  final String name;
  final double price;
  final double originalPrice;
  final String category;
  final double rating;
  final String deliveryTime;
  final String imageUrl;
  final int discount;
  final String description;
  final String weight; // Added weight for grocery style

  const Product({
    required this.id,
    required this.name,
    required this.price,
    required this.originalPrice,
    required this.category,
    required this.rating,
    required this.deliveryTime,
    required this.imageUrl,
    required this.discount,
    required this.description,
    required this.weight,
  });
}

// Category Model
class Category {
  final String id;
  final String name;
  final String icon;

  const Category({
    required this.id,
    required this.name,
    required this.icon,
  });
}

// Address Model
class Address {
  final String id;
  final String name;
  final String address;
  final String city;
  final String zipCode;
  final String phone;
  final bool isDefault;

  const Address({
    required this.id,
    required this.name,
    required this.address,
    required this.city,
    required this.zipCode,
    required this.phone,
    this.isDefault = false,
  });
}

// Payment Method Model
class PaymentMethod {
  final String id;
  final String name;
  final String icon;
  final String details;

  const PaymentMethod({
    required this.id,
    required this.name,
    required this.icon,
    required this.details,
  });
}

// Order Model
class Order {
  final String id;
  final List<CartItem> items;
  final double totalAmount;
  final Address deliveryAddress;
  final PaymentMethod paymentMethod;
  final DateTime orderTime;
  final String status;
  final String estimatedDeliveryTime;

  const Order({
    required this.id,
    required this.items,
    required this.totalAmount,
    required this.deliveryAddress,
    required this.paymentMethod,
    required this.orderTime,
    required this.status,
    required this.estimatedDeliveryTime,
  });
}

// Cart Item Model
class CartItem {
  final Product product;
  int quantity;

  CartItem({
    required this.product,
    this.quantity = 1,
  });

  double get totalPrice => product.price * quantity;
}

// Sample Data with weights
const List<Category> categories = [
  Category(id: 'all', name: 'All', icon: '🛍️'),
  Category(id: 'fruits', name: 'Fruits', icon: '🍎'),
  Category(id: 'vegetables', name: 'Vegetables', icon: '🥕'),
  Category(id: 'dairy', name: 'Dairy', icon: '🥛'),
  Category(id: 'bakery', name: 'Bakery', icon: '🍞'),
  Category(id: 'snacks', name: 'Snacks', icon: '🍿'),
  Category(id: 'beverages', name: 'Beverages', icon: '🥤'),
];

const List<Product> sampleProducts = [
  Product(
    id: '1',
    name: 'Fresh Red Apples',
    price: 2.99,
    originalPrice: 3.49,
    category: 'fruits',
    rating: 4.5,
    deliveryTime: '10 mins',
    imageUrl: '🍎',
    discount: 15,
    weight: '1 kg',
    description: 'Fresh, crispy red apples sourced from local farms. Perfect for snacking or baking.',
  ),
  Product(
    id: '2',
    name: 'Organic Bananas',
    price: 1.99,
    originalPrice: 2.29,
    category: 'fruits',
    rating: 4.3,
    deliveryTime: '10 mins',
    imageUrl: '🍌',
    discount: 13,
    weight: '1 dozen',
    description: 'Organic bananas rich in potassium and perfect for smoothies.',
  ),
  Product(
    id: '3',
    name: 'Fresh Milk',
    price: 3.50,
    originalPrice: 3.99,
    category: 'dairy',
    rating: 4.7,
    deliveryTime: '8 mins',
    imageUrl: '🥛',
    discount: 12,
    weight: '1 L',
    description: 'Farm fresh whole milk, rich in calcium and vitamins.',
  ),
  Product(
    id: '4',
    name: 'Whole Wheat Bread',
    price: 2.20,
    originalPrice: 2.50,
    category: 'bakery',
    rating: 4.4,
    deliveryTime: '15 mins',
    imageUrl: '🍞',
    discount: 12,
    weight: '400g',
    description: 'Freshly baked whole wheat bread, perfect for sandwiches.',
  ),
  Product(
    id: '5',
    name: 'Farm Fresh Eggs',
    price: 4.00,
    originalPrice: 4.50,
    category: 'dairy',
    rating: 4.6,
    deliveryTime: '12 mins',
    imageUrl: '🥚',
    discount: 11,
    weight: '12 pcs',
    description: 'Free-range eggs from local farms, rich in protein.',
  ),
  Product(
    id: '6',
    name: 'Orange Juice',
    price: 3.75,
    originalPrice: 4.25,
    category: 'beverages',
    rating: 4.2,
    deliveryTime: '10 mins',
    imageUrl: '🧃',
    discount: 12,
    weight: '1 L',
    description: 'Fresh squeezed orange juice, no artificial preservatives.',
  ),
  Product(
    id: '7',
    name: 'Basmati Rice',
    price: 8.99,
    originalPrice: 9.99,
    category: 'grains',
    rating: 4.8,
    deliveryTime: '15 mins',
    imageUrl: '🍚',
    discount: 10,
    weight: '5 kg',
    description: 'Premium quality basmati rice with long grains.',
  ),
  Product(
    id: '8',
    name: 'Green Tea',
    price: 4.50,
    originalPrice: 5.00,
    category: 'beverages',
    rating: 4.4,
    deliveryTime: '12 mins',
    imageUrl: '🍵',
    discount: 10,
    weight: '100g',
    description: 'Organic green tea leaves with natural antioxidants.',
  ),
];

const List<Address> sampleAddresses = [
  Address(
    id: '1',
    name: 'Home',
    address: '123 Anna Nagar Main Road',
    city: 'Chennai',
    zipCode: '600040',
    phone: '+91 98765 43210',
    isDefault: true,
  ),
  Address(
    id: '2',
    name: 'Office',
    address: '456 IT Park, Thoraipakkam',
    city: 'Chennai',
    zipCode: '600096',
    phone: '+91 98765 43210',
  ),
];

const List<PaymentMethod> paymentMethods = [
  PaymentMethod(
    id: '1',
    name: 'Credit/Debit Card',
    icon: '💳',
    details: 'Visa, Mastercard, RuPay',
  ),
  PaymentMethod(
    id: '2',
    name: 'UPI',
    icon: '📱',
    details: 'Google Pay, PhonePe, Paytm',
  ),
  PaymentMethod(
    id: '3',
    name: 'Cash on Delivery',
    icon: '💵',
    details: 'Pay when delivered',
  ),
  PaymentMethod(
    id: '4',
    name: 'Wallet',
    icon: '👛',
    details: 'QuickMart Wallet',
  ),
];

// Cart Model
class CartModel extends ChangeNotifier {
  final Map<String, CartItem> _items = {};

  Map<String, CartItem> get items => _items;

  int get totalItems => _items.values.fold(0, (sum, item) => sum + item.quantity);

  double get totalPrice => _items.values.fold(0.0, (sum, item) => sum + item.totalPrice);

  double get deliveryFee => totalPrice > 50 ? 0.0 : 2.99;

  double get finalTotal => totalPrice + deliveryFee;

  void addItem(Product product) {
    if (_items.containsKey(product.id)) {
      _items[product.id]!.quantity++;
    } else {
      _items[product.id] = CartItem(product: product);
    }
    notifyListeners();
  }

  void removeItem(String productId) {
    if (_items.containsKey(productId)) {
      if (_items[productId]!.quantity > 1) {
        _items[productId]!.quantity--;
      } else {
        _items.remove(productId);
      }
    }
    notifyListeners();
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }

  int getQuantity(String productId) {
    return _items[productId]?.quantity ?? 0;
  }
}

// User Model
class UserModel extends ChangeNotifier {
  String _selectedLocation = 'Home • Chennai';
  String _estimatedDeliveryTime = '12 mins';
  Address? _selectedAddress;
  PaymentMethod? _selectedPaymentMethod;

  String get selectedLocation => _selectedLocation;
  String get estimatedDeliveryTime => _estimatedDeliveryTime;
  Address? get selectedAddress => _selectedAddress;
  PaymentMethod? get selectedPaymentMethod => _selectedPaymentMethod;

  void updateLocation(String location) {
    _selectedLocation = location;
    notifyListeners();
  }

  void selectAddress(Address address) {
    _selectedAddress = address;
    notifyListeners();
  }

  void selectPaymentMethod(PaymentMethod method) {
    _selectedPaymentMethod = method;
    notifyListeners();
  }
}

// Order Model
class OrderModel extends ChangeNotifier {
  final List<Order> _orders = [];

  List<Order> get orders => _orders;

  void addOrder(Order order) {
    _orders.insert(0, order);
    notifyListeners();
  }

  Order? getOrder(String orderId) {
    try {
      return _orders.firstWhere((order) => order.id == orderId);
    } catch (e) {
      return null;
    }
  }
}

// Main App
class QuickMartApp extends StatelessWidget {
  const QuickMartApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QuickMart',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          elevation: 0,
        ),
      ),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// Home Screen
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _selectedCategory = 'all';
  String _searchQuery = '';
  final TextEditingController _searchController = TextEditingController();

  List<Product> get filteredProducts {
    return sampleProducts.where((product) {
      final matchesCategory = _selectedCategory == 'all' || product.category == _selectedCategory;
      final matchesSearch = product.name.toLowerCase().contains(_searchQuery.toLowerCase());
      return matchesCategory && matchesSearch;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: CustomScrollView(
        slivers: [
          // App Bar
          SliverAppBar(
            floating: true,
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            elevation: 0,
            flexibleSpace: Padding(
              padding: const EdgeInsets.fromLTRB(16, 50, 16, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.location_on, size: 16, color: Colors.grey),
                              const SizedBox(width: 4),
                              const Text('Delivering to', style: TextStyle(fontSize: 12, color: Colors.grey)),
                            ],
                          ),
                          Consumer<UserModel>(
                            builder: (context, userModel, child) {
                              return Text(
                                userModel.selectedLocation,
                                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                              );
                            },
                          ),
                        ],
                      ),
                      Consumer<UserModel>(
                        builder: (context, userModel, child) {
                          return Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                              color: Colors.green[100],
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(Icons.access_time, size: 16, color: Colors.green),
                                const SizedBox(width: 4),
                                Text(
                                  userModel.estimatedDeliveryTime,
                                  style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // Search Bar
                  TextField(
                    controller: _searchController,
                    onChanged: (value) {
                      setState(() {
                        _searchQuery = value;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: 'Search for groceries...',
                      prefixIcon: const Icon(Icons.search, color: Colors.grey),
                      filled: true,
                      fillColor: Colors.grey[100],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    ),
                  ),
                ],
              ),
            ),
            expandedHeight: 140,
          ),

          // Categories
          SliverToBoxAdapter(
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: SizedBox(
                height: 80,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    final category = categories[index];
                    final isSelected = _selectedCategory == category.id;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedCategory = category.id;
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.only(right: 16),
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          color: isSelected ? Colors.green[100] : Colors.transparent,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(category.icon, style: const TextStyle(fontSize: 24)),
                            const SizedBox(height: 4),
                            Text(
                              category.name,
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: isSelected ? Colors.green[700] : Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),

          // Brand Section
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  ShaderMask(
                    shaderCallback: (bounds) => const LinearGradient(
                      colors: [Colors.green, Colors.teal],
                    ).createShader(bounds),
                    child: const Text(
                      'QuickMart',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Fresh groceries delivered in minutes',
                    style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
          ),

          // Products Grid - Fixed aspect ratio and overflow
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.8, // Increased from 0.75 to give more space
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              delegate: SliverChildBuilderDelegate(
                    (context, index) {
                  final product = filteredProducts[index];
                  return ProductCard(product: product);
                },
                childCount: filteredProducts.length,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Consumer<CartModel>(
        builder: (context, cart, child) {
          if (cart.totalItems == 0) return const SizedBox.shrink();

          return FloatingActionButton.extended(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CartScreen()),
              );
            },
            backgroundColor: Colors.green,
            icon: const Icon(Icons.shopping_cart, color: Colors.white),
            label: Text(
              '${cart.totalItems} items',
              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          );
        },
      ),
    );
  }
}

// Product Card Widget - Redesigned like Swiggy/Zepto
class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[200]!, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.08),
            spreadRadius: 0,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product Image and Discount Badge
          Expanded(
            flex: 5,
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  child: Center(
                    child: Text(
                      product.imageUrl,
                      style: const TextStyle(fontSize: 40),
                    ),
                  ),
                ),
                if (product.discount > 0)
                  Positioned(
                    top: 8,
                    left: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.red[600],
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        '${product.discount}% OFF',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 9,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),

          // Product Details - Fixed layout to prevent overflow
          Expanded(
            flex: 6,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Product name
                  Text(
                    product.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                      color: Colors.black87,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 2),

                  // Weight
                  Text(
                    product.weight,
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 4),

                  // Rating and delivery time
                  Row(
                    children: [
                      Icon(Icons.star, size: 11, color: Colors.amber[700]),
                      const SizedBox(width: 2),
                      Text(
                        '${product.rating}',
                        style: const TextStyle(fontSize: 10, color: Colors.black54),
                      ),
                      const SizedBox(width: 6),
                      Icon(Icons.access_time, size: 10, color: Colors.grey[500]),
                      const SizedBox(width: 2),
                      Text(
                        product.deliveryTime,
                        style: TextStyle(fontSize: 10, color: Colors.grey[600]),
                      ),
                    ],
                  ),
                  const Spacer(),

                  // Price and Add button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      // Price section
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              children: [
                                Text(
                                  '₹${product.price.toStringAsFixed(0)}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: Colors.black87,
                                  ),
                                ),
                                if (product.originalPrice > product.price) ...[
                                  const SizedBox(width: 4),
                                  Text(
                                    '₹${product.originalPrice.toStringAsFixed(0)}',
                                    style: TextStyle(
                                      fontSize: 11,
                                      color: Colors.grey[500],
                                      decoration: TextDecoration.lineThrough,
                                    ),
                                  ),
                                ],
                              ],
                            ),
                          ],
                        ),
                      ),

                      // Add/Quantity button
                      Consumer<CartModel>(
                        builder: (context, cart, child) {
                          final quantity = cart.getQuantity(product.id);

                          if (quantity == 0) {
                            return GestureDetector(
                              onTap: () {
                                cart.addItem(product);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('${product.name} added to cart'),
                                    duration: const Duration(milliseconds: 1500),
                                    backgroundColor: Colors.green,
                                    behavior: SnackBarBehavior.floating,
                                    margin: const EdgeInsets.all(16),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(color: Colors.green, width: 1.5),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: const Text(
                                  'ADD',
                                  style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            );
                          }

                          return Container(
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                GestureDetector(
                                  onTap: () => cart.removeItem(product.id),
                                  child: Container(
                                    padding: const EdgeInsets.all(4),
                                    child: const Icon(
                                      Icons.remove,
                                      size: 14,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Container(
                                  constraints: const BoxConstraints(minWidth: 20),
                                  padding: const EdgeInsets.symmetric(horizontal: 4),
                                  child: Text(
                                    '$quantity',
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () => cart.addItem(product),
                                  child: Container(
                                    padding: const EdgeInsets.all(4),
                                    child: const Icon(
                                      Icons.add,
                                      size: 14,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Cart Screen
class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      backgroundColor: Colors.grey[50],
      body: Consumer<CartModel>(
        builder: (context, cart, child) {
          if (cart.items.isEmpty) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.shopping_cart_outlined, size: 80, color: Colors.grey),
                  SizedBox(height: 16),
                  Text(
                    'Your cart is empty!',
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                ],
              ),
            );
          }

          return Column(
              children: [
          Expanded(
          child: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: cart.items.length,
          itemBuilder: (context, index) {
          final cartItem = cart.items.values.elementAt(index);
          return CartItemCard(cartItem: cartItem);
          },
          ),
          ),

          // Cart Summary
          Container(
          color: Colors.white,
          padding: const EdgeInsets.all(16),
          child: Column(
          children: [
          Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          const Text('Subtotal:', style: TextStyle(fontSize: 16)),
          Text(
          '₹${cart.totalPrice.toStringAsFixed(2)}',
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          ],
          ),
          const SizedBox(height: 8),
          Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Text(
          'Delivery Fee:',
          style: TextStyle(fontSize: 14, color: Colors.grey[600]),
          ),
          Text(
          cart.deliveryFee == 0 ? 'FREE' : '₹${cart.deliveryFee.toStringAsFixed(2)}',
          style: TextStyle(
          fontSize: 14,
          color: cart.deliveryFee == 0 ? Colors.green : Colors.grey[600],
          fontWeight: cart.deliveryFee == 0 ? FontWeight.bold : FontWeight.normal,
          ),
          ),
          ],
          ),
          if (cart.deliveryFee == 0)
          Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Text(
                          'Free delivery on orders above \$50',
                          style: TextStyle(fontSize: 12, color: Colors.green[600]),
                        ),
                      ),
                    const Divider(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Total:',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '\$${cart.finalTotal.toStringAsFixed(2)}',
                          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const CheckoutScreen()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          'Proceed to Checkout',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

// Cart Item Card Widget
class CartItemCard extends StatelessWidget {
  final CartItem cartItem;

  const CartItemCard({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Product Image
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text(
                cartItem.product.imageUrl,
                style: const TextStyle(fontSize: 24),
              ),
            ),
          ),
          const SizedBox(width: 16),

          // Product Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cartItem.product.name,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(height: 4),
                Text(
                  '\${cartItem.product.price.toStringAsFixed(2)} each',
                  style: TextStyle(color: Colors.grey[600], fontSize: 14),
                ),
                const SizedBox(height: 8),
                Text(
                  'Total: \${cartItem.totalPrice.toStringAsFixed(2)}',
                  style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.green),
                ),
              ],
            ),
          ),

          // Quantity Controls
          Consumer<CartModel>(
            builder: (context, cart, child) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.green[50],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () => cart.removeItem(cartItem.product.id),
                      icon: const Icon(Icons.remove, size: 18),
                      color: Colors.green,
                      constraints: const BoxConstraints(minWidth: 36, minHeight: 36),
                    ),
                    Container(
                      constraints: const BoxConstraints(minWidth: 30),
                      child: Text(
                        '${cartItem.quantity}',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () => cart.addItem(cartItem.product),
                      icon: const Icon(Icons.add, size: 18),
                      color: Colors.green,
                      constraints: const BoxConstraints(minWidth: 36, minHeight: 36),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

// Checkout Screen
class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  int _currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      backgroundColor: Colors.grey[50],
      body: Consumer3<CartModel, UserModel, OrderModel>(
        builder: (context, cart, user, orderModel, child) {
          return Column(
            children: [
              // Progress Indicator
              Container(
                color: Colors.white,
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Expanded(
                      child: _buildStepIndicator(0, 'Address', _currentStep >= 0),
                    ),
                    Container(width: 2, height: 2, color: Colors.grey),
                    Expanded(
                      child: _buildStepIndicator(1, 'Payment', _currentStep >= 1),
                    ),
                    Container(width: 2, height: 2, color: Colors.grey),
                    Expanded(
                      child: _buildStepIndicator(2, 'Review', _currentStep >= 2),
                    ),
                  ],
                ),
              ),

              Expanded(
                child: IndexedStack(
                  index: _currentStep,
                  children: [
                    AddressSelectionStep(
                      onNext: () => setState(() => _currentStep = 1),
                    ),
                    PaymentSelectionStep(
                      onNext: () => setState(() => _currentStep = 2),
                      onBack: () => setState(() => _currentStep = 0),
                    ),
                    OrderReviewStep(
                      onBack: () => setState(() => _currentStep = 1),
                      onPlaceOrder: () => _placeOrder(context, cart, user, orderModel),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildStepIndicator(int step, String title, bool isActive) {
    return Column(
      children: [
        Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            color: isActive ? Colors.green : Colors.grey[300],
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              '${step + 1}',
              style: TextStyle(
                color: isActive ? Colors.white : Colors.grey[600],
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          title,
          style: TextStyle(
            fontSize: 12,
            color: isActive ? Colors.green : Colors.grey[600],
            fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    );
  }

  void _placeOrder(BuildContext context, CartModel cart, UserModel user, OrderModel orderModel) {
    if (user.selectedAddress == null || user.selectedPaymentMethod == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select address and payment method'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    // Create order
    final order = Order(
      id: 'ORDER_${DateTime.now().millisecondsSinceEpoch}',
      items: cart.items.values.toList(),
      totalAmount: cart.finalTotal,
      deliveryAddress: user.selectedAddress!,
      paymentMethod: user.selectedPaymentMethod!,
      orderTime: DateTime.now(),
      status: 'Confirmed',
      estimatedDeliveryTime: user.estimatedDeliveryTime,
    );

    orderModel.addOrder(order);
    cart.clearCart();

    // Navigate to order confirmation
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => OrderConfirmationScreen(order: order),
      ),
    );
  }
}

// Address Selection Step
class AddressSelectionStep extends StatelessWidget {
  final VoidCallback onNext;

  const AddressSelectionStep({super.key, required this.onNext});

  @override
  Widget build(BuildContext context) {
    return Consumer<UserModel>(
      builder: (context, user, child) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Select Delivery Address',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),

              Expanded(
                child: ListView.builder(
                  itemCount: sampleAddresses.length,
                  itemBuilder: (context, index) {
                    final address = sampleAddresses[index];
                    final isSelected = user.selectedAddress?.id == address.id;

                    return Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      child: InkWell(
                        onTap: () => user.selectAddress(address),
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: isSelected ? Colors.green : Colors.grey[300]!,
                              width: isSelected ? 2 : 1,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    isSelected ? Icons.radio_button_checked : Icons.radio_button_unchecked,
                                    color: isSelected ? Colors.green : Colors.grey,
                                  ),
                                  const SizedBox(width: 12),
                                  Text(
                                    address.name,
                                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                                  ),
                                  if (address.isDefault)
                                    Container(
                                      margin: const EdgeInsets.only(left: 8),
                                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                      decoration: BoxDecoration(
                                        color: Colors.green[100],
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: const Text(
                                        'DEFAULT',
                                        style: TextStyle(fontSize: 10, color: Colors.green, fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Padding(
                                padding: const EdgeInsets.only(left: 36),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(address.address),
                                    Text('${address.city} - ${address.zipCode}'),
                                    Text('Phone: ${address.phone}'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: user.selectedAddress != null ? onNext : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Continue to Payment',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

// Payment Selection Step
class PaymentSelectionStep extends StatelessWidget {
  final VoidCallback onNext;
  final VoidCallback onBack;

  const PaymentSelectionStep({super.key, required this.onNext, required this.onBack});

  @override
  Widget build(BuildContext context) {
    return Consumer<UserModel>(
      builder: (context, user, child) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Select Payment Method',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),

              Expanded(
                child: ListView.builder(
                  itemCount: paymentMethods.length,
                  itemBuilder: (context, index) {
                    final method = paymentMethods[index];
                    final isSelected = user.selectedPaymentMethod?.id == method.id;

                    return Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      child: InkWell(
                        onTap: () => user.selectPaymentMethod(method),
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: isSelected ? Colors.green : Colors.grey[300]!,
                              width: isSelected ? 2 : 1,
                            ),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                isSelected ? Icons.radio_button_checked : Icons.radio_button_unchecked,
                                color: isSelected ? Colors.green : Colors.grey,
                              ),
                              const SizedBox(width: 12),
                              Text(method.icon, style: const TextStyle(fontSize: 24)),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      method.name,
                                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                                    ),
                                    Text(
                                      method.details,
                                      style: TextStyle(color: Colors.grey[600], fontSize: 14),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: onBack,
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text('Back'),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: user.selectedPaymentMethod != null ? onNext : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'Review Order',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

// Order Review Step
class OrderReviewStep extends StatelessWidget {
  final VoidCallback onBack;
  final VoidCallback onPlaceOrder;

  const OrderReviewStep({super.key, required this.onBack, required this.onPlaceOrder});

  @override
  Widget build(BuildContext context) {
    return Consumer2<CartModel, UserModel>(
      builder: (context, cart, user, child) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Review Your Order',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),

              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Delivery Address
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Delivery Address',
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            const SizedBox(height: 8),
                            if (user.selectedAddress != null) ...[
                              Text(user.selectedAddress!.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                              Text(user.selectedAddress!.address),
                              Text('${user.selectedAddress!.city} - ${user.selectedAddress!.zipCode}'),
                              Text('Phone: ${user.selectedAddress!.phone}'),
                            ],
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Payment Method
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Payment Method',
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            const SizedBox(height: 8),
                            if (user.selectedPaymentMethod != null)
                              Row(
                                children: [
                                  Text(user.selectedPaymentMethod!.icon, style: const TextStyle(fontSize: 24)),
                                  const SizedBox(width: 12),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(user.selectedPaymentMethod!.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                                      Text(user.selectedPaymentMethod!.details, style: TextStyle(color: Colors.grey[600])),
                                    ],
                                  ),
                                ],
                              ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Order Items
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Order Items',
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            const SizedBox(height: 12),
                            ...cart.items.values.map((item) => Padding(
                              padding: const EdgeInsets.only(bottom: 8),
                              child: Row(
                                children: [
                                  Text(item.product.imageUrl, style: const TextStyle(fontSize: 20)),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(item.product.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                                        Text('Quantity: ${item.quantity}'),
                                      ],
                                    ),
                                  ),
                                  Text(
                                    '\${item.totalPrice.toStringAsFixed(2)}',
                                    style: const TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            )).toList(),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Order Summary
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('Subtotal:'),
                                Text('\${cart.totalPrice.toStringAsFixed(2)}'),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('Delivery Fee:'),
                                Text(
                                  cart.deliveryFee == 0 ? 'FREE' : '\${cart.deliveryFee.toStringAsFixed(2)}',
                                  style: TextStyle(
                                    color: cart.deliveryFee == 0 ? Colors.green : null,
                                    fontWeight: cart.deliveryFee == 0 ? FontWeight.bold : null,
                                  ),
                                ),
                              ],
                            ),
                            const Divider(height: 24),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Total:',
                                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  '\${cart.finalTotal.toStringAsFixed(2)}',
                                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green),
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

              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: onBack,
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text('Back'),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: onPlaceOrder,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'Place Order',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

// Order Confirmation Screen
class OrderConfirmationScreen extends StatelessWidget {
  final Order order;

  const OrderConfirmationScreen({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: const BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 60,
                ),
              ),
              const SizedBox(height: 32),
              const Text(
                'Order Confirmed!',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Your order #${order.id.substring(order.id.length - 8)} has been confirmed',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(height: 32),

              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 10,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Estimated Delivery Time:', style: TextStyle(fontWeight: FontWeight.bold)),
                        Text(order.estimatedDeliveryTime, style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Total Amount:', style: TextStyle(fontWeight: FontWeight.bold)),
                        Text('\${order.totalAmount.toStringAsFixed(2)}', style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Payment Method:', style: TextStyle(fontWeight: FontWeight.bold)),
                        Text(order.paymentMethod.name),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Delivery Address:', style: TextStyle(fontWeight: FontWeight.bold)),
                        Expanded(
                          child: Text(
                            '${order.deliveryAddress.name}\n${order.deliveryAddress.address}',
                            textAlign: TextAlign.right,
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 40),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => const HomeScreen()),
                          (route) => false,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Continue Shopping',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => OrderTrackingScreen(order: order)),
                    );
                  },
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.green,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Track Order',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Order Tracking Screen
class OrderTrackingScreen extends StatelessWidget {
  final Order order;

  const OrderTrackingScreen({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Track Order #${order.id.substring(order.id.length - 8)}'),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
        ),
        backgroundColor: Colors.grey[50],
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
              children: [
          // Order Status Card
          Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 10,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.green[100],
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.shopping_bag, color: Colors.green, size: 30),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Order ${order.status}',
                          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Estimated delivery in ${order.estimatedDeliveryTime}',
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Total Amount:', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(
                    '\${order.totalAmount.toStringAsFixed(2)}',
                    style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.green, fontSize: 16),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),

        // Order Timeline
        Expanded(
            child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 10,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  const Text(
                  'Order Timeline',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),

                    // Complete the OrderTrackingScreen and add missing timeline implementation

// Add this to complete the OrderTrackingScreen class
                    _buildTimelineItem(
                      icon: Icons.check_circle,
                      title: 'Order Confirmed',
                      subtitle: 'Your order has been placed successfully',
                      time: _formatTime(order.orderTime),
                      isCompleted: true,
                    ),
                    _buildTimelineItem(
                      icon: Icons.kitchen,
                      title: 'Preparing Your Order',
                      subtitle: 'We are getting your items ready',
                      time: _formatTime(order.orderTime.add(const Duration(minutes: 2))),
                      isCompleted: true,
                    ),
                    _buildTimelineItem(
                      icon: Icons.local_shipping,
                      title: 'Out for Delivery',
                      subtitle: 'Your order is on the way',
                      time: _formatTime(order.orderTime.add(const Duration(minutes: 5))),
                      isCompleted: false,
                      isActive: true,
                    ),
                    _buildTimelineItem(
                      icon: Icons.home,
                      title: 'Delivered',
                      subtitle: 'Order delivered successfully',
                      time: 'Expected in ${order.estimatedDeliveryTime}',
                      isCompleted: false,
                    ),
                  ],
                ),
            ),
        ),

                // Order Items Summary
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 10,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Order Items',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 12),
                      ...order.items.take(3).map((item) => Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Row(
                          children: [
                            Text(item.product.imageUrl, style: const TextStyle(fontSize: 20)),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                '${item.product.name} x${item.quantity}',
                                style: const TextStyle(fontSize: 14),
                              ),
                            ),
                            Text(
                              '\$${item.totalPrice.toStringAsFixed(2)}',
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      )).toList(),
                      if (order.items.length > 3)
                        Text(
                          '+ ${order.items.length - 3} more items',
                          style: TextStyle(color: Colors.grey[600], fontSize: 12),
                        ),
                    ],
                  ),
                ),
              ],
          ),
        ),
    );
  }

  Widget _buildTimelineItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required String time,
    bool isCompleted = false,
    bool isActive = false,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: isCompleted
                    ? Colors.green
                    : isActive
                    ? Colors.orange
                    : Colors.grey[300],
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                color: isCompleted || isActive ? Colors.white : Colors.grey[600],
                size: 20,
              ),
            ),
            Container(
              width: 2,
              height: 50,
              color: Colors.grey[300],
            ),
          ],
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: isCompleted || isActive ? Colors.black : Colors.grey[600],
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(height: 2),
              Text(
                time,
                style: TextStyle(
                  fontSize: 11,
                  color: Colors.grey[500],
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ],
    );
  }

  String _formatTime(DateTime dateTime) {
    return '${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}';
  }
}