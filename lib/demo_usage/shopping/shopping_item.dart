import 'package:flutter/material.dart';

// 商城的产品信息
class Product {
  const Product({this.name});

  final String name;
}

// 购入车发生改变时的回调
typedef void CartChangedCallback(Product product, bool inCart);

// 商品列表的子项
class ShoppingListItem extends StatelessWidget {
  final Product product;
  final bool inCart;
  final CartChangedCallback onCartChanged;

  ShoppingListItem({Product product, this.inCart, this.onCartChanged})
      : product = product,
        super(key: new ObjectKey(product));

  // 购物清单的商品状态变化时，颜色的变化
  Color _getColor(BuildContext context) {
    return inCart ? Colors.black54 : Theme.of(context).primaryColor;
  }

  // 购物清单的商品状态变化时，字体样式的变化
  TextStyle _getTextStyle(BuildContext context) {
    if (!inCart) return null;
    return new TextStyle(
      color: Colors.black54,
      decoration: TextDecoration.lineThrough,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new ListTile(
      onTap: () {
        onCartChanged(product, !inCart);
      },
      leading: new CircleAvatar(
        backgroundColor: _getColor(context),
        child: new Text(product.name[0]), // 商品名第一个字为一个原型容器的内容
      ),
      title: new Text(
        product.name,
        style: _getTextStyle(context),
      ),
    );
  }
}
