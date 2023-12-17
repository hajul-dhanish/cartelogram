import '../../Env/base_config.dart';

var application = Environment().config!;

class ApiEndPoints {
  final String fetchInventory = "${application.productListing}/Productlisting";
}
