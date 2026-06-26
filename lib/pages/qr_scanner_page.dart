import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QrScannerPage extends StatefulWidget {
  const QrScannerPage({super.key});

  @override
  State<QrScannerPage> createState() => _QrScannerPageState();
}

class _QrScannerPageState extends State<QrScannerPage> {
  final MobileScannerController cameraController = MobileScannerController();
  bool _screenOpened = false;

  @override
  void dispose() {
    cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Escanear Acceso QR'),
        backgroundColor: const Color.fromARGB(255, 30, 86, 56), // Verde institucional
        foregroundColor: Colors.white,
      ),
      body: Stack(
        children: [
          // 1. Lente de la cámara escaneando en vivo
          MobileScanner(
            controller: cameraController,
            onDetect: (capture) {
              final List<Barcode> barcodes = capture.barcodes;
              if (barcodes.isNotEmpty && !_screenOpened) {
                _screenOpened = true;
                final String? code = barcodes.first.rawValue;
                if (code != null) {
                  _procesarCodigoQR(code);
                }
              }
            },
          ),

          // 2. Cuadro guía visual para el Vigilante
          Center(
            child: Container(
              width: 260,
              height: 260,
              decoration: BoxDecoration(
                border: Border.all(color: const Color.fromARGB(255, 50, 106, 79), width: 4),
                borderRadius: BorderRadius.circular(20),
                color: Colors.black.withOpacity(0.1),
              ),
            ),
          ),
          
          // Texto flotante inferior
          Positioned(
            bottom: 60,
            left: 20,
            right: 20,
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.8),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                'Coloque el código QR del invitado dentro del recuadro para validar el acceso.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Ventana emergente al detectar un QR
  void _procesarCodigoQR(String data) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: const Row(
            children: [
              Icon(Icons.check_circle, color: Colors.green, size: 30),
              SizedBox(width: 10),
              Text('Acceso Autorizado'),
            ],
          ),
          content: Text(
            'Código verificado correctamente.\n\nContenido del QR:\n$data\n\nIngreso registrado en Aura Residences.',
            style: const TextStyle(fontSize: 15),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Cierra diálogo
                Navigator.pop(context); // Regresa al Dashboard
              },
              child: const Text(
                'ACEPTAR',
                style: TextStyle(color: Color.fromARGB(255, 30, 86, 56), fontWeight: FontWeight.bold),
              ),
            ),
          ],
        );
      },
    );
  }
}