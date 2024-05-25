

import '../remote/modals/response/product_Response_Modal.dart';

abstract class AppRepoSitory {
    Future<List<ProductResponseModal>> getProductS();
}
