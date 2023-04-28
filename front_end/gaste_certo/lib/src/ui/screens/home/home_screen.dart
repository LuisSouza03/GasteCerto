// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:gaste_certo/src/ui/screens/login/login_screen.dart';
import 'package:get/get.dart';

import '../addScreen/abas_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String saldoAtual = "";
  var total;
  var width;
  var height;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        primary: false,
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: height * 0.334,
                  color: Colors.white,
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    width: double.infinity,
                    height: height * 0.28,
                    decoration: BoxDecoration(
                      color: Colors.lightGreen[700],
                    ),
                  ),
                ),
                Positioned(
                  top: width * 0.18,
                  left: width * 0.07,
                  child: Text(
                    "GasteCerto",
                    style:
                        TextStyle(color: Colors.white, fontSize: width * 0.074),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: width * 0.07,
                  right: width * 0.07,
                  child: Container(
                    height: height * 0.16,
                    width: width * 0.1,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(blurRadius: 5, offset: Offset(0, 2))
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            left: width * 0.05,
                            top: width * 0.04,
                            bottom: width * 0.02,
                          ),
                          child: Text(
                            "Total",
                            style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: width * 0.05),
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: width * 0.05),
                              child: SizedBox(
                                width: width * 0.6,
                                child: Text(
                                  saldoAtual,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Colors.lightBlue[700],
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: width * 0.04),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const AbasScreen(),
                                    ),
                                  );
                                },
                                child: Container(
                                  width: width * 0.12,
                                  height: width * 0.12,
                                  decoration: BoxDecoration(
                                    color: Colors.lightBlue[700],
                                    borderRadius: BorderRadius.circular(50),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Colors.grey,
                                        blurRadius: 7,
                                        offset: Offset(2, 2),
                                      )
                                    ],
                                  ),
                                  child: Icon(
                                    Icons.add,
                                    size: width * 0.07,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: height * 0.008,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            TextButton(
              onPressed: () => Get.to(() => const LoginAccountScreen()),
              child: const Text(
                "sair",
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
