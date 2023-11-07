import 'package:flutter/material.dart';
import 'package:myappflutter/pages/predict.dart';
import 'package:myappflutter/pages/fit.dart';

class NavbarPage extends StatefulWidget {
  const NavbarPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _NavbarPageState createState() => _NavbarPageState();
}

class _NavbarPageState extends State<NavbarPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('My app Machine Learning'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Predecir'),
              Tab(text: 'Reentrenar'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Predict(),     // Llama a la clase Fit()
            Fit(), // Llama a la clase Predict()
          ],
        ),
      ),
    );
  }
}
