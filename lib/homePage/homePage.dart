import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zgadulla/easy/easyLevel.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Zgadnij liczę"),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/tlo.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          children: [
            Container(
              color: Colors.lightBlue[50],
              padding: const EdgeInsets.all(30),
              margin: const EdgeInsets.all(20),
              child: Text(
                'Zgadula\n\nGra logiczna polegająca na wyszukaniu liczby, która została wylosowana przez aplikację. \n\nWybierz poziom trudności.',
                style: GoogleFonts.lato(fontSize: 20),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(40.0),
              child: ElevatedButton(
                child: const Text('Łatwy'),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => EasyLevel(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
