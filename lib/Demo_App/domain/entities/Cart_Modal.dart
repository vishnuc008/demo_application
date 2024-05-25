import '../../data/remote/modals/response/product_Response_Modal.dart';

class CartModal {

  final ProductResponseModal productResponseModal;

  final int quantity;
 
  final double subtotal;

  CartModal(this.productResponseModal, this.quantity, this.subtotal);


}