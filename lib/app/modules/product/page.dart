import 'package:app_hortifruti_pratico/app/modules/product/controller.dart';
import 'package:app_hortifruti_pratico/app/widgets/quatity_and_weight.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transparent_image/transparent_image.dart';

class ProductPage extends GetView<ProductController> {
  @override
  Widget build(BuildContext context) {
    var product = controller.product.value!;

    return Scaffold(
        appBar: AppBar(title: Text(product.name)),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: Column(children: [
            if (product.image.isNotEmpty)
              Align(
                child: Container(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: FadeInImage.memoryNetwork(
                          placeholder: kTransparentImage,
                          image: product.image)),
                ),
              ),
            if (product.description != null)
              Text(
                product.description!,
                style: Get.textTheme.titleMedium,
              ),
            Text(
              ("R\$${product.price}") + (product.iskg ? "/kg" : ""),
              style: Get.textTheme.titleLarge,
            ),
            TextField(
              controller: controller.observationController,
              decoration: const InputDecoration(
                labelText: 'Observação',
              ),
              maxLength: 50,
            ),
            Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              decoration: BoxDecoration(
                  color: Colors.grey[100],
                  border: Border.all(color: Colors.black12, width: 2.0),
                  borderRadius: BorderRadius.circular(8.0)),
              child: Column(
                children: [
                  Text("Altere a quantidade"),
                  SizedBox(
                    height: 4.0,
                  ),
                  QuatityAndWeight(
                    iskg: product.iskg,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                  onPressed: () => controller.addCart(),
                  child: Text("Adicionar no carrinho")),
            )
          ]),
        ));
  }
}
