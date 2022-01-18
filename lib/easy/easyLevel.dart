import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zgadulla/homePage/homePage.dart';
import 'package:zgadulla/win/winPage.dart';

class EasyLevel extends StatefulWidget {
  EasyLevel({
    Key? key,
  }) : super(key: key);
  @override
  State<EasyLevel> createState() => _EasyLevelState();
  final random1 = 1 + Random().nextInt(99);
}

class _EasyLevelState extends State<EasyLevel> {
  var result = '';
  var answer = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade100,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text("Poziom: \nŁatwy"),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            Container(
              color: Colors.green,
              padding: const EdgeInsets.all(30),
              margin: const EdgeInsets.all(20),
              child: Text(
                'Zgadnij liczbę z zakresu: \n1-100',
                style: GoogleFonts.lato(fontSize: 20),
              ),
            ),
            Container(
              color: Colors.green,
              margin: const EdgeInsets.all(20),
              child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Zapomniałeś czegoś dodać :(';
                    } else if (int.parse(value) > 100 || int.parse(value) < 1) {
                      return 'Chyba się pomyliłeś, liczba ma być z zakresu (1-100)';
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
                      hintText: 'Twoja liczba z zakresu 1-100'),
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
                primary: Colors.green[800],
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
              color: Colors.green,
              padding: const EdgeInsets.all(10),
              child: Center(
                child: Text(
                  'Jest to próba numer:',
                  style: GoogleFonts.lato(fontSize: 20),
                ),
              ),
            ),
            Container(
              color: Colors.green,
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
