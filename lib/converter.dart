import 'package:flutter/material.dart';
import 'package:taller_3/validations.dart';

class Converter extends StatefulWidget {
  const Converter({super.key});

  @override
  State<Converter> createState() => _ConverterState();
}

class _ConverterState extends State<Converter> {
  final _formKey = GlobalKey<FormState>();
  final List<String> list = <String>['Peru', 'Mexico', 'Chile', 'Bolivia'];

  late String countrySelected = list[0];
  String? name;
  String? email;
  String? age;
  String? country;
  double? amount;

  // map con los equivalentes del dolar en peru, mexico, chile y bolivia
  final Map<String, double> _equivalencesDollar = {
    'Peru': 3.78,
    'Mexico': 18.59,
    'Chile': 700.0,
    'Bolivia': 6.93,
  };

  // map con los equivalentes del euro en peru, mexico, chile y bolivia
  final Map<String, double> _equivalencesEuro = {
    'Peru': 4.11,
    'Mexico': 20.22,
    'Chile': 830.0,
    'Bolivia': 7.54,
  };

  @override
  Widget build(BuildContext context) {
    InputDecoration inputDecoration(String label) => InputDecoration(
          labelText: label,
        );
    return Center(
        child: ListView(
      children: [
        Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    initialValue: name,
                    onChanged: (text) => {
                      setState(() {
                        name = text;
                      })
                    },
                    decoration: inputDecoration('Nombre'),
                    validator: validateText,
                  ),
                  TextFormField(
                    initialValue: email,
                    onChanged: (text) => {
                      setState(() {
                        email = text;
                      })
                    },
                    decoration: inputDecoration('Email'),
                    validator: validateEmail,
                  ),
                  TextFormField(
                    initialValue: age,
                    onChanged: (text) => {
                      setState(() {
                        age = text;
                      })
                    },
                    decoration: inputDecoration('Edad'),
                    validator: validateAge,
                  ),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Pais'),
                      const SizedBox(width: 20),
                      DropdownButton<String>(
                        value: countrySelected,
                        icon: const Icon(Icons.arrow_downward),
                        elevation: 16,
                        style: const TextStyle(color: Colors.deepPurple),
                        underline: Container(
                          height: 2,
                          color: Colors.deepPurpleAccent,
                        ),
                        onChanged: (String? value) {
                          // This is called when the user selects an item.
                          setState(() {
                            countrySelected = value!;
                          });
                        },
                        items:
                            list.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Text('Dolar : ${_equivalencesDollar[countrySelected]}'),
                      const SizedBox(
                        width: 20,
                      ),
                      Text('Euro: ${_equivalencesEuro[countrySelected]}'),
                    ],
                  ),
                  TextFormField(
                    decoration: inputDecoration('Monto'),
                    validator: validateNumber,
                  ),
                ],
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        icon: const Icon(
                          Icons.check_circle,
                          size: 50,
                          color: Color(0xFF54B435),
                          shadows: [
                            BoxShadow(
                              color: Color(0xFF379237),
                              blurRadius: 5.0,
                            )
                          ],
                        ),
                        content: const Text('Los Conversión a sido exitosa'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'OK'),
                            child: const Text('OK'),
                          ),
                        ],
                      ),
                    );
                  }
                },
                child: const Text('Generar cambio'))
          ],
        ),
      ],
    ));
  }
}
