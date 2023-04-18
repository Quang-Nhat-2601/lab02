import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import "Salary.dart";

void main() => runApp(MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
    ));

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final nameController = TextEditingController();
  final grossController = TextEditingController();
  Salary p_salary = Salary("", 0.0);

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    nameController.dispose();
    grossController.dispose();
    super.dispose();
  }

  void _inputValue() {
    setState(() {
      p_salary =
          Salary(nameController.text, double.parse(grossController.text));
    });
  }

  Widget InfoNV() {
    return Expanded(
      child: ListView(
        children: [
          Text(
            'Name: ${p_salary.name}',
            style: TextStyle(fontSize: 16),
          ),
          Text('Salary: ${p_salary.get_Salary}')
        ],
      ),
    );
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Lab-2"),
          elevation: 0.0,
        ),
        body: Form(
            key: _formKey,
            child: Column(children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                      hintText: "EX: Le Quang Nhat", labelText: "Full name *"),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Your Name';
                    }
                    return null;
                  },
                  controller: nameController,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: "Lương",
                    labelText: 'Salary *',
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  controller: grossController,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Processing Data')),
                      );
                      _inputValue();
                    }
                  },
                  child: const Text("GROSS SALARY",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                ),
              ),
              Divider(
                color: Color.fromARGB(255, 223, 194, 6),
              ),
              InfoNV(),
            ])));
  }
}
