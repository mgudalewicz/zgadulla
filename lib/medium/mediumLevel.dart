import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zgadulla/homePage/homePage.dart';
import 'package:zgadulla/win/winPage.dart';

class MediumLevel extends StatefulWidget {
  MediumLevel({
    Key? key,
  }) : super(key: key);
  @override
  State<MediumLevel> createState() => _MediumLevelState();
  final random1 = 1000 + Random().nextInt(1000);
}

class _MediumLevelState extends State<MediumLevel> {
  var result = '';
  var answer = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade100,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Poziom: \nŚredni"),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            Container(
              color: Colors.blue,
              padding: const EdgeInsets.all(30),
              margin: const EdgeInsets.all(20),
              child: Text(
                'Zgadnij liczbę z zakresu: \n1000-2000',
                style: GoogleFonts.lato(fontSize: 20),
              ),
            ),
            Container(
              color: Colors.blue,
              margin: const EdgeInsets.all(20),
              child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Zapomniałeś czegoś dodać :(';
                    } else if (int.parse(value) > 2000 ||
                        int.parse(value) < 1000) {
                      return 'Chyba się pomyliłeś, liczba ma być z zakresu (1000-2000)';
                    } else if (int.parse(value) < widget.random1) {
                      number += 1;
                      result = "za mało!";
                      return 'Spróbuj jeszcze raz';
                    } else if (int.parse(value) > widget.random1) {
                      number += 1;
                      result = "za dużo!";
                      return 'Spróbuj jeszcze raz';
                    } else if (int.parse(value) == widget.random1) {
                      number += 1;
                      result = 'Brawo!';
                      return 'wygrałeś!';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                      hintText: 'Twoja liczba z zakresu 1000-2000'),
                  controller: answer,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ]),
            ),
            Text(
              result.toString(),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.blue.shade800,
              ),
              child: const Text('Sprawdź'),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );
                }
                setState(() {
                  if (result == 'Brawo!') {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => const WinPage(),
                      ),
                    );
                  }
                });
                answer.clear();
              },
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              color: Colors.blue,
              padding: const EdgeInsets.all(10),
              child: Center(
                child: Text(
                  'Jest to próba numer:',
                  style: GoogleFonts.lato(fontSize: 20),
                ),
              ),
            ),
            Container(
              color: Colors.blue,
              padding: const EdgeInsets.all(10),
              child: Center(
                child: Text(
                  number.toString(),
                  style: GoogleFonts.lato(fontSize: 40),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
