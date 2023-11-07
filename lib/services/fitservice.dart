import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class FitService with ChangeNotifier {
  final String baseUrl =
      'https://api.github.com/repos/christianreyes11/fraud-fastapi/dispatches';

  Future<void> getFit({
    required int dataset,
  }) async {
    final Uri url = Uri.parse(baseUrl);
    // ignore: avoid_print
    print(url);
    String dataseturl = "";
    switch (dataset) {
      case 1:
        dataseturl =
            "https://firebasestorage.googleapis.com/v0/b/fraud-e714e.appspot.com/o/fraud.csv?alt=media&token=3dd10f58-cf1f-4c2c-93b2-1971d3db77ab";
        break;
      case 2:
        dataseturl =
            "https://firebasestorage.googleapis.com/v0/b/fraud-e714e.appspot.com/o/fraud_55.csv?alt=media&token=414fd847-ab93-4f37-aa99-cdf6c8ef2e47";
        break;
      case 3:
        dataseturl =
            "https://firebasestorage.googleapis.com/v0/b/fraud-e714e.appspot.com/o/fraud_100.csv?alt=media&token=0d352c66-67f8-401f-97d9-453c297992d0";
        break;
    }

    // Construye el cuerpo de la solicitud, si es necesario
    final Map<String, dynamic> requestBody = {
      "event_type": "ml_ci_cd",
      "client_payload": {"dataseturl": dataseturl, "sha": "chris"}
    };
    print(jsonEncode(requestBody));

    final response = await http.post(
      url,
      headers: {
        'Authorization': 'Bearer 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',
        'Accept': 'application/vnd.github.v3+json',
        'Content-type': 'application/json',
      },
      body: jsonEncode(requestBody),
    );
  }
}
