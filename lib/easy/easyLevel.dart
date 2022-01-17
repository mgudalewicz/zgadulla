import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class EasyLevel extends StatefulWidget {
  EasyLevel({
    Key? key,
  }) : super(key: key);
  @override
  State<EasyLevel> createState() => _EasyLevelState();
  final random1 = 1 + Random().nextInt(99);
}

class _EasyLevelState extends State<EasyLevel> {
  var result = 'Buu';
  var answer = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  int number = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Poziom: \nŁatwy"),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            Container(
              color: Colors.lightBlue[50],
              padding: const EdgeInsets.all(30),
              margin: const EdgeInsets.all(20),
              child: Text(
                'Zgadnij liczbę z zakresu: \n1-100',
                style: GoogleFonts.lato(fontSize: 20),
              ),
            ),
            Container(
              color: Colors.lightBlue[50],
              margin: const EdgeInsets.all(20),
              child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Zapomniałeś czegoś dodać :(';
                    } else if (int.parse(value) < widget.random1) {
                      number += 1;
                      result = "za mało!";
                      return 'Spróbuj jeszcze raz';
                    } else if (int.parse(value) > widget.random1) {
                      number += 1;
                      result = "za dużo!";
                    } else if (int.parse(value) == widget.random1) {
                      number += 1;
                      result = "Brawo! Zgadłeś!";
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
              child: const Text('Sprawdź'),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );
                }
                setState(() {});
                if (result == "Brawo!") {}
              },
            ),
            Text(widget.random1.toString()),
            Text(number.toString()),
          ],
        ),
      ),
    );
  }
}
