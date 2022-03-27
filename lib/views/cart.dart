// ignore_for_file: non_constant_identifier_names

import 'package:drohealth/global/colors.dart';
import 'package:drohealth/model/items.dart';
import 'package:drohealth/views/productdetail.dart';

import 'package:flutter/material.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  double totalprice = 0;
  @override
  Widget build(BuildContext context) {
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
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 15),
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
                              Image.asset(
                                'assets/images/Group.png',
                                height: 50,
                                width: 50,
                              ),
                              const Text('Cart',
                                  style: TextStyle(
                                      color: white,
                                      fontSize: 22,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: 'ProximaNova')),
                            ]),
                      ]),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      color: Colors.white70,
                      child: ListView(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        children: BuildProducts(context),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                ]),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                  height: 50,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        bottom: 10.0, left: 15, right: 15),
                    child: Row(
                      children: [
                        const Text(
                          'Total: ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        Text(
                          '₦' + totalprice.toString(),
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 2, horizontal: 30),
                            decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: [
                                    purpleGradientleft,
                                    purpleGradientright
                                  ],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                ),
                                borderRadius: BorderRadius.circular(10)),
                            child: const Center(
                              child: Text(
                                'CHECKOUT',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                ),
                                overflow: TextOverflow.visible,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
            ),
          ],
        ));
  }

  List<Widget> BuildProducts(context) {
    List<Widget> list = [];

    totalprice = 0;
    for (var i = 0; i < CartList.length; i++) {
      list.add(Hero(
          tag: CartList[i].image ?? '',
          child: ProductsProperty(CartList[i], i, context)));

      totalprice = totalprice + (CartList[i].price! * CartList[i].cartQuantity);
      setState(() {});
    }

    if (list.isEmpty) {
      list.add(const Center(child: Text('Your Cart is empty')));
    }

    return list;
  }

  Widget ProductsProperty(Product product, int index, context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => Detail(property: product)));
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(product.image!, height: 100, width: 100),
          const SizedBox(
            width: 10,
          ),
          Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Text(product.name!,
                    style: const TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w600)),
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
              ]),
          const Spacer(),
          Column(children: [
            GestureDetector(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                    border: Border.all(color: grey, width: 2),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: DropdownButton<int>(
                  style: const TextStyle(
                    color: textgrey,
                  ),
                  value: product.cartQuantity,
                  /*hint: Text(product.cartQuantity.toString(),
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                      )),*/
                  icon: const Icon(Icons.keyboard_arrow_down_sharp,
                      color: purple),
                  items: <int>[1, 2, 3, 4, 5, 6, 7, 8].map((int value) {
                    return DropdownMenuItem<int>(
                        value: value,
                        child: Text(
                          value.toString(),
                          style: const TextStyle(
                            color: textgrey,
                            fontSize: 17,
                          ),
                        ));
                  }).toList(),
                  onChanged: (value) {
                    product.cartQuantity = value!;
                    setState(() {});
                  },
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                removefromcartlist(product);
                setState(() {});
              },
              child: Row(children: [
                Image.asset(
                  'assets/images/Group1153.png',
                  height: 50,
                  width: 30,
                ),
                const SizedBox(
                  width: 3,
                ),
                const Text('Remove',
                    style: TextStyle(
                      color: textgrey,
                    )),
              ]),
            )
          ]),
        ],
      ),
    );
  }
}
