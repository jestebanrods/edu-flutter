import 'package:flutter/material.dart';

enum Options { male, female, others }

class CheckboxScreen extends StatefulWidget {
  static String name = 'checkbox';

  const CheckboxScreen({super.key});

  @override
  State<CheckboxScreen> createState() => _CheckboxScreenState();
}

class _CheckboxScreenState extends State<CheckboxScreen> {
  bool devMode = false;
  Options selectOptions = Options.others;
  bool isSelect = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Checkbox & Radios')),
      body: ListView(
        children: [
          SwitchListTile(
              title: const Text('Developer Mode'),
              subtitle: const Text('Habilitar controlers avanzandos.'),
              value: devMode,
              onChanged: (value) {
                setState(() {
                  devMode = !devMode;
                });
              }),
          ExpansionTile(
            title: const Text('Geners'),
            subtitle: Text('$selectOptions'),
            children: [
              RadioListTile(
                title: const Text('Others'),
                value: Options.others,
                groupValue: selectOptions,
                onChanged: (value) {
                  setState(() {
                    selectOptions = Options.others;
                  });
                },
              ),
              RadioListTile(
                title: const Text('Male'),
                value: Options.male,
                groupValue: selectOptions,
                onChanged: (value) {
                  setState(() {
                    selectOptions = Options.male;
                  });
                },
              ),
              RadioListTile(
                title: const Text('Female'),
                value: Options.female,
                groupValue: selectOptions,
                onChanged: (value) {
                  setState(() {
                    selectOptions = Options.female;
                  });
                },
              ),
            ],
          ),
          CheckboxListTile(
            title: const Text('Está seleccionado?'),
            value: isSelect,
            onChanged: (value) {
              setState(() {
                isSelect = !isSelect;
              });
            },
          )
        ],
      ),
    );
  }
}
