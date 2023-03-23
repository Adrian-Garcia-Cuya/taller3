import 'package:flutter/material.dart';
import 'package:taller_3/models/record.dart';

class RecordView extends StatelessWidget {
  final List<Record> records;
  const RecordView({super.key, required this.records});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(records[index].name),
            subtitle: Text(records[index].country),
            trailing: Text(
                '\$${records[index].dollar.toString()} - €${records[index].euro.toString()}'),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(
              height: 20,
            ),
        itemCount: records.length);
  }
}
