import 'package:flutter_dotenv/flutter_dotenv.dart';

class Config {
  // Rapid Host Endpoint
  static String baseUrl = dotenv.get("API_URL");
  static const int receiveTimeout = 15000;
  static const int connectionTimeout = 15000;
  static String apiKey = dotenv.get("API_KEY");

  // // Server Secrate Token
  // static String token = 'Bearer ' + dotenv.get("API_TOKEN");
}
