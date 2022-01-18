import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zgadulla/easy/easyLevel.dart';
import 'package:zgadulla/homePage/homePage.dart';

class WinPage extends StatelessWidget {
  const WinPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/tlo.gif'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'ilość prób',
              style: GoogleFonts.lato(fontSize: 20),
            ),
            Text(
              number.toString(),
              style: GoogleFonts.lato(fontSize: 20),
            ),
            const SizedBox(height: 30),
            Text(
              level.toString(),
              style: GoogleFonts.lato(fontSize: 30),
            ),
            const SizedBox(height: 15),
            Center(
              child: Container(
                margin: const EdgeInsets.all(40.0),
                child: ElevatedButton(
                  child: const Text('Strona główna'),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => const HomePage(),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
