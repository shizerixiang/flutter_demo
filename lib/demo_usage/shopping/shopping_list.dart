import 'package:flutter/material.dart';
import 'shopping_item.dart';

// 购物列表
class ShoppingList extends StatefulWidget {
  ShoppingList({Key key, this.products}) : super(key: key);
  final List<Product> products;

  @override
  State<StatefulWidget> createState() => new _ShoppingListState();
}

// 购物列表状态
class _ShoppingListState extends State<ShoppingList> {
  Set<Product> _shoppingCart = new Set<Product>();

  void _onCartChanged(Product product, bool inCart) {
    setState(() {
      if (inCart)
        _shoppingCart.add(product);
      else
        _shoppingCart.remove(product);
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('购物清单'),
      ),
      body: new ListView(
        children: widget.products.map((Product product) {
          return new ShoppingListItem(
            product: product,
            inCart: _shoppingCart.contains(product),
            onCartChanged: _onCartChanged,
          );
        }).toList(),
      ),
    );
  }
}

// 产品示例
final List<Product> kProducts = <Product>[
  new Product(name: '小黄书'),
  new Product(name: '小黄碟'),
  new Product(name: '大保健'),
];
