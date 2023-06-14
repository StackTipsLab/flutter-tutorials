import 'package:flutter/material.dart';
import 'models/multi_select_item.dart';
import 'models/product.dart';

class GridItemWidget extends StatelessWidget {
  const GridItemWidget({
    super.key,
    required this.item,
    required this.index,
  });

  final MultiSelectItem item;
  final int index;

  @override
  Widget build(BuildContext context) {
    Product product = item.value;
    Color textColor = item.selected ? Colors.white : Colors.black87;
    Color bgColor =
        item.selected ? Colors.green.shade500 : Colors.yellow.shade400;
    Color borderColor =
        item.selected ? Colors.green.shade800 : Colors.yellow.shade800;
    Icon icon = item.selected
        ? const Icon(Icons.remove_shopping_cart_outlined, color: Colors.white)
        : Icon(Icons.add_shopping_cart_outlined, color: Colors.yellow.shade900);

    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: borderColor, width: 2),
      ),
      child: Container(
        padding: const EdgeInsets.all(6),
        color: bgColor,
        child: ListTile(
          trailing: icon,
          title: Text(
            product.title,
            maxLines: 6,
            style: TextStyle(
              color: textColor,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
