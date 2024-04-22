import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void ShowFilterModal(
  BuildContext context,
) {
  //Function(String) filterFunction

  TextEditingController nameWordController = TextEditingController();
  TextEditingController filterController = TextEditingController();

  showModalBottomSheet(
    isScrollControlled:
        true, // Define como true para permitir que o modal seja rolado quando o teclado estiver ativo
    context: context,
    shape: ShapeBorderTween(
      begin: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      end: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(0),
          topRight: Radius.circular(0),
        ),
      ),
    ).lerp(0.5),

    builder: (BuildContext context) {
      return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom +
                    20, // Adiciona espaço adicional para o teclado
                top: 16, // Padding no topo do modal
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Campo de busca por palavra
                  Padding(
                    padding: const EdgeInsets.only(left: 12, right: 12),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Icon(Icons.search),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: TextField(
                              controller: nameWordController,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Digite sua busca',
                                hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // const SizedBox(height: 16),
                  // Ícone de filtro com texto "Filtre por Categoria"
                  // Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: Container(
                  //     padding: const EdgeInsets.symmetric(horizontal: 12),
                  //     decoration: BoxDecoration(
                  //       border: Border.all(color: Colors.black),
                  //       borderRadius: BorderRadius.circular(10),
                  //     ),
                  //     child: Row(
                  //       children: [
                  //         const Icon(Icons.filter_list),
                  //         const SizedBox(width: 8),
                  //         Expanded(
                  //           child: TextField(
                  //             controller: filterController,
                  //             decoration: const InputDecoration(
                  //               border: InputBorder.none,
                  //               hintText: 'Filtre por Categoria',
                  //               hintStyle: TextStyle(
                  //                 color: Colors.grey,
                  //                 fontWeight: FontWeight.bold,
                  //               ),
                  //             ),
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  const SizedBox(height: 16),
                  // Botão "Buscar"
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if (nameWordController.text.isEmpty) {
                            Fluttertoast.showToast(
                                msg: "Digite alguma palavra!",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.white,
                                textColor: Colors.black,
                                fontSize: 16.0);
                          }
                          print(nameWordController.text);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text(
                          'Buscar',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}
