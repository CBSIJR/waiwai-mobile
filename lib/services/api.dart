import 'dart:async';
import 'dart:convert';
import 'package:dicionario_waiwai/database/database.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:dicionario_waiwai/util/app_url.dart';
import 'package:drift/drift.dart';

// https://gist.githubusercontent.com/shubie/07d238f857632eaacea8e4c60d700b2d/raw/cf4c60c4c4f6cc0b0176ea667b2f4c8b4e91c7cc/flutter-thursday-13-02.dart
//https://dart.dev/tools/linter-rules/avoid_print

abstract class Message {
  String get detail;
  bool get status;
}

class MessageApi<T> implements Message {
  @override
  final String detail;
  @override
  final bool status;
  final T data;

  MessageApi({required this.detail, required this.status, required this.data});
}

class MessageApiException implements Exception, Message {
  @override
  final String detail;
  @override
  final bool status = false;

  MessageApiException({required this.detail});
}

class WaiWaiApiProvider with ChangeNotifier {
  Future<MessageApi> getExportUsers() async {
    late MessageApi result;

    Response response = await get(
      Uri.parse(AppUrl.usuariosExportRoute),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      // Parse the JSON response
      List<dynamic> jsonResponse = jsonDecode(response.body);

      // Filter out non-map items and cast the rest to Map<String, Object?>
      List<UsersCompanion> users =
          jsonResponse.whereType<Map<String, Object?>>().map((item) {
        final id = item['id'] as int;
        final fullName = item['full_name'] as String;

        return UsersCompanion.insert(id: Value(id), fullName: fullName);
      }).toList();
      result = MessageApi(detail: 'Successful', status: true, data: users);
    } else {
      throw MessageApiException(detail: 'Usuários');
    }
    return result;
  }

  Future<MessageApi> getExportReferences() async {
    late MessageApi result;

    Response response = await get(
      Uri.parse(AppUrl.referenciasExportRoute),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      // Parse the JSON response
      List<dynamic> jsonResponse = jsonDecode(response.body);

      // Filter out non-map items and cast the rest to Map<String, Object?>
      List<ReferencesCompanion> references =
          jsonResponse.whereType<Map<String, Object?>>().map((item) {
        final id = item['id'] as int;
        final reference = item['reference'] as String;
        final url = item['url'] as String?;
        return ReferencesCompanion.insert(
            id: Value(id), reference: reference, url: Value(url));
      }).toList();
      result = MessageApi(detail: 'Successful', status: true, data: references);
    } else {
      throw MessageApiException(detail: 'Referências');
    }
    return result;
  }

  Future<MessageApi> getExportWords() async {
    late MessageApi result;

    Response response = await get(
      Uri.parse(AppUrl.palavrasExportRoute),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      // Parse the JSON response
      List<dynamic> jsonResponse = jsonDecode(response.body);

      // Filter out non-map items and cast the rest to Map<String, Object?>
      List<WordsCompanion> words =
          jsonResponse.whereType<Map<String, Object?>>().map((item) {
        final id = item['id'] as int;
        final word = item['word'] as String;
        final phonemic = item['phonemic'] as String?;
        final createdAt = DateTime.parse(item['created_at'] as String);
        final updateAt = DateTime.parse(item['update_at'] as String);
        final userId = item['user_id'] as int;

        return WordsCompanion.insert(
            id: Value(id),
            word: word,
            phonemic: Value(phonemic),
            createdAt: createdAt,
            updateAt: updateAt,
            userId: userId);
      }).toList();
      result = MessageApi(detail: 'Successful', status: true, data: words);
    } else {
      throw MessageApiException(detail: 'Palavras');
    }
    return result;
  }

  Future<MessageApi> getExportMeanings() async {
    late MessageApi result;

    Response response = await get(
      Uri.parse(AppUrl.significadosExportRoute),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      // Parse the JSON response
      List<dynamic> jsonResponse = jsonDecode(response.body);

      // Filter out non-map items and cast the rest to Map<String, Object?>
      List<MeaningsCompanion> words =
          jsonResponse.whereType<Map<String, Object?>>().map((item) {
        final id = item['id'] as int;
        final meaning = item['meaning'] as String;
        final comment = item['comment'] as String?;
        final chapterId = item['chapter_id'] as int?;
        final entryId = item['entry_id'] as int?;
        final wordId = item['word_id'] as int;
        final referenceId = item['reference_id'] as int;
        final userId = item['user_id'] as int;

        return MeaningsCompanion.insert(
            id: Value(id),
            meaning: meaning,
            comment: Value(comment),
            chapterId: Value(chapterId),
            entryId: Value(entryId),
            wordId: wordId,
            referenceId: referenceId,
            userId: userId);
      }).toList();
      result = MessageApi(detail: 'Successful', status: true, data: words);
    } else {
      throw MessageApiException(detail: 'Significados');
    }
    return result;
  }
}
