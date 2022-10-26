import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Enviroment {
  static String get fileName {
    if (kReleaseMode) {
      return '.env.production';
    }
    return '.env';
  }

  static const int receiveTimeout = 3000;
  static const int connectionTimeout = 5000;

  static String get apiUrl {
    return dotenv.env['API_URL'] ?? 'API_URL not found';
  }

  static String get apiKey_1 {
    return dotenv.env['API_KEY_1'] ?? 'API_KEY not found';
  }

  static String get apiKey_2 {
    return dotenv.env['API_KEY_2'] ?? 'API_KEY not found';
  }

  static String get apiKey_3 {
    return dotenv.env['API_KEY_3'] ?? 'API_KEY not found';
  }
}
