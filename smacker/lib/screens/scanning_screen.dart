import 'package:flutter/material.dart';
import 'capture_photo_screen_clean.dart';

class ScanningScreen extends StatelessWidget {
  const ScanningScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scan Package'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const SizedBox(height: 8),
            Container(
              height: 260,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(
                child: Icon(Icons.qr_code, size: 64, color: Colors.grey),
              ),
            ),
            const SizedBox(height: 16),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Text('Position the barcode or QR code within the frame to scan the package',
                  textAlign: TextAlign.center, style: TextStyle(color: Colors.grey)),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                // Simulate scan success and show a pop-up (dialog)
                showDialog<void>(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) => AlertDialog(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.green.shade50,
                            border: Border.all(color: Colors.green),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            children: const [
                              Icon(Icons.check_circle, size: 64, color: Colors.green),
                              SizedBox(height: 8),
                              Text('Package Scanned Successfully', style: TextStyle(fontWeight: FontWeight.bold)),
                              SizedBox(height: 8),
                              Text('Package scanned and verified. You may capture a photo for placement evidence.', textAlign: TextAlign.center),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),
                            ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop(); // close dialog
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => const CapturePhotoScreenClean()),
                            );
                          },
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
                            child: Text('Capture Package Photo'),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 14.0),
                child: Text('Start Scanning'),
              ),
            ),
            const SizedBox(height: 8),
            OutlinedButton(
              onPressed: () => Navigator.pop(context),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 12.0),
                child: Text('Cancel'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
