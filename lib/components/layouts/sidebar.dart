// ignore_for_file: file_names, use_build_context_synchronously

import 'dart:async';
import 'package:dicionario_waiwai/components/icons.dart';
import 'package:dicionario_waiwai/components/dialog/dialogupdate.dart';
import 'package:dicionario_waiwai/components/sidebar_buttons.dart';
import 'package:dicionario_waiwai/database/database.dart';
import 'package:dicionario_waiwai/main.dart';
import 'package:dicionario_waiwai/screens/home/state.dart';
import 'package:dicionario_waiwai/services/api.dart';
// import 'package:dicionario_waiwai/providers/provider.dart';
import 'package:dicionario_waiwai/screens/about.dart';
import 'package:dicionario_waiwai/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import 'package:dicionario_waiwai/components/sidebarbutton.dart';
// import 'package:waiwai_dictionary/components/sidebar_buttons.dart';
// import 'package:waiwai_dictionary/screens/about.dart';
// import 'package:waiwai_dictionary/screens/home.dart';
// import 'package:waiwai_dictionary/services/api.dart';

import 'package:provider/provider.dart';

final StreamController<double> progressStream = StreamController<double>();

class SideBar extends StatefulWidget {
  const SideBar({super.key});

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
//   @override
//   void dispose() {
//     progressStream.close();
//     super.dispose();
//   }

  @override
  Widget build(BuildContext context) {
    WaiWaiApiProvider apiProvider = Provider.of<WaiWaiApiProvider>(context);
    WordState wordState = Provider.of<WordState>(context);
    // logout() async {
    //   //usuario vai remover o token do local storage
    //   SharedPreferences prefs = await SharedPreferences.getInstance();
    //   await prefs.setBool('logado', false);
    // }

    callWords() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
      );
    }

    callAbout() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const AboutScreen(),
        ),
      );
    }

    updateDatabase(BuildContext context) async {
      updateOnProgressDialog(context);
      MessageApi result;
      try {
        bool isConnected = await InternetConnectionChecker().hasConnection;
        if (!isConnected) {
          throw MessageApiException(detail: 'Sem conexão com a internet');
        }
        try {
          await databaseProvider.insertMany(
              (await apiProvider.getExportUsers()).data,
              (await apiProvider.getExportReferences()).data,
              (await apiProvider.getExportWords()).data,
              (await apiProvider.getExportMeanings()).data);
          Navigator.of(context).pop();
          updateSuccessDialog(context);
        } catch (e) {
          print(e.toString());
          throw MessageApiException(detail: e.toString());
        }
      } on MessageApiException catch (e) {
        Navigator.of(context).pop();
        updateFailedDialog(context, e.detail);
      }
    }

    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            child: pngAssetAppLogo,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        SidebarButton(
                          onTap: callWords,
                          text: "Palavras",
                          icone: Icons.menu_book_rounded, //melhorar Icone
                        ),
                        SidebarButton(
                          onTap: () => updateDatabase(context),
                          text: "Atualizar",
                          icone: Icons.cloud_download_outlined,
                        ),
                        SidebarButton(
                          onTap: callAbout,
                          text: "Sobre",
                          icone: Icons.info_outline_rounded,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Divider(
            indent: 20,
            endIndent: 20,
          ),
          const Padding(
            // TODO: Not implemented
            padding: EdgeInsets.only(bottom: 22, top: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ButtonSidebarOption(
                      onTap: null,
                      text: "Bem-vindo, usuário!",
                      icon: Icons.account_circle_outlined,
                    ),
                    // ButtonSidebarOption(
                    //   onTap: null,
                    //   text: "Sair",
                    //   icon: Icons.logout_outlined,
                    // ),
                    //// SidebarButton(
                    //   // onTap: logout,
                    //   text: "sair",
                    //   icone: Icons.logout_outlined,
                    // ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
