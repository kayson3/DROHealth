// ignore_for_file: non_constant_identifier_names

import 'package:badges/badges.dart';
import 'package:drohealth/global/colors.dart';
import 'package:drohealth/model/items.dart';
import 'package:drohealth/views/cart.dart';
import 'package:drohealth/views/productdetail.dart';
import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({Key? key, required this.txt}) : super(key: key);
  final String txt;

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final snackBar = const SnackBar(
      content: Text("Go to home page to search"),
      duration: Duration(milliseconds: 1700));

  bool empty = false;

  TextEditingController searchControllerr = TextEditingController();

  @override
  void initState() {
    List<Widget> list = [];
    for (var i = 0; i < products.length; i++) {
      if (products[i].name!.contains(widget.txt)) {
        list.add(Hero(
            tag: products[i].image ?? '',
            child: ProductsProperty(products[i], i, context)));
      }
    }
    if (list.isEmpty) {
      setState(() {
        empty = true;
      });
    }
    super.initState();
  }

  @override
  void dispose() {
    setState(() {
      empty = false;
    });
    searchControllerr.dispose();
    super.dispose();
  }

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
              padding: const EdgeInsets.all(2),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(50),
                ),
                gradient: LinearGradient(
                  colors: [redGradientleft, redGradientright],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
              child: Badge(
                badgeColor: Colors.orange,
                badgeContent: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.orange,
                  ),
                  child: Text(CartList.length.toString(),
                      style: const TextStyle(fontWeight: FontWeight.w600)),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5.0, vertical: 4),
                  child: Image.asset('assets/images/Group.png',
                      height: 30, width: 25),
                ),
              )),
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
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: Column(children: [
                    const SizedBox(
                      height: 40,
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
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
                            textSelectionTheme: const TextSelectionThemeData(
                                cursorColor: white)),
                        child: TextFormField(
                            /*onTap: () {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            },*/
                            //readOnly: true,
                            onFieldSubmitted: (val) async {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Search(
                                            txt: val,
                                          )));
                            },
                            style: const TextStyle(color: white),
                            decoration: InputDecoration(
                              hintText: widget.txt,
                              prefixIcon:
                                  const Icon(Icons.search, color: white),
                              hintStyle: const TextStyle(color: white),
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                            )),
                      ),
                    ),
                  ]),
                ),
              ),
              !empty
                  ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(children: [
                        Image.asset(
                          'assets/images/Group1083.png',
                          height: 50,
                          width: 30,
                        ),
                        const Text('Delivery in',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500)),
                        const SizedBox(
                          width: 4,
                        ),
                        const Text('Lagos, NG',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                      ]),
                    )
                  : const SizedBox(),
              empty
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/images/a.png',
                            width: MediaQuery.of(context).size.width),
                        Text('No results found for  "${widget.txt}"',
                            style: const TextStyle(fontSize: 20)),
                      ],
                    )
                  : Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        color: Colors.white70,
                        child: GridView.count(
                            //physics: BouncingScrollPhysics(),
                            childAspectRatio: 1.6 / 2,
                            crossAxisCount: 2,
                            crossAxisSpacing: 10.0,
                            mainAxisSpacing: 10.0,
                            children: BuildProducts(context)),
                      ),
                    )
            ]));
  }

  List<Widget> BuildProducts(context) {
    List<Widget> list = [];
    for (var i = 0; i < products.length; i++) {
      if (products[i].name!.contains(widget.txt)) {
        list.add(Hero(
            tag: products[i].image ?? '',
            child: ProductsProperty(products[i], i, context)));
      }
    } //.then((){});
    if (list.isEmpty) {}
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
          SizedBox(
            height: 90,
            width: 150,
            child: Image.asset(product.image!),
          ),
          Text(product.name!,
              style: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.w500)),
          const SizedBox(
            height: 1,
          ),
          Text(product.type! + ' . ' + product.weight!,
              style: const TextStyle(
                  color: textgrey, fontWeight: FontWeight.w500)),
          const SizedBox(
            height: 1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('₦' + product.price.toString(),
                  style: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold)),
              Image.asset(
                'assets/images/heart1.png',
                height: 30,
              ),
            ],
          ),
          const SizedBox(
            height: 2,
          ),
          CartList.contains(product)
              ? GestureDetector(
                  onTap: () {
                    removefromcartlist(product);
                    setState(() {});
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 7, horizontal: 5),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black45, width: 1),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: const Center(
                      child: Text(
                        'REMOVE',
                        style: TextStyle(
                            color: Colors.black45,
                            fontSize: 17,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                )
              : GestureDetector(
                  onTap: () {
                    addtocartlist(product);
                    setState(() {});
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 7, horizontal: 5),
                    decoration: BoxDecoration(
                        border: Border.all(color: purple, width: 1),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: const Center(
                      child: Text(
                        'ADD TO CART',
                        style: TextStyle(
                            color: purple,
                            fontSize: 17,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
