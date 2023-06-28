import 'package:flutter/material.dart';
import 'package:flutter_learn/components/productCard.dart';
import 'package:flutter_learn/themes/theme.dart';
import 'package:go_router/go_router.dart';

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
        body: _body(context));
  }
}

class WishListBody extends StatelessWidget {
  const WishListBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

Widget _body(BuildContext context) {
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
          GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 10,
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: (1 / 1.64),
                mainAxisSpacing: 15,
                crossAxisSpacing: 15,
                crossAxisCount: 2,
              ),
              itemBuilder: ((context, index) {
                return InkWell(
                  borderRadius: BorderRadius.circular(10),
                  onTap: () => context.push('/product/1'),
                  child: ProductCard(),
                );
              }))
        ],
      ),
    ),
  );
}
