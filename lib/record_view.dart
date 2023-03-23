import 'package:flutter/material.dart';
import 'package:taller_3/models/record.dart';

class RecordView extends StatelessWidget {
  final List<Record> records;
  const RecordView({super.key, required this.records});

  @override
  Widget build(BuildContext context) {
    return Text(records[0].name);
  }
}
