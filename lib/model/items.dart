import 'package:flutter/material.dart';

class Product {
  final String? name;
  final String? image;
  final String? description;
  final int? price;

  Product({
    required this.name,
    required this.image,
    required this.description,
    required this.price,
  });
}

List<Product> CartList = [];

final List<Product> foods = [
  Product(
    name: 'Chicken',
    image: 'assets/images/Group1153.png',
    description:
        'Chicken is a type of bird in the family of gallinaceous birds. It is a domesticated species and is the most widely domesticated bird in the world.',
    price: 100,
  ),
  Product(
    name: 'Fish',
    image: 'assets/jollofrice.jpg',
    description:
        'Fish are a diverse and widespread group of aquatic, gill-bearing aquatic craniate animals. They range in size from very small, such as the carp, to very large, such as the Great White shark.',
    price: 200,
  ),
  Product(
    name: 'Cake2',
    image: 'assets/cake2.jpg',
    description:
        'Cake is a type of bird in the family of gallinaceous birds. It is a domesticated species and is the most widely domesticated bird in the world.',
    price: 300,
  ),
  Product(
    name: 'Chicken',
    image: 'assets/chicken.jpg',
    description:
        'Chicken is a type of bird in the family of gallinaceous birds. It is a domesticated species and is the most widely domesticated bird in the world.',
    price: 400,
  ),
  Product(
    name: 'Roll',
    image: 'assets/roll.jpg',
    description:
        'Roll is a type of bird in the family of gallinaceous birds. It is a domesticated species and is the most widely domesticated bird in the world.',
    price: 500,
  ),
  Product(
    name: 'Rice',
    image: 'assets/rice.png',
    description:
        'Rice is a type of bird in the family of gallinaceous birds. It is a domesticated species and is the most widely domesticated bird in the world.',
    price: 600,
  ),
  Product(
    name: 'Snacks',
    image: 'assets/snacks.jpg',
    description: 'Sugar is a type',
    price: 600,
  ),
  Product(
    name: 'Pizza',
    image: 'assets/pizza.jpeg',
    description:
        'pizza are a diverse and widespread group of aquatic, gill-bearing aquatic craniate animals. They range in size from very small, such as the carp, to very large, such as the Great White shark.',
    price: 700,
  ),
  Product(
    name: 'Fufu',
    image: 'assets/fufu.jpg',
    description:
        'fufu are a diverse and widespread group of aquatic, gill-bearing aquatic craniate animals. They range in size from very small, such as the carp, to very large, such as the Great White shark.',
    price: 300,
  ),
  Product(
    name: 'Pie',
    image: 'assets/pie.jpg',
    description:
        'pie are a diverse and widespread group of aquatic, gill-bearing aquatic craniate animals. They range in size from very small, such as the carp, to very large, such as the Great White shark.',
    price: 200,
  ),
  Product(
    name: 'Noodles',
    image: 'assets/noodles.jpeg',
    description:
        'noodles are a diverse and widespread group of aquatic, gill-bearing aquatic craniate animals. They range in size from very small, such as the carp, to very large, such as the Great White shark.',
    price: 300,
  ),
  Product(
    name: 'Ofada',
    image: 'assets/ofada.jpg',
    description:
        'Ofada are a diverse and widespread group of aquatic, gill-bearing aquatic craniate animals. They range in size from very small, such as the carp, to very large, such as the Great White shark.',
    price: 200,
  ),
  Product(
    name: 'sandwish',
    image: 'assets/sandwish.jpg',
    description:
        'sandwish are a diverse and widespread group of aquatic, gill-bearing aquatic craniate animals. They range in size from very small, such as the carp, to very large, such as the Great White shark.',
    price: 200,
  ),
];

addfood(Product food) {
  foods.add(food);
}

removefood(Product food) {
  foods.remove(food);
}

/// for adding food to cart
addtocartlist(Product food) {
  CartList.add(food);
}

//// for removing food from cart
removefromcartlist(Product food) {
  CartList.remove(food);
}
