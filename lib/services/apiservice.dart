import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class ApiService with ChangeNotifier {
  final String baseUrl =
      'https://fraudml-service-christianreyes11.cloud.okteto.net';

  Future<double> getRentedValue(
      {required int step,
      required int type,
      required double amount,
      required double oldbalanceOrg,
      required double newbalanceOrig,
      required double oldbalanceDest,
      required double newbalanceDest,
      required int isFlaggedFraud}) async {
    final Uri url = Uri.parse('$baseUrl/score');
    // ignore: avoid_print
    print(url);

    // Construye el cuerpo de la solicitud, si es necesario
    final Map<String, dynamic> requestBody = {
      'Step': step,
      'Type': type,
      'Amount': amount,
      'OldbalanceOrig': oldbalanceOrg,
      'NewbalanceOrig': newbalanceOrig,
      'OldbalanceDest': oldbalanceDest,
      'NewbalanceDest': newbalanceDest,
      'IsflaggedFraud': isFlaggedFraud,
    };
    print(jsonEncode(requestBody));

    final response = await http.post(
      url,
      headers: {
        'Content-type': 'application/json',
      },
      body: jsonEncode(requestBody),
    );
    print(response.body);

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      // El valor entero que recibes se encuentra en responseData
      return responseData['isFraud'];
    } else {
      throw Exception('Error al consumir la API');
    }
  }
}
