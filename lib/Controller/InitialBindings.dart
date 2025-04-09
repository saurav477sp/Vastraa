import 'package:get/get.dart';
import 'package:vastraa/first.dart';

class Initialbindings extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies

    // this is for whole lifecycle throught the whole application

    // this is justfor an example below
    Get.put(First(), permanent: true);
  }
}
