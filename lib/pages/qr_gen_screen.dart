import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrGenScreen extends StatefulWidget {
  const QrGenScreen({super.key});

  @override
  State<QrGenScreen> createState() => _QrGenScreenState();
}

class _QrGenScreenState extends State<QrGenScreen> {
  TextEditingController urlController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          'Generate a QR code',
          style: TextStyle(color: Colors.black, fontFamily: "poppins_regular"),
        )),
        backgroundColor: Colors.green[200],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (urlController.text.isNotEmpty)
            QrImageView(
              data: urlController.text,
              size: 250,
            ),
          const SizedBox(
            height: 30,
          ),
          if (urlController.text.isEmpty)
            const Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                'Enter Your Profile link below:',
                style:
                    TextStyle(fontFamily: 'poppins_extra_bold', fontSize: 30),
              ),
            ),
          Container(
            padding: const EdgeInsets.only(right: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: width * .70,
                      padding: const EdgeInsets.all(10),
                      child: TextField(
                        controller: urlController,
                        decoration: InputDecoration(
                            hintText: 'Enter Your data',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            labelText: 'Enter Your data'),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {});
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          height: 54,
                          decoration: BoxDecoration(color: Colors.green[200]),
                          padding: const EdgeInsets.all(10),
                          child: const Center(
                            child: Text(
                              'Gen Qr',
                              style: TextStyle(
                                  fontSize: 18, fontFamily: 'poppins_semibold'),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
