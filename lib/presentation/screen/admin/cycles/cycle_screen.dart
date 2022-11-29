import 'package:flutter/material.dart';

class CycleScreen extends StatefulWidget {
  const CycleScreen({super.key});

  @override
  State<CycleScreen> createState() => _CycleScreenState();
}

class _CycleScreenState extends State<CycleScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          child: Row(
            children: const [
              Text('Количество записей'),
              Spacer(),
              Text('100'),
            ],
          ),
        ),
        Expanded(
            child: ListView.builder(
          itemCount: 2,
          itemBuilder: (context, index) {
            return const Card(
              child: Text(''),
            );
          },
        ))
      ],
    );
  }
}
