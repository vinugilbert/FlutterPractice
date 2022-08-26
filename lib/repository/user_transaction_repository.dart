import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
class UserTransactionRepository {


 getUserTransactions()  async {
    final url = Uri.parse("https://demo9990262.mockable.io/login");
    var response = await http.post(url);
     return json.decode(response.body);
  }
}