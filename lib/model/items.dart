// ignore_for_file: non_constant_identifier_names

class Product {
  final String? name;
  final String? image;
  final String? type;
  final String? weight;
  final double? price;
  int cartQuantity;
  final String? description;
  final String? pcksize;
  final String? productId;
  final String? dispensedin;
  final String? constituents;

  Product({
    required this.name,
    required this.image,
    required this.type,
    required this.price,
    required this.weight,
    required this.cartQuantity,
    required this.description,
    required this.pcksize,
    required this.productId,
    required this.dispensedin,
    required this.constituents,
  });
}

List<Product> CartList = [];

final List<Product> products = [
  Product(
    name: 'Paracetamol',
    image: 'assets/images/Rectangle5.png',
    type: 'Tablet',
    price: 350.00,
    weight: '500mg',
    cartQuantity: 1,
    description: '1 pack of Paracetamol(500mg) contains 8 units of 12 tablets.',
    constituents: 'Tablet',
    dispensedin: 'Packs',
    pcksize: '8 x 12 tablets(96)',
    productId: 'PRO23648856',
  ),
  Product(
    name: 'Doiiprane',
    image: 'assets/images/Rectangle529.png',
    type: 'Capsule',
    price: 350.00,
    weight: '1000mg',
    cartQuantity: 1,
    description: '1 pack of Doiiprane(1000mg) contains 8 units of 12 tablets.',
    constituents: 'Doiiprane',
    dispensedin: 'Packs',
    pcksize: '8 x 10 tablets(96)',
    productId: 'PRO67648856',
  ),
  Product(
    name: 'Paracetamol',
    image: 'assets/images/Rectangle527.png',
    type: 'Tablet',
    price: 350.00,
    weight: '500mg',
    cartQuantity: 1,
    description: '1 pack of Paracetamol(500mg) contains 8 units of 12 tablets.',
    constituents: 'Paracetamol',
    dispensedin: 'Packs',
    pcksize: '5 x 10 tablets(96)',
    productId: 'PRO2709756',
  ),
  Product(
    name: 'Ibuprofen',
    image: 'assets/images/Rectangle530.png',
    type: 'Tablet',
    price: 350.00,
    weight: '200mg',
    cartQuantity: 1,
    description: '1 pack of Ibruprofen(200mg) contains 8 units of 12 tablets.',
    constituents: 'Ibuprofen',
    dispensedin: 'Packs',
    pcksize: '5 x 10 tablets(66)',
    productId: 'PRO2336556',
  ),
  Product(
    name: 'Panadol',
    image: 'assets/images/Rectangle528.png',
    type: 'Tablet',
    price: 350.00,
    weight: '500mg',
    cartQuantity: 1,
    description: '1 pack of Panadol(500mg) contains 8 units of 12 tablets.',
    constituents: 'Panadol',
    dispensedin: 'Packs',
    pcksize: '7 x 15 tablets(96)',
    productId: 'PRO67648856',
  ),
  Product(
    name: 'Ibuprofen',
    image: 'assets/images/Rectangle531.png',
    type: 'tablet',
    price: 350.00,
    weight: '400mg',
    cartQuantity: 1,
    description: '1 pack of Ibuprofen(400mg) contains 8 units of 12 tablets.',
    constituents: 'Ibuprofen',
    dispensedin: 'Packs',
    pcksize: '7 x 15 tablets(96)',
    productId: 'PRO12238856',
  ),
];

/// for adding food to cart
addtocartlist(Product food) {
  CartList.add(food);
}

//// for removing food from cart
removefromcartlist(Product food) {
  CartList.remove(food);
}
