import 'package:flutter/material.dart';
import 'package:flutter_learn/themes/theme.dart';
import 'package:go_router/go_router.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          scrollBehavior: const ScrollBehavior(),
          slivers: [
            SliverAppBar(
              leadingWidth: 100,
              collapsedHeight: 70,
              elevation: 0,
              scrolledUnderElevation: 0,
              expandedHeight: 350,
              leading: IconButton(
                padding: const EdgeInsets.all(15),
                onPressed: () => context.canPop()
                    ? GoRouter.of(context).pop()
                    : context.go('/'),
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
                )
              ],
              flexibleSpace: FlexableSpaceHeader(),
            ),
            SliverToBoxAdapter(
              child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                  child: Column(
                    children: [
                      _information(),
                      _images(),
                      _sizes(),
                      _description(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Reviews',
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
                    ],
                  )),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              sliver: SliverList.separated(
                  itemBuilder: (context, index) {
                    return _review(context);
                  },
                  separatorBuilder: (context, index) => const SizedBox(
                        height: 15,
                      ),
                  itemCount: 3),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 20,
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Ink(
        color: Theme.of(context).colorScheme.primary,
        height: 70,
        width: double.infinity,
        child: InkWell(
          onTap: () {},
          child: Container(
            alignment: Alignment.center,
            child: const Text('Add to cart',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w600)),
          ),
        ),
      ),
    );
  }
}

class FlexableSpaceHeader extends StatefulWidget {
  const FlexableSpaceHeader({super.key});

  @override
  State<FlexableSpaceHeader> createState() => _FlexableSpaceHeaderState();
}

class _FlexableSpaceHeaderState extends State<FlexableSpaceHeader> {
  late int _currentPage = 0;
  final PageController _controller = PageController();

  @override
  void initState() {
    super.initState();
    _currentPage = 0;
    _controller.addListener(() {
      setState(() {
        _currentPage = _controller.page!.toInt();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return FlexibleSpaceBar(
      collapseMode: CollapseMode.parallax,
      background: Stack(
        children: [
          PageView(
            controller: _controller,
            scrollBehavior: const ScrollBehavior(),
            scrollDirection: Axis.horizontal,
            children: [
              Image.network(
                'https://content.rezetstore.dk/sites/default/files/styles/product_display_teaser_mobile/public/PIM-images/nike/2307569/nike-tech-woven-jacket-cobblestone-black-2307569-v2-759048.png',
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  }
                  return Center(
                    child: Container(
                      color: Theme.of(context).colorScheme.surface,
                      child: const CircularProgressIndicator(),
                    ),
                  );
                },
              ),
              Image.network(
                'https://soccerstorecore.azureedge.net/0-0-68071.png',
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  }
                  return Center(
                    child: Container(
                      alignment: Alignment.center,
                      height: double.infinity,
                      width: double.infinity,
                      color: Theme.of(context).colorScheme.surface,
                      child: const CircularProgressIndicator(),
                    ),
                  );
                },
              ),
              Image.network(
                'https://w7.pngwing.com/pngs/901/701/png-transparent-hoodie-jacket-nike-clothing-polar-fleece-hooddy-sports-zipper-fashion-jersey.png',
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  }
                  return Center(
                    child: Container(
                      color: Theme.of(context).colorScheme.surface,
                      child: const CircularProgressIndicator(),
                    ),
                  );
                },
              ),
            ],
          ),
          Positioned(
              bottom: 20,
              left: 20,
              child: Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Theme.of(context).colorScheme.surface),
                  child: Text((_currentPage + 1).toString() + ' / ' + '3')))
        ],
      ),
    );
  }
}

Widget _information() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Men\'s Printed Pullover Hoodie',
            style: MyTextTheme().smallTextGray,
          ),
          const Text(
            'Nike Club Fleece',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
          )
        ],
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Price',
            style: MyTextTheme().smallTextGray,
          ),
          const Text(
            '\$120',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
          ),
        ],
      )
    ],
  );
}

Widget _images() {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 15),
    height: 75,
    child: ScrollConfiguration(
      behavior: const ScrollBehavior(),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        separatorBuilder: (context, index) {
          return const SizedBox(
            width: 10,
          );
        },
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(context).colorScheme.surface),
            child: Image.network(
              'https://soccerstorecore.azureedge.net/0-0-68071.png',
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                }
                return Container(
                  padding: const EdgeInsets.all(25),
                  width: 75,
                  child: const CircularProgressIndicator(),
                );
              },
            ),
          );
        },
      ),
    ),
  );
}

Widget _sizes() {
  final List<String> sizes = ['S', 'M', 'L', 'XL', '2XL'];

  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Size',
            style: MyTextTheme().smallTitle,
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              'Size Guide',
              style: MyTextTheme().smallTextGray,
            ),
          ),
        ],
      ),
      Container(
        margin: const EdgeInsets.only(top: 10),
        height: 75,
        child: ScrollConfiguration(
          behavior: const ScrollBehavior(),
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return InkWell(
                  borderRadius: BorderRadius.circular(10),
                  onTap: () {},
                  child: Ink(
                    width: 75,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Theme.of(context).colorScheme.surface),
                    child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          sizes[index],
                          style: const TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w700),
                        )),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  width: 10,
                );
              },
              itemCount: sizes.length),
        ),
      ),
    ],
  );
}

Widget _description() {
  return Padding(
    padding: const EdgeInsets.only(top: 15),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Description',
          style: MyTextTheme().smallTitle,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          'The Nike Throwback Pullover Hoodie is made from premium French terry fabric that blends a performance feel with...',
          style: MyTextTheme().defaultTextGray,
        )
      ],
    ),
  );
}

Widget _review(BuildContext context) {
  return Container(
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).colorScheme.surface),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://shutniks.com/wp-content/uploads/2020/04/paren_v_ochkah_13_15121137.jpg'),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Ronald Richards',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.schedule,
                          color: Theme.of(context).colorScheme.onBackground,
                          size: 15,
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        Text(
                          '13 Sep, 2020',
                          style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                              color:
                                  Theme.of(context).colorScheme.onBackground),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(children: [
                  const Text(
                    '4.8',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    'Rating',
                    style: TextStyle(
                      fontSize: 11,
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
                  ),
                ]),
                const Text('4/5'),
              ],
            )
          ],
        ),
        const SizedBox(
          height: 6,
        ),
        Text(
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque malesuada eget vitae amet...',
          style: MyTextTheme().defaultTextGray,
        )
      ],
    ),
  );
}
