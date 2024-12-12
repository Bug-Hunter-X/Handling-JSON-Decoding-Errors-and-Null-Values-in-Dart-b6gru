```dart
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      final responseBody = response.body;
      if(responseBody.isEmpty){
        print('Empty JSON response');
        return;
      }
      final jsonData = jsonDecode(responseBody);
      if (jsonData is List && jsonData.isNotEmpty) {
        final firstElement = jsonData[0];
        print('First element: $firstElement');
      } else {
        print('Invalid or empty JSON data');
      }
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  } catch (e) {
    print('Error: $e');
  }
}
```