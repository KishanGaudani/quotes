import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/lines_data.dart';

class QuoteAPIHelper {
  QuoteAPIHelper._();

  static final QuoteAPIHelper quoteAPIHelper = QuoteAPIHelper._();

  Future<List<QuoteData>?> fetchingUserData({required String name}) async {
    http.Response response = await http.get(
        Uri.parse(
            "https://api.api-ninjas.com/v1/quotes?category=$name&limit=10"),
        headers: {'X-Api-Key': 'aiDw8vt6l6n27GVF9nevQBCvyM8T7ocC8QPYBiqZ'});

    if (response.statusCode == 200) {
      List decodedData = jsonDecode(response.body);

      List<QuoteData> quoteList = List.generate(decodedData.length,
          (index) => QuoteData.fromMap(e: decodedData[index]));

      return quoteList;
    }
    return null;
  }
}
