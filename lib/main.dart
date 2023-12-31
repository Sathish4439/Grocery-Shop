import 'package:flutter/material.dart';
import 'package:freshdoor/component/cartprovider.dart';
import 'package:freshdoor/mainpage.dart';
import 'package:freshdoor/pages/Homepage.dart';
import 'package:freshdoor/pages/intropage.dart';
import 'package:freshdoor/pages/paymentpage.dart';
import 'package:provider/provider.dart';

import 'pages/auth_page.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => Cartprovider(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Intropage());
  }
}
