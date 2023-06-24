import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:malhar_2023/components/drawer_wrapper.dart';
import 'package:malhar_2023/home.dart';
import 'components/drawer.dart';
import 'pages/blog.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Landing page',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const MyHomePage(title: 'Home'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _advancedDrawerController = AdvancedDrawerController();

  @override
  Widget build(BuildContext context) {
    return DrawerWrapper(
      disableGestures: false,
      drawerController: _advancedDrawerController,
      scaffold: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: Text(
            widget.title,
            textAlign: TextAlign.center,
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            onPressed: _handleMenuButtonPressed,
            icon: ValueListenableBuilder<AdvancedDrawerValue>(
              valueListenable: _advancedDrawerController,
              builder: (_, value, __) {
                return AnimatedSwitcher(
                  duration: const Duration(milliseconds: 250),
                  child: Icon(
                    value.visible ? Icons.clear : Icons.menu,
                    key: ValueKey<bool>(value.visible),
                  ),
                );
              },
            ),
          ),
        ),
        body: const HomeScreen(),
        // body: Container(
        //   decoration: const BoxDecoration(
        //       image: DecorationImage(
        //           image: AssetImage('assets/images/bg.png'),
        //           fit: BoxFit.cover)),
        //   child: const Center(
        //     child: Column(
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       children: <Widget>[
        //         Text(
        //           '',
        //         )
        //       ],
        //     ),
        //   ),
        // ),
      ),
    );
  }

  void _handleMenuButtonPressed() {
    // NOTICE: Manage Advanced Drawer state through the Controller.
    // _advancedDrawerController.value = AdvancedDrawerValue.visible();
    _advancedDrawerController.showDrawer();
  }
}
