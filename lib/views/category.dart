// ignore_for_file: non_constant_identifier_names, must_be_immutable

import 'package:badges/badges.dart';
import 'package:drohealth/global/colors.dart';
import 'package:drohealth/model/items.dart';
import 'package:drohealth/views/cart.dart';
import 'package:drohealth/views/categories.dart';
import 'package:drohealth/views/productdetail.dart';
import 'package:flutter/material.dart';

class Category extends StatefulWidget {
  Category({Key? key, required this.type}) : super(key: key);
  String type;

  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: grey,
        body: Column(
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
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: Column(children: [
                    const SizedBox(
                      height: 60,
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.arrow_back_ios,
                              color: white, size: 22)),
                      const Text('Categories',
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
                                style: TextStyle(fontWeight: FontWeight.w600)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 1.0,
                            ),
                            child: Image.asset('assets/images/Group.png',
                                height: 30, width: 25),
                          ),
                        ),
                      )
                    ]),
                  ]),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('CATEGORIES',
                          style: TextStyle(
                              color: textgrey,
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'ProximaNova')),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Categories()));
                        },
                        child: const Text('VIEW ALL',
                            style: TextStyle(
                                color: purpleGradientleft,
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'ProximaNova')),
                      ),
                    ]),
              ),
              const SizedBox(
                height: 7,
              ),
              SizedBox(
                height: 100,
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  children: [
                    AspectRatio(
                      aspectRatio: 3 / 2,
                      child: GestureDetector(
                        onTap: widget.type != 'Headache'
                            ? () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            Category(type: 'Headache')));
                              }
                            : null,
                        child: Container(
                          decoration: BoxDecoration(
                            boxShadow: widget.type == 'Headache' ? [] : [],
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10),
                            ),
                            image: const DecorationImage(
                              image: AssetImage('assets/images/Group717.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                    AspectRatio(
                      aspectRatio: 3 / 2,
                      child: GestureDetector(
                        onTap: widget.type != 'Supplements'
                            ? () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            Category(type: 'Supplements')));
                              }
                            : null,
                        child: Container(
                          decoration: BoxDecoration(
                            boxShadow: widget.type == 'Supplements' ? [] : [],
                            image: const DecorationImage(
                              image: AssetImage('assets/images/Group1098.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                    AspectRatio(
                      aspectRatio: 3 / 2,
                      child: GestureDetector(
                        onTap: widget.type != 'Infants'
                            ? () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            Category(type: 'Infants')));
                              }
                            : null,
                        child: Container(
                          decoration: BoxDecoration(
                            boxShadow: widget.type == 'Infants' ? [] : [],
                            image: const DecorationImage(
                              image: AssetImage('assets/images/Group1099.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                    AspectRatio(
                      aspectRatio: 3 / 2,
                      child: GestureDetector(
                        onTap: widget.type != 'Cough'
                            ? () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            Category(type: 'Cough')));
                              }
                            : null,
                        child: Container(
                          decoration: BoxDecoration(
                            boxShadow: widget.type == 'Cough' ? [] : [],
                            image: const DecorationImage(
                              image: AssetImage('assets/images/Group1100.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 7,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(widget.type.toUpperCase(),
                    style: const TextStyle(
                        color: textgrey,
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'ProximaNova')),
              ),
              Expanded(
                  child: GridView.count(
                      //physics: BouncingScrollPhysics(),
                      padding: const EdgeInsets.only(
                          left: 15.0, right: 15.0, top: 20),
                      crossAxisCount: 2,
                      childAspectRatio: 2 / 2.5,
                      crossAxisSpacing: 8.0,
                      mainAxisSpacing: 10.0,
                      children: BuildProducts(context)))
            ]));
  }

  List<Widget> BuildProducts(context) {
    List<Widget> list = [];
    if (widget.type == 'Headache') {
      for (var i = 0; i < 1; i++) {
        list.add(ProductsProperty(products[i], i, context));
      }
    } else if (widget.type == 'Supplements') {
      for (var i = 0; i < products.length; i++) {
        list.add(ProductsProperty(products[i], i, context));
      }
    } else if (widget.type == 'Infants') {
      for (var i = 0; i < 3; i++) {
        list.add(ProductsProperty(products[i], i, context));
      }
    } else {
      for (var i = 0; i < 4; i++) {
        list.add(ProductsProperty(products[i], i, context));
      }
    }

    return list;
  }

  Widget ProductsProperty(Product product, int index, context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
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
}
