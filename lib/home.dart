import 'package:flutter/material.dart';
import 'package:taller_3/converter.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: const TabBar(
          tabs: [
            Tab(icon: Icon(Icons.home)),
            Tab(icon: Icon(Icons.monetization_on)),
            Tab(icon: Icon(Icons.edit_document)),
          ],
        ),
        title: const Text('Convertidor de moneda'),
      ),
      body: const TabBarView(
        children: [
          Presentation(),
          Converter(),
          Icon(Icons.directions_bike),
        ],
      ),
    );
  }
}

class Presentation extends StatelessWidget {
  const Presentation({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(left: 16, right: 16),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            // Where the linear gradient begins and ends
            begin: FractionalOffset(0.2, 0.0),
            end: FractionalOffset(1.0, 0.6),
            stops: [0.0, 0.6],
            tileMode: TileMode.clamp,
            colors: [
              Color(0xFF4268D3),
              Color(0xFF584CD1),
            ],
          ),
        ),
        child: const Center(
          child: Text(
            'Bienvenido al convertidor de monedas',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 34, color: Colors.white),
          ),
        ));
  }
}
