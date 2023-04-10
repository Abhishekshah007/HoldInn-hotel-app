import 'dart:convert';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:hotel_booking_app/Database/database.dart';

import '../Screens/homeScreen.dart';
import '../custom widgets/CustomTextWidget.dart';

class PhoneCode {
  final String code;
  final String name;

  PhoneCode({required this.code, required this.name});

  factory PhoneCode.fromJson(Map<String, dynamic> json) {
    return PhoneCode(
      code: json['code'],
      name: json['name'],
    );
  }
}

class PhoneCodeDropDown extends StatefulWidget {
  final String hintText;

  const PhoneCodeDropDown({
    Key? key,
    required this.hintText,
  }) : super(key: key);

  @override
  _PhoneCodeDropDownState createState() => _PhoneCodeDropDownState();
}

class _PhoneCodeDropDownState extends State<PhoneCodeDropDown> {
  late String _phoneNumber;
  late String _selectedCountryCode;

  final _formKey = GlobalKey<FormState>();
  late UserDatabase _userDatabase;

  List<PhoneCode> _list = [];
  PhoneCode? _selectedCode;

  final TextEditingController _phoneController = TextEditingController();

  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('lib/assets/files/CountryCode.json');
    final data = await json.decode(response);
    List<PhoneCode> phoneCodes = (data['countries'] as List)
        .map((json) => PhoneCode.fromJson(json))
        .toList();
    setState(() {
      _list = phoneCodes;
    });
  }

  @override
  void initState() {
    super.initState();
    readJson();
    _userDatabase = UserDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(
                height: 150,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: const BorderSide(color: Colors.grey, width: 1),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        DropdownButtonFormField<PhoneCode>(
                          isExpanded: true,
                          decoration: const InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: EdgeInsets.zero,
                            hintText: "Country/Region",
                          ),
                          value: _selectedCode,
                          onChanged: (PhoneCode? newValue) {
                            setState(() {
                              _selectedCode = newValue ??
                                  PhoneCode(code: '+91', name: 'India');
                              _selectedCountryCode = newValue!.code;
                            });
                          },
                          items: _list.map((PhoneCode code) {
                            return DropdownMenuItem<PhoneCode>(
                              value: code,
                              enabled: true,
                              child: Text('${code.name} (${code.code})',
                                  softWrap: true),
                            );
                          }).toList(),
                        ),
                        const Divider(
                          color: Colors.black,
                          thickness: 1,
                          height: 10,
                        ),
                        const SizedBox(height: 8),
                        Flexible(
                          child: TextField(
                            maxLength: 10,
                            keyboardType: TextInputType.phone,
                            controller: _phoneController,
                            decoration: const InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                              contentPadding: EdgeInsets.zero,
                              hintText: 'Phone number',
                            ),
                            onChanged: (value) {
                              setState(() {
                                _phoneNumber = value; // update the phone number
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 5),
              const CustomText(
                'We\'ll call or text to confirm your number. Standard message and data rates apply.',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 10),
              RichText(
                text: TextSpan(
                  children: [
                    const TextSpan(
                      text:
                          'By signing in to this app, you agree to the Holdinn ',
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    TextSpan(
                      text: 'Terms & Conditions',
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.blueAccent,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          // Handle link tap for 'Terms & Conditions'
                        },
                    ),
                    const TextSpan(
                      text: ' and acknowledge the ',
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    TextSpan(
                      text: 'Privacy Policy',
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.blueAccent,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          // Handle link tap for 'Privacy Policy'
                        },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(
                        0xFF232F3F), // Sets the background color of the button
                    shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    animationDuration: const Duration(seconds: 3)),
                onPressed: () {
                  if (_selectedCode == null ||
                      _phoneController.text.isEmpty ||
                      _phoneController.text.length != 10) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        backgroundColor: Colors.red,
                        content: Text('Enter required fields'),
                      ),
                    );
                  } else {
                    _submitForm();
                    Navigator.pushReplacement(context, MaterialPageRoute(
                      builder: (context) {
                        return const MyHomePage();
                      },
                    ));
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        backgroundColor: Colors.greenAccent,
                        content: Text('Successfully Login'),
                      ),
                    );
                  }
                },
                child: const SizedBox(
                  width: double.infinity,
                  child: Center(
                    child: CustomText(
                      'Continue',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _submitForm() async {
    final form = _formKey.currentState;
    if (form!.validate()) {
      form.save();

      final schemeData = await UserTableCompanion.insert(
          countryCode: _selectedCountryCode, number: _phoneNumber);
      _userDatabase.insertUserDetails(schemeData);
    }
    _formKey.currentState!.reset();
  }

  @override
  void dispose() {
    _userDatabase.close();
    super.dispose();
  }
}
