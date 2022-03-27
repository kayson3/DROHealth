import 'package:badges/badges.dart';
import 'package:drohealth/global/colors.dart';

import 'package:drohealth/views/cart.dart';
import 'package:drohealth/views/category.dart';
import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
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
              Expanded(
                child: Container(
                  color: Colors.white70,
                  child: GridView.count(
                      //physics: BouncingScrollPhysics(),

                      crossAxisCount: 2,
                      crossAxisSpacing: 3.0,
                      children: [
                        GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          Category(type: 'Headache')));
                            },
                            child: Image.asset('assets/images/Group717.png')),
                        GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          Category(type: 'Supplements')));
                            },
                            child: Image.asset('assets/images/Group1098.png')),
                        GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          Category(type: 'Infants')));
                            },
                            child: Image.asset('assets/images/Group1099.png')),
                        GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          Category(type: 'Cough')));
                            },
                            child: Image.asset('assets/images/Group1100.png')),
                      ]),
                ),
              )
            ]));
  }
}
