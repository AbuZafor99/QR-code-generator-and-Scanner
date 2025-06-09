import 'package:flutter/material.dart';
import 'package:flutter_qr/screens/scan_qr.dart';

import 'generate_qr.dart';
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "QR Generator & Scanner",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              "assets/home.png",
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 130),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      foregroundColor: Colors.white,
                      textStyle: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)
                      )
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ScanQr()));
                  },
                  child: Text("Scan QR"),
                ),
                SizedBox(height: 10,),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      foregroundColor: Colors.white,
                      textStyle: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)
                      )
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>GenerateQr()));
                  },
                  child: Text("Generate QR"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}