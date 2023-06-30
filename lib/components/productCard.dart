import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String image;
  final String title;
  final int price;
  const ProductCard(
      {super.key,
      required this.image,
      required this.title,
      required this.price});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(children: [
          Ink(
            height: 257,
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(15)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                image,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  }
                  return SizedBox(
                    height: 200,
                    width: double.infinity,
                    child: Container(
                        alignment: Alignment.center,
                        height: 50,
                        width: 50,
                        child: const CircularProgressIndicator()),
                  );
                },
              ),
            ),
          ),
          Positioned(
            right: 0,
            child: IconButton(
              // isSelected: true,
              selectedIcon: const Icon(
                Icons.favorite_rounded,
                color: Colors.red,
              ),
              onPressed: () {},
              icon: const Icon(Icons.favorite_outline_rounded),
            ),
          ),
        ]),
        const SizedBox(
          height: 10,
        ),
        Text(
          '$title',
          style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500),
        ),
        Text(
          '\$ $price',
          style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
        )
      ],
    );
  }
}
