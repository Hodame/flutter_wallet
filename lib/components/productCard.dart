import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 257,
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(15)),
          child: Image.network(
            'https://content.rezetstore.dk/sites/default/files/styles/product_display_teaser_mobile/public/PIM-images/nike/2307569/nike-tech-woven-jacket-cobblestone-black-2307569-v2-759048.png', fit: BoxFit.cover,
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
        const SizedBox(
          height: 10,
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
    );
  }
}
