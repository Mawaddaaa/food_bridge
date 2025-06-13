import 'package:get/get_rx/src/rx_types/rx_types.dart';

abstract class QuantityController {
  Rx<int?> get selectedQuantity;
  RxString get otherQuantity;
  RxString get quantityError;
  List<int> get quantities;

  void selectQuantity(int quantity);
  void clearSelection();
  bool validateQuantity();
}