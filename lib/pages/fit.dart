import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:myappflutter/services/fitservice.dart';

class Fit extends StatefulWidget {
  const Fit({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FitState createState() => _FitState();
}

class _FitState extends State<Fit> {
  final FitService fitService = FitService();
  final _formKey = GlobalKey<FormState>();
  TextEditingController datasetController = TextEditingController();
  late int dataset = 1;

  @override
  void initState() {
    super.initState();
    datasetController.addListener(() {
      final text = datasetController.text;
      if (text.isNotEmpty) {
        try {
          final value = int.parse(text);
          dataset = value;
        } catch (e) {
          datasetController.text = dataset.toString();
        }
      }
    });
  }

  @override
  void dispose() {
    datasetController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              DropdownButtonFormField<int>(
                value: dataset,
                onChanged: (int? value) {
                  setState(() {
                    dataset = value!;
                    datasetController.text = value.toString();
                  });
                },
                decoration:
                    const InputDecoration(labelText: 'Tamaño del dataset'),
                items: const [
                  DropdownMenuItem(
                    value: 1,
                    child: Text('100%'),
                  ),
                  DropdownMenuItem(
                    value: 2,
                    child: Text('55%'),
                  ),
                  DropdownMenuItem(
                    value: 3,
                    child: Text('5%'),
                  ),
                ],
              ),
              //____________________________________ BOTON ____________________________________
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    await fitService.getFit(dataset: dataset);
                    // ignore: use_build_context_synchronously
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Modelo reentrenado'),
                          content: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Text('El modelo se ha reentrenado'),
                            ],
                          ),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('Cerrar'),
                            ),
                          ],
                        );
                      },
                    );
                    //--------------
                  }
                },
                child: const Text('Enviar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
