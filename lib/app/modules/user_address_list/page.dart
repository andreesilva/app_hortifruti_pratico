import 'package:app_hortifruti_pratico/app/modules/user_address_list/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserAddressListPage extends GetView<UserAddressListController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Meus documentos')),
        body: controller.obx(
          (state) => SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 16.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: OutlinedButton.icon(
                            onPressed: controller.goToNewAddress,
                            icon: const Icon(Icons.add_location),
                            label: const Text("Novo endereço")),
                      ),
                    ],
                  ),
                ),

                if(state!.isEmpty)
                    const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        'Não há nehum endereço cadastrado',
                        textAlign: TextAlign.center,
                        ),
                    ),
                for (var address in state)
                  ListTile(
                    title: Text('${address.street}, nº ${address.number}'),
                    subtitle:
                        Text('${address.neighborhood}, ${address.city!.name}'),
                    trailing: PopupMenuButton(
                      itemBuilder: (context) => [
                        const PopupMenuItem(
                            value: 'edit', child: Text('Editar')),
                        const PopupMenuItem(
                            value: 'delete', child: Text('Excluir')),
                      ],
                      onSelected: (value) {
                        switch (value) {
                          case 'delete':
                            controller.deleteAddress(address);
                            break;
                          case 'edit':
                            controller.goEditAddress(address);
                            break;
                          default:
                        }
                      },
                    ),
                    onTap: () =>  controller.goEditAddress(address), 
                  ),
              ],
            ),
          ),
        ));
  }
}
