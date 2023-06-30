import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn/components/myTextField.dart';
import 'package:flutter_learn/components/productCard.dart';
import 'package:flutter_learn/models/Products.dart';
import 'package:flutter_learn/services/auth_service.dart';
import 'package:flutter_learn/themes/theme.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final User? user = FirebaseAuth.instance.currentUser;

  void signOut() async {
    try {
      await AuthService().signOut();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: ScrollConfiguration(
            behavior: ScrollBehavior(),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Header(),
                  ChooseBrand(),
                  NewArravial(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello',
              style: MyTextTheme().title,
            ),
            Text(
              'Welcome to Laza.',
              style: MyTextTheme().defaultTextGray,
            ),
          ],
        ),
        Container(
          margin: const EdgeInsets.only(top: 20),
          height: 60,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Expanded(
                child: MyTextField(
                  icon: Icons.search_rounded,
                  hintText: 'Search...',
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 10),
                child: InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(10),
                  child: Ink(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Theme.of(context).colorScheme.primary),
                    child: const Icon(
                      Icons.tune_rounded,
                      size: 35,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}

class ChooseBrand extends StatelessWidget {
  const ChooseBrand({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 15),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Choose brand',
                style: MyTextTheme().smallTitle,
              ),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    'View all',
                    style: MyTextTheme().smallTextGray,
                  ))
            ],
          ),
          SizedBox(
            height: 50,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: 11,
                separatorBuilder: (_, __) => const SizedBox(
                      width: 10,
                    ),
                itemBuilder: (context, index) {
                  return Ink(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Theme.of(context).colorScheme.surface,
                    ),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(10),
                      onTap: () {},
                      child: Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          'Adidas',
                          style: MyTextTheme().defaultText,
                        ),
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}

class NewArravial extends StatefulWidget {
  const NewArravial({super.key});

  @override
  State<NewArravial> createState() => _NewArravialState();
}

class _NewArravialState extends State<NewArravial> {
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
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'New Arravial',
              style: MyTextTheme().smallTitle,
            ),
            TextButton(
                onPressed: () {},
                child: Text(
                  'View all',
                  style: MyTextTheme().smallTextGray,
                ))
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        FutureBuilder(
            future: products,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: snapshot.data!.products.length,
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
    );
  }
}
