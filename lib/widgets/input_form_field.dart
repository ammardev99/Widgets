import 'package:flutter/material.dart';
import 'package:widgets/widgets/formating.dart';

class InputFormFieldApp extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController controller;
  final TextInputType inputType;
  final FormFieldValidator<String>? validator;

  const InputFormFieldApp({
    super.key,
    required this.label,
    required this.hint,
    required this.controller,
    required this.inputType,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          customHeading(label),
          const SizedBox(
            height: 5,
          ),
          TextFormField(
            controller: controller,
            keyboardType: inputType,
            decoration: InputDecoration(
              hintText: hint,
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
            ),
            maxLines: null,
            minLines: 1,
            validator: validator,
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Form Input Field Example")),
        body: const Padding(
          padding: EdgeInsets.all(16.0),
          child: MyForm(),
        ),
      ),
    );
  }
}

class MyForm extends StatefulWidget {
  const MyForm({super.key});

  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          InputFormFieldApp(
            label: "Name",
            hint: "Enter your name",
            controller: nameController,
            inputType: TextInputType.text,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your name';
              }
              return null;
            },
          ),
          InputFormFieldApp(
            label: "Email",
            hint: "Enter your email",
            controller: emailController,
            inputType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }
              return null;
            },
          ),
          InputFormFieldApp(
            label: "Phone",
            hint: "Enter your phone number",
            controller: phoneController,
            inputType: TextInputType.phone,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your phone number';
              }
              return null;
            },
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                // Process data
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Processing Data')),
                );
              }
            },
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }
}
