import 'package:flutter/material.dart';
import 'package:ninja_brew_crew/models/user.dart';
import 'package:ninja_brew_crew/services/database.dart';
import 'package:ninja_brew_crew/shared/constants.dart';
import 'package:ninja_brew_crew/shared/custom_button.dart';
import 'package:ninja_brew_crew/widgets/custom_buttons.dart';
import 'package:provider/provider.dart';

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

  bool isLoading = false;

  String error = '';

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel?>(context);

    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user!.uid).userData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserData? userData = snapshot.data;

            return isLoading
                ? showLoader()
                : Form(
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
                          initialValue: userData?.name,
                          validator: (email) => email!.isEmpty ? "Enter a name" : null,
                          onChanged: (value) => setState(() => _currentName = value),
                        ),
                        const SizedBox(height: 20),

                        // drop down
                        DropdownButtonFormField(
                          hint: const Text("Select number of sugar you want"),
                          value: userData?.sugars,
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
                          value: (_currentStrength ?? userData?.strength)!.toDouble(),
                          activeColor: Colors.brown[_currentStrength ?? int.parse("${userData?.strength}")],
                          inactiveColor: Colors.brown[_currentStrength ?? int.parse("${userData?.strength}")],
                          min: 100,
                          max: 900,
                          divisions: 8,
                          onChanged: (value) => setState(() => _currentStrength = value.round()),
                        ),

                        //btn
                        CustomButton(
                          btnText: "Update",
                          onBtnPress: () async {
                            if (_formKey.currentState!.validate()) {
                              // setState(() => isLoading = true);
                              await DatabaseService(uid: user.uid).updateUserData(
                                _currentSugar ?? userData!.sugars!,
                                _currentName ?? userData!.name!,
                                _currentStrength ?? userData!.strength!,
                              );

                              // ignore: use_build_context_synchronously
                              Navigator.of(context).pop();
                            }
                          },
                        ),

                        const SizedBox(height: 12),
                        Text(
                          error,
                          style: const TextStyle(
                            color: Colors.red,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  );
          } else {
            return showLoader();
          }
        });
  }
}
