import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/state_manager.dart';
import 'package:intl/intl.dart';

class QuatityAndWeight extends StatelessWidget {
  bool iskg;

  QuatityAndWeight({this.iskg = false});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuatityAndWeightController>(
      init: QuatityAndWeightController(iskg: iskg),
      builder: (controller) => Column(
        children: [
          Quatity(),
        ],
      ),
    );
  }
}

class Quatity extends StatelessWidget {
  var controller = Get.find<QuatityAndWeightController>();

  @override
  Widget build(BuildContext context) {
    var quantity = controller.quantity;
    var isKg = controller.iskg;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ElevatedButton(
          onPressed: () =>
              quantity > 1 ? controller.changeQuantity(quantity - 1) : null,
          child: Icon(Icons.remove),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(0),
            minimumSize: const Size(40, 40),
          ),
        ),
        Container(
            width: 48.0,
            padding: const EdgeInsets.all(8.0),
            child: Text(
              NumberFormat.decimalPattern().format(quantity) +
                  (isKg ? 'kg' : ""),
              textAlign: TextAlign.center,
              style:
                  const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            )),
        ElevatedButton(
          onPressed: () => controller.changeQuantity(quantity + 1),
          child: Icon(Icons.add),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(0),
            minimumSize: const Size(40, 40),
          ),
        ),
      ],
    );
  }
}

class QuatityAndWeightController extends GetxController {
  bool iskg;

  QuatityAndWeightController({required this.iskg});

  num quantity = 1;

  void changeQuantity(num value) {
    quantity = value;

    update();
  }
}
