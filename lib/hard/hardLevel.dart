import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zgadulla/homePage/homePage.dart';
import 'package:zgadulla/win/winPage.dart';

class HardLevel extends StatefulWidget {
  HardLevel({
    Key? key,
  }) : super(key: key);
  @override
  State<HardLevel> createState() => _HardLevelState();
  final random1 = 100000 + Random().nextInt(100000);
}

class _HardLevelState extends State<HardLevel> {
  var result = '';
  var answer = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red.shade100,
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text("Poziom: \nTrudny"),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            Container(
              color: Colors.red,
              padding: const EdgeInsets.all(30),
              margin: const EdgeInsets.all(20),
              child: Text(
                'Zgadnij liczbę z zakresu: \n100000-200000',
                style: GoogleFonts.lato(fontSize: 20),
              ),
            ),
            Container(
              color: Colors.red,
              margin: const EdgeInsets.all(20),
              child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      result = "Wybierz liczbę z zakresu 100000-200000";
                      return 'Zapomniałeś czegoś dodać :(';
                    } else if (int.parse(value) > 200000 ||
                        int.parse(value) < 100000) {
                      result = "Wybierz liczbę z zakresu 100000-200000";
                      return 'Chyba się pomyliłeś, liczba ma być z zakresu (100000-200000)';
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
                      hintText: 'Twoja liczba z zakresu 100000-200000'),
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
                primary: Colors.red.shade800,
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
              color: Colors.red,
              padding: const EdgeInsets.all(10),
              child: Center(
                child: Text(
                  'Ilość prób do tego momentu:',
                  style: GoogleFonts.lato(fontSize: 20),
                ),
              ),
            ),
            Container(
              color: Colors.red,
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
