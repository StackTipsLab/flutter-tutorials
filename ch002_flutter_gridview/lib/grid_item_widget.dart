import 'package:flutter/material.dart';
import 'models/product.dart';

class GridItemWidget extends StatelessWidget {
  const GridItemWidget({
    super.key,
    required this.product,
    required this.index,
  });

  final Product product;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        // side: BorderSide(color: Colors.green.shade800, width: 2),
      ),
      color: Colors.green.shade100,
      clipBehavior: Clip.hardEdge,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          FadeInImage(
            fit: BoxFit.cover,
            height: 120,
            width: double.infinity,
            placeholder: const AssetImage('assets/images/loading.gif'),
            image: NetworkImage(product.image),
            imageErrorBuilder: (context, error, stackTrace) {
              return Image.asset('assets/images/fallback.jpg');
            },
          ),
          Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [

                  Text(
                    product.title,
                    maxLines: 3,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.black87,
                      height: 1.3,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    '${product.price}£',
                    maxLines: 3,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.green.shade900,
                      height: 1.3,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
