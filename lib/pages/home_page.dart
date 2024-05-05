import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:qr_scan/pages/qr_gen_screen.dart';
import 'package:qr_scan/pages/qr_scan_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  List<Widget> widgets = const [QrGenScreen(), QrScanScreen()];
  TextEditingController urlController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: widgets[currentIndex],
        ),
        bottomNavigationBar: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 30.0,
              vertical: (height * 0.020),
            ),
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                    spreadRadius: 0.5,
                    blurRadius: 50.0,
                    color: Color.fromARGB(255, 222, 216, 216)),
              ],
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(16),
              ),
              child: BottomNavigationBar(
                onTap: (tabIndex) {
                  setState(() {
                    currentIndex = tabIndex;
                  });
                },
                currentIndex: currentIndex,
                selectedItemColor: const Color.fromARGB(255, 231, 108, 101),
                unselectedItemColor: const Color.fromARGB(255, 4, 5, 11),
                showUnselectedLabels: true,
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(EvaIcons.edit2Outline),
                    label: "Create QR",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.qr_code_scanner_outlined),
                    label: "Scan QR",
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
