import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_learn/components/productCard.dart';
import 'package:flutter_learn/models/Products.dart';
import 'package:flutter_learn/themes/theme.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;

class WishListPage extends StatelessWidget {
  const WishListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Wishlist'),
          leadingWidth: 100,
          leading: IconButton(
            padding: const EdgeInsets.all(15),
            onPressed: () =>
                context.canPop() ? GoRouter.of(context).pop() : context.go('/'),
            icon: Icon(
              Icons.arrow_back,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
          actions: [
            Container(
              margin: const EdgeInsets.only(right: 20),
              child: IconButton(
                  padding: const EdgeInsets.all(15),
                  onPressed: () {},
                  icon: Icon(
                    Icons.local_mall_outlined,
                    color: Theme.of(context).colorScheme.onSurface,
                  )),
            ),
          ],
        ),
        body: WishListBody());
  }
}

class WishListBody extends StatefulWidget {
  const WishListBody({super.key});

  @override
  State<WishListBody> createState() => _WishListBodyState();
}

class _WishListBodyState extends State<WishListBody> {
  late Future<Products> products;

  Future<Products> getProducts() async {
    final response =
        await http.get(Uri.parse('https://dummyjson.com/products'));

    if (response.statusCode == 200) {
      return Products.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Something went wrong');
    }
  }

  @override
  void initState() {
    super.initState();
    products = getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: ScrollBehavior(),
      child: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '364 items',
                  style: MyTextTheme().smallTitle,
                ),
                Text(
                  'in wishlist',
                  style: MyTextTheme().defaultTextGray,
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            FutureBuilder(
                future: products,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: snapshot.data!.products.length,
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: (1 / 1.64),
                        mainAxisSpacing: 15,
                        crossAxisSpacing: 15,
                        crossAxisCount: 2,
                      ),
                      itemBuilder: ((context, index) {
                        return InkWell(
                          borderRadius: BorderRadius.circular(15),
                          onTap: () => context.push('/product/1'),
                          child: ProductCard(
                            image: snapshot.data!.products[index].images[0],
                            title: snapshot.data!.products[index].title,
                            price: snapshot.data!.products[index].price,
                          ),
                        );
                      }),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                        child: Text(
                      'Something went wrong...',
                      style: MyTextTheme().smallTitle,
                    ));
                  }

                  return const Center(child: CircularProgressIndicator());
                }),
          ],
        ),
      ),
    );
  }
}
