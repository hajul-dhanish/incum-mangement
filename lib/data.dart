import 'dart:convert';
import 'package:http/http.dart' as http;

class Album {
  final dynamic id;
  final String date;
  final String expense;
  final String income;
  final String inhand;

  const Album(
      {required this.id,
      required this.date,
      required this.expense,
      required this.income,
      required this.inhand});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      id: json['_id'],
      date: json['date'],
      expense: json['expense'],
      income: json['income'],
      inhand: json['inhand'],
    );
  }
}

// convert
Future<Album> createAlbum(
    String date, String expense, String income, String inhand) async {
  final response = await http.post(
    Uri.parse('https://royaldine.herokuapp.com/showeandiapi'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      'date': date,
      'expense': expense,
      'income': income,
      'inhand': inhand,
    }),
  );

  if (response.statusCode == 201) {
    return Album.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to create album.');
  }
}

// fetch
Future<Album> fetchAlbum() async {
  final response = await http.get(
      Uri.parse('https://mocki.io/v1/816345e3-714b-4e1d-a6d5-bfe5e16a73b3'));

  if (response.statusCode == 200) {
    return Album.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load album');
  }
}
