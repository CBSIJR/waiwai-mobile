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
      List<dynamic> jsonResponse = jsonDecode(utf8.decode(response.bodyBytes));

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
      List<dynamic> jsonResponse = jsonDecode(utf8.decode(response.bodyBytes));

      // Filter out non-map items and cast the rest to Map<String, Object?>
      List<ReferencesCompanion> references =
          jsonResponse.whereType<Map<String, Object?>>().map((item) {
        final id = item['id'] as int;
        final year = item['year'] as int;
        final reference = item['reference'] as String;
        final authors = item['authors'] as String;
        final url = item['url'] as String?;

        return ReferencesCompanion.insert(
            id: Value(id),
            reference: reference,
            url: Value(url),
            year: year,
            authors: authors);
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
      List<dynamic> jsonResponse = jsonDecode(utf8.decode(response.bodyBytes));

      // Filter out non-map items and cast the rest to Map<String, Object?>
      List<WordsCompanion> words =
          jsonResponse.whereType<Map<String, Object?>>().map((item) {
        final id = item['id'] as int;
        final word = item['word'] as String;
        final phonemic = item['phonemic'] as String?;
        final createdAt = DateTime.parse(item['created_at'] as String);
        final updatedAt = DateTime.parse(item['updated_at'] as String);
        final userId = item['user_id'] as int;

        return WordsCompanion.insert(
            id: Value(id),
            word: word,
            phonemic: Value(phonemic),
            createdAt: createdAt,
            updatedAt: updatedAt,
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
      List<dynamic> jsonResponse = jsonDecode(utf8.decode(response.bodyBytes));

      // Filter out non-map items and cast the rest to Map<String, Object?>
      List<MeaningsCompanion> words =
          jsonResponse.whereType<Map<String, Object?>>().map((item) {
        final id = item['id'] as int;
        final meaningPt = item['meaning_pt'] as String;
        final meaningWw = item['meaning_wwt'] as String?;
        final commentPt = item['comment_pt'] as String?;
        final commentWw = item['comment_ww'] as String?;
        final createdAt = DateTime.parse(item['created_at'] as String);
        final updatedAt = DateTime.parse(item['updated_at'] as String);
        final wordId = item['word_id'] as int;
        final referenceId = item['reference_id'] as int;
        final userId = item['user_id'] as int;
        return MeaningsCompanion.insert(
            id: Value(id),
            meaningPt: meaningPt,
            meaningWw: Value(meaningWw),
            commentPt: Value(commentPt),
            commentWw: Value(commentWw),
            createdAt: createdAt,
            updatedAt: updatedAt,
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

  Future<MessageApi> getExportCategories() async {
    late MessageApi result;

    Response response = await get(
      Uri.parse(AppUrl.categoriasExportRoute),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      // Parse the JSON response
      List<dynamic> jsonResponse = jsonDecode(utf8.decode(response.bodyBytes));

      // Filter out non-map items and cast the rest to Map<String, Object?>
      List<CategoriesCompanion> words =
          jsonResponse.whereType<Map<String, Object?>>().map((item) {
        final id = item['id'] as int;

        final category = item['category'] as String;
        final description = item['description'] as String;

        return CategoriesCompanion.insert(
            id: Value(id), category: category, description: description);
      }).toList();
      result = MessageApi(detail: 'Successful', status: true, data: words);
    } else {
      throw MessageApiException(detail: 'Categorias');
    }
    return result;
  }

  Future<MessageApi> getExportAttachments() async {
    late MessageApi result;

    Response response = await get(
      Uri.parse(AppUrl.anexosExportRoute),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      // Parse the JSON response
      List<dynamic> jsonResponse = jsonDecode(utf8.decode(response.bodyBytes));

      // Filter out non-map items and cast the rest to Map<String, Object?>
      List<AttachmentsCompanion> words =
          jsonResponse.whereType<Map<String, Object?>>().map((item) {
        final id = item['id'] as int;
        final uuid = item['uuid'] as String;
        final fileName = item['filename'] as String;
        final fileDir = item['filedir'] as String;
        final url = item['url'] as String;
        final contentType = item['content_type'] as String;
        final createdAt = DateTime.parse(item['created_at'] as String);
        final updatedAt = DateTime.parse(item['updated_at'] as String);
        final wordId = item['word_id'] as int;
        final userId = item['user_id'] as int;

        return AttachmentsCompanion.insert(
            id: Value(id),
            uuid: uuid,
            fileName: fileName,
            fileDir: fileDir,
            url: url,
            contentType: contentType,
            createdAt: createdAt,
            updatedAt: updatedAt,
            wordId: wordId,
            userId: userId);
      }).toList();
      result = MessageApi(detail: 'Successful', status: true, data: words);
    } else {
      throw MessageApiException(detail: 'Anexos');
    }
    return result;
  }

  Future<MessageApi> getExportWordCategories() async {
    late MessageApi result;

    Response response = await get(
      Uri.parse(AppUrl.palavracategoriasExportRoute),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      // Parse the JSON response
      List<dynamic> jsonResponse = jsonDecode(utf8.decode(response.bodyBytes));

      // Filter out non-map items and cast the rest to Map<String, Object?>
      List<WordCategoriesCompanion> words =
          jsonResponse.whereType<Map<String, Object?>>().map((item) {
        final wordId = item['word_id'] as int;
        final categoryId = item['category_id'] as int;
        return WordCategoriesCompanion.insert(
            wordId: wordId, categoryId: categoryId);
      }).toList();
      result = MessageApi(detail: 'Successful', status: true, data: words);
    } else {
      throw MessageApiException(detail: 'Palavra e Categorias');
    }
    return result;
  }
}
