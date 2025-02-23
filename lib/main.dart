import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Forms and Buttons',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Spam Signup Form >:)'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _displayController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  String _dropdownValue = "None";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Container(
        width: double.infinity,
        child: Form(
            child: Column(children: [
          Text("Info Form", textScaler: TextScaler.linear(2)),
          Padding(
            padding: EdgeInsets.all(8),
            child: SizedBox(
              width: double.infinity,
              height: 150,
              child: TextField(
                controller: _displayController,
                readOnly: true,
                maxLines: 5,
                decoration: InputDecoration(
                  hintText: "Submission Info goes here!",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: Row(
              children: [
                Icon(
                  Icons.person,
                  size: 50,
                ),
                Expanded(
                  child: TextField(
                      controller: _nameController,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          labelText: "Name",
                          suffixIcon: IconButton(
                              icon: Icon(Icons.close),
                              onPressed: () {
                                _nameController.clear();
                              }))),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: Row(
              children: [
                Icon(
                  Icons.email,
                  size: 50,
                ),
                Expanded(
                  child: TextField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          labelText: "Email",
                          suffixIcon: IconButton(
                              icon: Icon(Icons.close),
                              onPressed: () {
                                _emailController.clear();
                              }))),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: Row(
              children: [
                Icon(
                  Icons.calendar_month,
                  size: 50,
                ),
                Expanded(
                  child: TextField(
                      controller: _dateController,
                      keyboardType: TextInputType.datetime,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          labelText: "Birthday",
                          suffixIcon: IconButton(
                              icon: Icon(Icons.close),
                              onPressed: () {
                                _dateController.clear();
                              }))),
                )
              ],
            ),
          ),
          Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                children: [
                  Icon(
                    Icons.phone,
                    size: 50,
                  ),
                  Expanded(
                    child: TextField(
                        controller: _phoneController,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                            labelText: "Phone",
                            suffixIcon: IconButton(
                                icon: Icon(Icons.close),
                                onPressed: () {
                                  _phoneController.clear();
                                }))),
                  )
                ],
              )),
          Padding(
            padding: EdgeInsets.all(8),
            child: Row(children: [
              Icon(Icons.question_answer_rounded, size: 50),
              Expanded(
                  child: DropdownButtonFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
                value: _dropdownValue,
                items: [
                  DropdownMenuItem(
                      value: "None", child: Text("No Communications")),
                  DropdownMenuItem(value: "Email", child: Text("Email")),
                  DropdownMenuItem(value: "Phone", child: Text("Phone")),
                ],
                onChanged: (value) {
                  setState(() {
                    _dropdownValue = value!;
                  });
                },
              ))
            ]),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: Row(
              children: [
                Expanded(
                    child: ElevatedButton(
                        onPressed: () {
                          _nameController.clear();
                          _emailController.clear();
                          _dateController.clear();
                          _phoneController.clear();
                          setState(() {
                            _dropdownValue = "None";
                          });
                          _displayController.clear();
                        },
                        child: Text("Reset"))),
                Expanded(
                    child: ElevatedButton(
                        onPressed: () {
                          _displayController.text =
                              "Name: ${_nameController.value.text}\nEmail: ${_emailController.value.text}\nDate: ${_dateController.value.text}\nPhone: ${_phoneController.value.text}\nCommunication Preferences: $_dropdownValue";
                        },
                        child: Text("Submit"))),
              ],
            ),
          )
        ])),
      ),
    );
  }
}
