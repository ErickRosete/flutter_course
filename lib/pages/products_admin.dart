import 'package:flutter/material.dart';

import './product_form.dart';
import './product_list.dart';
import '../models/product.dart';

class ProductAdminPage extends StatelessWidget {
  final Function addProduct;
  final Function updateProduct;
  final Function deleteProduct;
  final List<Product> products;

  ProductAdminPage(this.addProduct, this.updateProduct, this.deleteProduct, this.products);

  Widget _buildSideDrawer(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            automaticallyImplyLeading: false,
            title: Text("Choose"),
          ),
          ListTile(
            leading: Icon(Icons.shop),
            title: Text("Products list"),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/products');
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: _buildSideDrawer(context),
        appBar: AppBar(
          title: Text('Product Manager'),
          bottom: TabBar(tabs: <Widget>[
            Tab(
              icon: Icon(Icons.create),
              text: 'Create Product',
            ),
            Tab(
              icon: Icon(Icons.list),
              text: 'My Products',
            ),
          ]),
        ),
        // body: ProductManager(startingProduct:'Food Tester')
        body: TabBarView(
          children: <Widget>[
            ProductFormPage(addProduct : addProduct),
            ProductListPage(products, updateProduct, deleteProduct),
          ],
        ),
      ),
    );
  }
}
