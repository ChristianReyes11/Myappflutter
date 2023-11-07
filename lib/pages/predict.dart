import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:myappflutter/services/apiservice.dart';

class Predict extends StatefulWidget {
  const Predict({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PredictState createState() => _PredictState();
}

class _PredictState extends State<Predict> {
  final ApiService apiService = ApiService();
  final _formKey = GlobalKey<FormState>();
  TextEditingController stepController = TextEditingController();
  TextEditingController typeController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController oldbalanceOrgController = TextEditingController();
  TextEditingController newbalanceOrigController = TextEditingController();
  TextEditingController oldbalanceDestController = TextEditingController();
  TextEditingController newbalanceDestController = TextEditingController();
  TextEditingController isFlaggedFraudController = TextEditingController();
  late int step = 0;
  late int type = 1;
  late int isFlaggedFraud = 1;
  late double amount = 0;
  late double oldbalanceOrg = 0;
  late double newbalanceOrig = 0;
  late double oldbalanceDest = 0;
  late double newbalanceDest = 0;

  @override
  void initState() {
    super.initState();
    stepController.addListener(() {
      final text = stepController.text;
      if (text.isNotEmpty) {
        try {
          final value = int.parse(text);
          step = value;
        } catch (e) {
          stepController.text = step.toString();
        }
      }
    });

    typeController.addListener(() {
      final text = typeController.text;
      if (text.isNotEmpty) {
        try {
          final value = int.parse(text);
          type = value;
        } catch (e) {
          typeController.text = type.toString();
        }
      }
    });

    amountController.addListener(() {
      final text = amountController.text;
      if (text.isNotEmpty) {
        try {
          final value = double.parse(text);
          amount = value;
        } catch (e) {
          amountController.text = amount.toString();
        }
      }
    });

    oldbalanceOrgController.addListener(() {
      final text = oldbalanceOrgController.text;
      if (text.isNotEmpty) {
        try {
          final value = double.parse(text);
          oldbalanceOrg = value;
        } catch (e) {
          oldbalanceOrgController.text = oldbalanceOrg.toString();
        }
      }
    });

    newbalanceOrigController.addListener(() {
      final text = newbalanceOrigController.text;
      if (text.isNotEmpty) {
        try {
          final value = double.parse(text);
          newbalanceOrig = value;
        } catch (e) {
          newbalanceOrigController.text = newbalanceOrig.toString();
        }
      }
    });

    oldbalanceDestController.addListener(() {
      final text = oldbalanceDestController.text;
      if (text.isNotEmpty) {
        try {
          final value = double.parse(text);
          oldbalanceDest = value;
        } catch (e) {
          oldbalanceDestController.text = oldbalanceDest.toString();
        }
      }
    });

    newbalanceDestController.addListener(() {
      final text = newbalanceDestController.text;
      if (text.isNotEmpty) {
        try {
          final value = double.parse(text);
          newbalanceDest = value;
        } catch (e) {
          newbalanceDestController.text = newbalanceDest.toString();
        }
      }
    });

    isFlaggedFraudController.addListener(() {
      final text = isFlaggedFraudController.text;
      if (text.isNotEmpty) {
        try {
          final value = int.parse(text);
          isFlaggedFraud = value;
        } catch (e) {
          isFlaggedFraudController.text = isFlaggedFraud.toString();
        }
      }
    });
  }

  @override
  void dispose() {
    stepController.dispose();
    typeController.dispose();
    amountController.dispose();
    oldbalanceOrgController.dispose();
    newbalanceOrigController.dispose();
    oldbalanceDestController.dispose();
    newbalanceDestController.dispose();
    isFlaggedFraudController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                //.
                //____________________________________ step ____________________________________
                TextFormField(
                  controller: stepController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'Step'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor, ingresa un valor.';
                    }
                    return null;
                  },
                ),
                //.
                //____________________________________ type ____________________________________
                DropdownButtonFormField<int>(
                  value: type,
                  onChanged: (int? value) {
                    setState(() {
                      type = value!;
                      typeController.text = value.toString();
                    });
                  },
                  decoration: const InputDecoration(labelText: 'type'),
                  items: const [
                    DropdownMenuItem(
                      value: 1,
                      child: Text('PAYMENT'),
                    ),
                    DropdownMenuItem(
                      value: 2,
                      child: Text('TRANSFER'),
                    ),
                    DropdownMenuItem(
                      value: 3,
                      child: Text('CASH_OUT'),
                    ),
                    DropdownMenuItem(
                      value: 4,
                      child: Text('DEBIT'),
                    ),
                    DropdownMenuItem(
                      value: 5,
                      child: Text('CASH_IN'),
                    ),
                  ],
                ),
                //.
                //____________________________________ amount ____________________________________
                TextFormField(
                  controller: amountController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'amount'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor, ingresa un valor.';
                    }
                    return null;
                  },
                ),
                //.
                //____________________________________ oldbalanceOrg ____________________________________
                TextFormField(
                  controller: oldbalanceOrgController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'oldbalanceOrg'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor, ingresa un valor.';
                    }
                    return null;
                  },
                ),
                //.
                //____________________________________ newbalanceOrig ____________________________________
                TextFormField(
                  controller: newbalanceOrigController,
                  keyboardType: TextInputType.number,
                  decoration:
                      const InputDecoration(labelText: 'newbalanceOrig'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor, ingresa un valor.';
                    }
                    return null;
                  },
                ),
                //.
                //____________________________________ oldbalanceDest ____________________________________
                TextFormField(
                  controller: oldbalanceDestController,
                  keyboardType: TextInputType.number,
                  decoration:
                      const InputDecoration(labelText: 'oldbalanceDest'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor, ingresa un valor.';
                    }
                    return null;
                  },
                ),
                //.
                //____________________________________ newbalanceDest ____________________________________
                TextFormField(
                  controller: newbalanceDestController,
                  keyboardType: TextInputType.number,
                  decoration:
                      const InputDecoration(labelText: 'newbalanceDest'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor, ingresa un valor.';
                    }
                    return null;
                  },
                ),
                //.
                //____________________________________ isFlaggedFraud ____________________________________
                DropdownButtonFormField<int>(
                  value: isFlaggedFraud,
                  onChanged: (int? value) {
                    setState(() {
                      isFlaggedFraud = value!;
                      isFlaggedFraudController.text = value.toString();
                    });
                  },
                  decoration:
                      const InputDecoration(labelText: 'isFlaggedFraud'),
                  items: const [
                    DropdownMenuItem(
                      value: 1,
                      child: Text('Si'),
                    ),
                    DropdownMenuItem(
                      value: 0,
                      child: Text('No'),
                    ),
                  ],
                ),
                //.
                //____________________________________ BOTON ____________________________________
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      // Llamada a la función que consume la API
                      print("boton");
                      double result = await apiService.getRentedValue(
                          step: step,
                          type: type,
                          amount: amount,
                          oldbalanceOrg: oldbalanceOrg,
                          newbalanceOrig: newbalanceOrig,
                          oldbalanceDest: oldbalanceDest,
                          newbalanceDest: newbalanceDest,
                          isFlaggedFraud: isFlaggedFraud);
                      // ignore: use_build_context_synchronously
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Datos enviados'),
                            content: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Text('Step: $step'),
                                Text('type: $type'),
                                Text('amount: $amount'),
                                Text('oldbalanceOrg: $oldbalanceOrg'),
                                Text('newbalanceOrig: $newbalanceOrig'),
                                Text('oldbalanceDest: $oldbalanceDest'),
                                Text('newbalanceDest: $newbalanceDest'),
                                Text('isFlaggedFraud: $isFlaggedFraud'),
                                Text('Predicción: $result'),
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
      ),
    );
  }
}
