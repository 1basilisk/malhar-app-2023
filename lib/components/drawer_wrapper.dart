// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:get/get.dart';
import 'package:malhar_2023/pages/blog.dart';
import 'package:malhar_2023/pages/contact.dart';
import 'package:malhar_2023/pages/shop.dart';

import '../main.dart';

class DrawerWrapper extends StatefulWidget {
  const DrawerWrapper({super.key, required this.scaffold, required this.drawerController,required this.disableGestures});

  final Scaffold scaffold;
  final AdvancedDrawerController drawerController;
  final bool disableGestures;

  @override
  State<DrawerWrapper> createState() => _DrawerWrapperState();
}

class _DrawerWrapperState extends State<DrawerWrapper> {
  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      backdrop: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(255, 169, 171, 220),
              Color.fromARGB(255, 212, 191, 212)
            ],
          ),
        ),
      ),
      controller: widget.drawerController,
      childDecoration: const BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(32)),
      ),
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      rtlOpening: false,
      // openScale: 1.0,
      disabledGestures: widget.disableGestures,
      drawer: SafeArea(
        child: Container(
          child: ListTileTheme(
            textColor: Colors.white,
            iconColor: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  // Container(
                  //   width: 128.0,
                  //   height: 128.0,
                  //   margin: const EdgeInsets.only(
                  //     top: 24.0,
                  //     bottom: 64.0,
                  //   ),
                  //   clipBehavior: Clip.antiAlias,
                  //   decoration: BoxDecoration(
                  //     color: Colors.black26,
                  //     shape: BoxShape.circle,
                  //   ),
                  //   child: Image.asset(
                  //     'assets/images/flutter_logo.png',
                  //   ),
                  // ),
                  ListTile(
                    leading: Icon(Icons.home),
                    title: const Text('Home'),
                    onTap: () {
                      Get.to(MyHomePage(title: "Home"));
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.web),
                    title: const Text('Blog'),
                    onTap: () {
                      Get.to(Blog());
                    },
                  ),
                  // ListTile(
                  //   leading: Icon(Icons.shopping_cart_rounded),
                  //   title: const Text('Shop'),
                  //   onTap: () {
                  //     Get.to(Shop());
                  //   },
                  // ),
                  ListTile(
                    leading: Icon(Icons.people),
                    title: const Text('Contact us'),
                    onTap: () {
                      Get.to(const Contact());
                      // Update the state of the app.
                      // ...
                    },
                  ),
                  const Spacer(),
                  DefaultTextStyle(
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white54,
                    ),
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                        vertical: 16.0,
                      ),
                      child: Text('Terms of Service | Privacy Policy'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      child: widget.scaffold,
    );
  }
}
