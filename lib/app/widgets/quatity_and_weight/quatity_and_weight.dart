// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:app_hortifruti_pratico/app/widgets/quatity_and_weight/quantity_widget.dart';
import 'package:app_hortifruti_pratico/app/widgets/quatity_and_weight/weight_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

import 'quantity_and_weight_controller.dart';

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
          if (iskg) WeightWidget(),
        ],
      ),
    );
  }
}