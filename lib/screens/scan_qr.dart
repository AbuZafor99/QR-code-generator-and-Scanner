import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class ScanQr extends StatefulWidget {
  const ScanQr({super.key});

  @override
  State<ScanQr> createState() => _ScanQrState();
}

class _ScanQrState extends State<ScanQr> {
  String scannedResult = 'Not scanned yet';

  Future<void> startScan() async {
    String barcodeScanRes;

    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        "#ff6666", // Scanner line color
        "Cancel",  // Cancel button text
        true,      // Show flash icon
        ScanMode.QR,
      );
    } catch (e) {
      barcodeScanRes = 'Failed to get scan result.';
    }

    if (!mounted) return;

    setState(() {
      scannedResult = barcodeScanRes != '-1' ? barcodeScanRes : 'Scan cancelled';
    });
  }

  @override
  void initState() {
    super.initState();
    startScan(); // Automatically open scanner on page open
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Scan QR",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Text(
          "Result: $scannedResult",
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}