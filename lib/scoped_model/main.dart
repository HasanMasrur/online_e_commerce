import 'package:appsone/scoped_model/connected_product.dart';
import 'package:scoped_model/scoped_model.dart';

class MainModel extends Model with ConnectedProductsModel, UserModel, ProductsModel ,UtilityModel{
}

