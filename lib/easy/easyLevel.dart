import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EasyLevel extends StatelessWidget {
  const EasyLevel({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Poziom: \nŁatwy"),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/tlo.jpg'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
