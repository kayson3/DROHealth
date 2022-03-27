// ignore_for_file: non_constant_identifier_names

import 'package:drohealth/global/colors.dart';
import 'package:drohealth/model/items.dart';
import 'package:drohealth/views/cart.dart';
import 'package:drohealth/views/categories.dart';
import 'package:drohealth/views/category.dart';
import 'package:drohealth/views/productdetail.dart';
import 'package:drohealth/views/search.dart';
import 'package:flutter/material.dart';

class Pharmacy extends StatefulWidget {
  const Pharmacy({Key? key}) : super(key: key);

  @override
  _PharmacyState createState() => _PharmacyState();
}

class _PharmacyState extends State<Pharmacy> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grey,
      floatingActionButton: GestureDetector(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const Cart()));
        },
        child: Container(
            width: MediaQuery.of(context).size.width / 2.9,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
              gradient: LinearGradient(
                colors: [redGradientleft, redGradientright],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 4),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                const Text('Checkout',
                    style: TextStyle(
                        color: white,
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'ProximaNova')),
                Image.asset('assets/images/Group.png', height: 30, width: 25),
                const SizedBox(
                  width: 1,
                ),
                Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.orange,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Text(CartList.length.toString(),
                        style: const TextStyle(fontWeight: FontWeight.w600)),
                  ),
                )
              ]),
            )),
      ),
      bottomNavigationBar: Container(
        color: grey,
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset('assets/images/Groupp.png', height: 40, width: 40),
              Image.asset('assets/images/DoctorsInactive.png',
                  height: 40, width: 40),
              Image.asset('assets/images/PharmacyActive.png',
                  height: 40, width: 40),
              Image.asset('assets/images/CommunityInactive.png',
                  height: 40, width: 40),
              Image.asset('assets/images/Profile.png', height: 40, width: 40),
            ],
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 180,
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(20),
                image: const DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('assets/images/fram1.png'),
                )),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Column(children: [
                const SizedBox(
                  height: 40,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Pharmacy',
                          style: TextStyle(
                              color: white,
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'ProximaNova')),
                      Image.asset(
                        'assets/images/Group1623.png',
                        height: 50,
                        width: 50,
                      ),
                    ]),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white24,
                      borderRadius: BorderRadius.circular(16)),
                  child: Theme(
                    data: ThemeData(
                        primaryColor: Colors.white10,
                        textSelectionTheme:
                            const TextSelectionThemeData(cursorColor: white)),
                    child: TextFormField(
                        controller: searchController,
                        onFieldSubmitted: (val) async {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Search(
                                        txt: searchController.text,
                                      )));
                        },
                        textCapitalization: TextCapitalization.sentences,
                        style: const TextStyle(color: white),
                        decoration: const InputDecoration(
                          hintText: 'Search',
                          prefixIcon: Icon(Icons.search, color: white),
                          hintStyle: TextStyle(color: white),
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        )),
                  ),
                ),
              ]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(children: [
              Image.asset(
                'assets/images/Group1083.png',
                height: 50,
                width: 30,
              ),
              const Text('Delivery in',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w500)),
              const SizedBox(
                width: 4,
              ),
              const Text('Lagos, NG',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold)),
            ]),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              color: Colors.white70,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
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
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const Categories()));
                            },
                            child: const Text('VIEW ALL',
                                style: TextStyle(
                                    color: purpleGradientleft,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'ProximaNova')),
                          ),
                        ]),
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
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            Category(type: 'Headache')));
                              },
                              child: Container(
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                  image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/Group717.png'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          AspectRatio(
                            aspectRatio: 3 / 2,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            Category(type: 'Supplements')));
                              },
                              child: Container(
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/Group1098.png'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          AspectRatio(
                            aspectRatio: 3 / 2,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            Category(type: 'Infants')));
                              },
                              child: Container(
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/Group1099.png'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          AspectRatio(
                            aspectRatio: 3 / 2,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            Category(type: 'Cough')));
                              },
                              child: Container(
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/Group1100.png'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const Text('SUGGESTIONS',
                        style: TextStyle(
                            color: textgrey,
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'ProximaNova')),
                    Expanded(
                        child: GridView.count(
                            physics: const BouncingScrollPhysics(),
                            padding: const EdgeInsets.only(
                                left: 15.0, right: 15.0, top: 20),
                            crossAxisCount: 2,
                            childAspectRatio: 2 / 2.5,
                            crossAxisSpacing: 8.0,
                            mainAxisSpacing: 7.0,
                            children: BuildProducts(context)))
                  ]),
            ),
          )
        ],
      ),
    );
  }

  List<Widget> BuildProducts(context) {
    List<Widget> list = [];
    for (var i = 0; i < products.length; i++) {
      list.add(ProductsProperty(products[i], i, context));
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
