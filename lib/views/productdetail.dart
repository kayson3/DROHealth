// ignore_for_file: non_constant_identifier_names

import 'package:badges/badges.dart';
import 'package:drohealth/global/colors.dart';
import 'package:drohealth/views/cart.dart';
import 'package:flutter/material.dart';
import 'package:drohealth/model/items.dart';

class Detail extends StatefulWidget {
  final Product property;

  const Detail({Key? key, required this.property}) : super(key: key);

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    Product product = widget.property;
    return Scaffold(
        backgroundColor: grey,
        body: Stack(
          children: [
            Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 140,
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(20),
                        image: const DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage('assets/images/frame.png'),
                        )),
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 15, right: 15),
                      child: Column(children: [
                        const SizedBox(
                          height: 60,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: const Icon(Icons.arrow_back_ios,
                                      color: white, size: 22)),
                              const Text('Pharmacy',
                                  style: TextStyle(
                                      color: white,
                                      fontSize: 22,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: 'ProximaNova')),
                              const Spacer(),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const Cart()));
                                },
                                child: Badge(
                                  badgeColor: Colors.orange,
                                  badgeContent: Container(
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.orange,
                                    ),
                                    child: const Text('',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600)),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 1.0,
                                    ),
                                    child: Image.asset(
                                        'assets/images/Group.png',
                                        height: 30,
                                        width: 25),
                                  ),
                                ),
                              )
                            ]),
                      ]),
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      children: [
                        Image.asset(widget.property.image!, height: 170),
                        Center(
                          child: Text(product.name!,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18)),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Center(
                          child: Text(product.type! + ' . ' + product.weight!,
                              style: const TextStyle(
                                  color: textgrey,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16)),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset('assets/images/Group319.png'),
                              Image.asset('assets/images/heart1.png'),
                            ]),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12),
                                  decoration: BoxDecoration(
                                      border:
                                          Border.all(color: textgrey, width: 1),
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          if (quantity > 1) {
                                            setState(() {
                                              quantity--;
                                              product.cartQuantity = quantity;
                                            });
                                          }
                                        },
                                        child: const Padding(
                                          padding: EdgeInsets.only(
                                              left: 15, right: 15),
                                          child: Text('-',
                                              style: TextStyle(
                                                fontSize: 25,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                              )),
                                        ),
                                      ),
                                      Text(quantity.toString(),
                                          style: const TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold,
                                          )),
                                      GestureDetector(
                                        onTap: () {
                                          if (quantity < 8) {
                                            setState(() {
                                              quantity++;
                                              product.cartQuantity = quantity;
                                            });
                                          }
                                        },
                                        child: const Padding(
                                          padding: EdgeInsets.only(
                                              left: 15,
                                              right: 15,
                                              top: 5,
                                              bottom: 5),
                                          child: Text('+',
                                              style: TextStyle(
                                                fontSize: 25,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                              )),
                                        ),
                                      ),
                                    ],
                                  )),
                              const SizedBox(
                                width: 14,
                              ),
                              const Text('Pack(s)',
                                  style: TextStyle(
                                      color: textgrey,
                                      fontSize: 17,
                                      fontFamily: 'ProximaNova')),
                              const Spacer(),
                              Text('₦' + product.price.toString(),
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18)),
                            ]),
                        const SizedBox(
                          height: 14,
                        ),
                        const Text('PRODUCT DETAILS',
                            style: TextStyle(
                                color: middleBlue,
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'ProximaNova')),
                        SizedBox(
                          height: 145,
                          child: GridView.count(
                              physics: const NeverScrollableScrollPhysics(),
                              padding: const EdgeInsets.all(0),
                              crossAxisCount: 2,
                              childAspectRatio: 3 / 1.1,
                              crossAxisSpacing: 8.0,
                              mainAxisSpacing: 3.0,
                              children: detail(context)),
                        ),
                        Text(product.description!,
                            style: const TextStyle(
                                color: textgrey,
                                fontWeight: FontWeight.w500,
                                fontSize: 16)),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text('Similar Products',
                            style: TextStyle(
                                color: textgrey,
                                fontSize: 23,
                                fontWeight: FontWeight.w700,
                                fontFamily: 'ProximaNova')),
                        const SizedBox(
                          height: 4,
                        ),
                        SizedBox(
                          height: 250,
                          child: ListView(
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              children: BuildProducts(context)),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 55,
                  ),
                ]),
            CartList.contains(product)
                ? GestureDetector(
                    onTap: () {
                      removefromcartlist(product);
                      setState(() {});
                      bottomSheet('removed', 'from');
                    },
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        margin: const EdgeInsets.only(
                            left: 30, right: 30, bottom: 8),
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 30),
                        decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [purpleGradientleft, purpleGradientright],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/Group.png',
                                height: 30, width: 25),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text(
                              'Remove from Cart',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                              ),
                              overflow: TextOverflow.visible,
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                : GestureDetector(
                    onTap: () {
                      addtocartlist(product);
                      setState(() {});
                      bottomSheet('added', "to");
                    },
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        margin: const EdgeInsets.only(
                            left: 30, right: 30, bottom: 8),
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 30),
                        decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [purpleGradientleft, purpleGradientright],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/Group.png',
                                height: 30, width: 25),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text(
                              'Add to Cart',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                              ),
                              overflow: TextOverflow.visible,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
          ],
        ));
  }

  List<Widget> detail(context) {
    Product product = widget.property;
    List<Widget> list = [
      Row(
        children: [
          Image.asset('assets/images/Vector2.png', height: 30, width: 25),
          const SizedBox(
            width: 10,
          ),
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'PACK SIZE',
                  style: TextStyle(
                    color: textgrey,
                    fontSize: 17,
                  ),
                  overflow: TextOverflow.visible,
                ),
                Text(product.pcksize!,
                    style: const TextStyle(
                        color: middleBlue,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'ProximaNova')),
              ])
        ],
      ),
      Row(
        children: [
          Image.asset('assets/images/Vector4.png', height: 30, width: 25),
          const SizedBox(
            width: 10,
          ),
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'PRODUCT ID',
                  style: TextStyle(
                    color: textgrey,
                    fontSize: 17,
                  ),
                  overflow: TextOverflow.visible,
                ),
                Text(product.productId!,
                    style: const TextStyle(
                        color: middleBlue,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'ProximaNova')),
              ])
        ],
      ),
      Row(
        children: [
          Image.asset('assets/images/Vector3.png', height: 30, width: 25),
          const SizedBox(
            width: 10,
          ),
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'CONSTITUENTS',
                  style: TextStyle(
                    color: textgrey,
                    fontSize: 17,
                  ),
                  overflow: TextOverflow.visible,
                ),
                Text(product.constituents!,
                    style: const TextStyle(
                        color: middleBlue,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'ProximaNova')),
              ])
        ],
      ),
      Row(
        children: [
          Image.asset('assets/images/dispense.png', height: 30, width: 25),
          const SizedBox(
            width: 10,
          ),
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'DISPENSED IN',
                  style: TextStyle(
                    color: textgrey,
                    fontSize: 17,
                  ),
                  overflow: TextOverflow.visible,
                ),
                Text(product.dispensedin!,
                    style: const TextStyle(
                        color: middleBlue,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'ProximaNova')),
              ])
        ],
      ),
    ];

    return list;
  }

  List<Widget> BuildProducts(context) {
    List<Widget> list = [];
    for (var i = 1; i < products.length; i++) {
      list.add(ProductsProperty(products[i], i, context));
      list.add(const SizedBox(width: 10));
    }
    return list;
  }

  Widget ProductsProperty(Product product, int index, context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => Detail(property: product)));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(product.image!),
          Text(product.name!,
              style: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.w500)),
          const SizedBox(
            height: 3,
          ),
          Text(product.type! + ' . ' + product.weight!,
              style: const TextStyle(
                  color: textgrey, fontWeight: FontWeight.w500)),
          const SizedBox(
            height: 3,
          ),
          Text('₦' + product.price.toString(),
              style: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  void bottomSheet(String action, String prep) {
    Product product = widget.property;
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        enableDrag: false,
        isDismissible: false,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        builder: (BuildContext context) {
          return Container(
              height: MediaQuery.of(context).size.height / 3,
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        product.name! +
                            ' has been sucessfuly $action $prep cart!',
                        style: const TextStyle(
                            fontSize: 17,
                            color: Colors.black,
                            fontWeight: FontWeight.w500)),
                    const SizedBox(
                      height: 25,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Cart()));
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2,
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 30),
                        decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [purpleGradientleft, purpleGradientright],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                            borderRadius: BorderRadius.circular(10)),
                        child: const Center(
                          child: Text(
                            'VIEW CART',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                            overflow: TextOverflow.visible,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2,
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 15),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: purpleGradientright, width: 2),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: const Center(
                          child: Text(
                            'CONTINUE SHOPPING',
                            style: TextStyle(
                              color: purpleGradientright,
                              fontSize: 17,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ]));
        });
  }
}
