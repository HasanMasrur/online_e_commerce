// this is tha main page . where it start.
import 'package:appsone/scoped_model/main.dart';
import 'package:appsone/widget/ui_elements/logout_title-defauld.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import '../widget/Products/allproduct.dart';
import '../widget/ui_elements/title_defauld.dart';


class ProductsPage extends StatefulWidget {
  final MainModel model;
  ProductsPage(this.model);
@override
  State<StatefulWidget> createState() {
  
    return _ProductsPage();
  }
}
class _ProductsPage extends State<ProductsPage>{


  Widget _buildSideDrawer(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            automaticallyImplyLeading: false,
            title: Text('Choose'),
          ),
          ListTile(
            leading: Icon(Icons.edit),
            title: Text('Manage Products'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/admin');
            },
          ),
          Divider(),
          Logoutpage(),
        ],
      ),
    );
  }
Widget buildProductList() {
  return ScopedModelDescendant(builder:  (BuildContext context,Widget child,MainModel model){
    Widget conten =Center(child: Text('No fount product'),);
    if(model.displayedProducts.length > 0 && !model.isLoading)
    {
     conten =Products();
    } else if(model.isLoading)
    {
      conten =Center(child: CircularProgressIndicator());
    }
    return RefreshIndicator( onRefresh: model.fetchProducts,child: conten,);
  },);
}
  @override
 initState(){
   widget.model.fetchProducts();
   super.initState();
 }
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _buildSideDrawer(context),
      appBar: AppBar(
        title: Text('EasyList'),
        actions: <Widget>[
          ScopedModelDescendant<MainModel>(
            builder: (BuildContext context, Widget child, MainModel model) {
              return IconButton(
                icon: Icon(model.displayFavoritesOnly
                    ? Icons.favorite
                    : Icons.favorite_border),
                onPressed: () {
                  model.toggleDisplayMode();
                },
              );
            },
          )
        ],
      ),
      body: buildProductList(),
    );
  }
}