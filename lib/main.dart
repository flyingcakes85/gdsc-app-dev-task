import 'package:flutter/material.dart';
import 'package:login/show_snackbar.dart';
import 'list_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'GDSC',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: const MyHomePage(title: 'GDSC App Dev Task'),
        routes: {"listPage": (context) => ListPage()});
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController userId = TextEditingController();
  TextEditingController password = TextEditingController();

  final String userIdPredefined = "test@admin.com";
  final String passwordPredefined = "12345678";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
          padding: const EdgeInsets.all(18),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  "LOGIN",
                  style: TextStyle(fontSize: 36),
                ),
                const SizedBox(height: 24),
                TextField(
                  controller: userId,
                  maxLines: 1,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Enter your username',
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: password,
                  maxLines: 1,
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Enter your password',
                  ),
                ),
                const SizedBox(height: 10),
                MaterialButton(
                  child: Row(
                    children: [
                      Expanded(child: Container()),
                      const Icon(
                        Icons.login,
                        color: Colors.white,
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        "LOGIN",
                        style: TextStyle(color: Colors.white),
                      ),
                      Expanded(child: Container())
                    ],
                  ),
                  color: Colors.green,
                  onPressed: () {
                    if (userId.text == userIdPredefined &&
                        password.text == passwordPredefined) {
                      Navigator.pushNamed(context, "listPage");
                    } else {
                      showSnackbar(context, "Invalid Credentials", Icons.error);
                    }
                  },
                ),
                const SizedBox(height: 68),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
