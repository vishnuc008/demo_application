import 'package:demo_application/Demo_App/domain/entities/Cart_Modal.dart';

class OrderModal {
  final CartModal cartModal;
  final DateTime orderTime;

  OrderModal(this.cartModal,this.orderTime);
}
