import 'package:flutter/material.dart';
import 'dart:math' show pi;
import 'home_screen.dart';

class CapturePhotoScreenClean extends StatelessWidget {
  const CapturePhotoScreenClean({super.key});

  Widget _buildCornerGuide() {
    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.white.withOpacity(0.95), width: 4),
          right: BorderSide(color: Colors.white.withOpacity(0.95), width: 4),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Capture Package Photo'),
        centerTitle: true,
        backgroundColor: Colors.blue,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              fit: StackFit.expand,
              children: [
                // Camera preview placeholder
                Container(color: Colors.grey[100]),
                // Frame guides
                Center(
                  child: Container(
                    margin: const EdgeInsets.all(40),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white.withOpacity(0.8), width: 2),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Stack(
                      children: [
                        Positioned(left: 0, top: 0, child: _buildCornerGuide()),
                        Positioned(
                          right: 0,
                          top: 0,
                          child: Transform(
                            alignment: Alignment.topRight,
                            transform: Matrix4.rotationZ(pi / 2),
                            child: _buildCornerGuide(),
                          ),
                        ),
                        Positioned(
                          left: 0,
                          bottom: 0,
                          child: Transform(
                            alignment: Alignment.bottomLeft,
                            transform: Matrix4.rotationZ(-pi / 2),
                            child: _buildCornerGuide(),
                          ),
                        ),
                        Positioned(
                          right: 0,
                          bottom: 0,
                          child: Transform(
                            alignment: Alignment.bottomRight,
                            transform: Matrix4.rotationZ(pi),
                            child: _buildCornerGuide(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Bottom controls
          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Take a clear photo of the package',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Center the package within the frame and ensure good lighting',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: const Color(0xFF757575),
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 16),

                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.blue.shade100),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.info_outline, size: 16, color: Colors.blue.shade700),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          'Position the entire package within the frame. Ensure good lighting and clear visibility of all sides.',
                          style: TextStyle(color: Colors.blue.shade900, fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // Primary action button
                Container(
                  constraints: const BoxConstraints.tightFor(height: 56),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.blue.shade600, Colors.blue.shade400],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(color: Colors.blue.withOpacity(0.25), offset: const Offset(0, 6), blurRadius: 12),
                    ],
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(12),
                      onTap: () {
                        showDialog<void>(
                          context: context,
                          barrierDismissible: false,
                          builder: (BuildContext context) => AlertDialog(
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
                                      Text('Success!', style: TextStyle(fontWeight: FontWeight.bold)),
                                      SizedBox(height: 8),
                                      Text('The package has been placed successfully.', textAlign: TextAlign.center),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 16),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(builder: (_) => const HomeScreen()),
                                      (route) => false,
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                                  child: const Padding(
                                    padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                                    child: Text('Go Back', style: TextStyle(fontSize: 16)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      child: const Center(
                        child: Text('Capture and Detect', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600)),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 12),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
