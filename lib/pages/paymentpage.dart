import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class Paymentpage extends StatefulWidget {
  Paymentpage({Key? key}) : super(key: key);

  @override
  State<Paymentpage> createState() => _PaymentpageState();
}

class _PaymentpageState extends State<Paymentpage> {
  void scanQRCode() async {
    try {
      final qrCode = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);

      if (!mounted) return;

      setState(() {
        getResult = qrCode;
      });
      print("QRCode_Result:--");
      print(qrCode);
    } on PlatformException {
      getResult = 'Failed to scan QR Code.';
    }
  }

  List<String> urls = [
    "lib/image/gpay.png",
    "lib/image/phonepy.png",
    "lib/image/paytm.png",
    "lib/image/navi.png",
    "lib/image/wallet.png",
    "lib/image/bajaj.png",
    "lib/image/upi.png",
  ];

  List<String> PaymentMethods = [
    "Gpay",
    "PhonePe",
    "Paytm",
    "Navi",
    "Wallet",
    "Bajaj Cart",
    "UPI",
  ];

  var getResult = 'QR Code Result';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
        title: Text("Payment Options"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                scanQRCode();
              },
              icon: Icon(Icons.qr_code_scanner_sharp))
        ],
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Expanded(
        child: ListView.builder(
            itemCount: PaymentMethods.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.all(8),
                child: ListTile(
                  onTap: () {},
                  leading: Image.asset(urls[index]),
                  title: Text(
                    PaymentMethods[index],
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
