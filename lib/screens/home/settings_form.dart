import 'package:flutter/material.dart';
import 'package:ninja_brew_crew/shared/custom_button.dart';
import 'package:ninja_brew_crew/widgets/custom_buttons.dart';

class SettingsForm extends StatefulWidget {
  const SettingsForm({super.key});

  @override
  State<SettingsForm> createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> sugars = ['0', '1', '2', '3', '4'];

  // form values
  String? _currentName;
  String? _currentSugar;
  int? _currentStrength;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          const Text(
            "Update you brew settings",
            style: TextStyle(fontSize: 18.0),
          ),
          const SizedBox(height: 20),
          CustomTextFormField(
            label: "Name",
            hintText: "Enter your name",
            validator: (email) => email!.isEmpty ? "Enter a name" : null,
            onChanged: (value) => setState(() => _currentName = value),
          ),
          const SizedBox(height: 20),

          // drop down
          DropdownButtonFormField(
            hint: const Text("Select number of sugar you want"),
            // value: _currentSugar ?? "0",
            items: sugars.map(
              (sugar) {
                return DropdownMenuItem(
                  value: sugar,
                  child: Text("$sugar sugars"),
                );
              },
            ).toList(),
            onChanged: (sugar) => setState(() => _currentSugar = sugar),
          ),

          // slider
          Slider(
            value: (_currentStrength ?? 100).toDouble(),
            activeColor: Colors.brown[_currentStrength ?? 100],
            inactiveColor: Colors.brown[_currentStrength ?? 100],
            min: 100,
            max: 900,
            divisions: 8,
            onChanged: (value) => setState(() => _currentStrength = value.round()),
          ),

          //btn
          CustomButton(
            btnText: "Update",
            onBtnPress: () {
              print(_currentName);
              print(_currentSugar);
              print(_currentStrength);
            },
          ),
        ],
      ),
    );
  }
}
