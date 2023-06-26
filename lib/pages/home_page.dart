import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn/components/myTextField.dart';
import 'package:flutter_learn/services/auth_service.dart';
import 'package:flutter_learn/themes/theme.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

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
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(
      //     'Home',
      //     style: Theme.of(context).textTheme.titleSmall,
      //   ),
      //   centerTitle: true,
      // ),
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 20, right: 20),
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
      bottomNavigationBar: GNav(
        gap: 15,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        color: Theme.of(context).colorScheme.onBackground,
        activeColor: Theme.of(context).colorScheme.primary,
        rippleColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
        tabs: const [
          GButton(
            icon: Icons.home_outlined,
            text: 'Home',
          ),
          GButton(
            icon: Icons.favorite_outline_rounded,
            text: 'WishList',
          ),
          GButton(
            icon: Icons.local_mall_outlined,
            text: 'Cart',
          ),
          GButton(
            icon: Icons.person_outline_rounded,
            text: 'Profile',
          ),
        ],
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
                    padding: EdgeInsets.all(10),
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

class NewArravial extends StatelessWidget {
  const NewArravial({super.key});

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
        MasonryGridView.count(
          physics: const NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: 10,
          crossAxisCount: 2,
          mainAxisSpacing: 15,
          crossAxisSpacing: 15,
          itemBuilder: (context, index) {
            return InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: () {},
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surface,
                        borderRadius: BorderRadius.circular(15)),
                    child: Image.network(
                        'https://content.rezetstore.dk/sites/default/files/styles/product_display_teaser_mobile/public/PIM-images/nike/2307569/nike-tech-woven-jacket-cobblestone-black-2307569-v2-759048.png'),
                  ),
                  const Text(
                    'Nike Sportswear Club Fleece',
                    style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500),
                  ),
                  const Text(
                    '\$99',
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                  )
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
