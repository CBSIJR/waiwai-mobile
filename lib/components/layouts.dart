import 'package:dicionario_waiwai/components/layouts/sidebar.dart';
import 'package:flutter/material.dart';
import 'package:dicionario_waiwai/components/layouts/appbar.dart';
import 'package:provider/provider.dart';
import 'package:dicionario_waiwai/services/api.dart';

class MainScreenLayout extends StatefulWidget {
  final Widget body;
  final FloatingActionButton? fab;

  const MainScreenLayout({super.key, required this.body, this.fab});

  @override
  createState() => _MainScreenLayoutState();
}

class _MainScreenLayoutState extends State<MainScreenLayout> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => WaiWaiApiProvider(),
        child: Scaffold(
          backgroundColor: const Color(0xFFF2F2F2),
          appBar: const MyAppBar(),
          drawer: const SideBar(),
          body: widget.body,
          floatingActionButton: widget.fab,
        ));
  }
}
