import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:harman_app/core/router/app_routes.dart';
import 'package:local_auth/local_auth.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:local_auth_android/local_auth_android.dart';

class QrScreen extends StatefulWidget {
  const QrScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _QrScreenState();
}

class _QrScreenState extends State<QrScreen> {
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(flex: 4, child: _buildQrView(context)),
        ],
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 150.0
        : 300.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: Colors.red,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      bool validURL = Uri.parse(scanData.code ?? '').isAbsolute;
      if (validURL) {
        checkAuthLocal(context,scanData);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Qr Bukan URL'),
            duration: Duration(seconds: 3),
          ),
        );
        GoRouter.of(context).pop();
      }

    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  void checkAuthLocal(BuildContext context, Barcode scanData) async {
    final LocalAuthentication auth = LocalAuthentication();
    // ···
    final bool canAuthenticateWithBiometrics = await auth.canCheckBiometrics;
    final bool canAuthenticate =
        canAuthenticateWithBiometrics || await auth.isDeviceSupported();
    if (canAuthenticate) {
      final List<BiometricType> availableBiometrics =
      await auth.getAvailableBiometrics();

      if (availableBiometrics.isNotEmpty) {
        try {
          final bool didAuthenticate = await auth.authenticate(
              authMessages: [
                const  AndroidAuthMessages(
                  signInTitle: 'Lakukan Verifikasi',
                  biometricHint: '',
                  cancelButton: 'Batalkan',
                  biometricRequiredTitle: 'Letakkan sidik jari anda',
                  biometricNotRecognized: 'Sidik jari Salah',
                ),
              ],
              localizedReason: 'Verifikasi diperlukan untuk mengakses fitur');
          if (didAuthenticate && context.mounted) {
            GoRouter.of(context).pushReplacementNamed(
              AppRoutes.webViewScreen,
              extra: scanData.code,
            );
          }
        } on PlatformException {
          // ...
        }
      }
    }
  }
}
