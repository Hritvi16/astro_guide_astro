import 'package:astro_guide_astro/models/chat/ChatDetailModel.dart';
import 'package:astro_guide_astro/models/chat/ChatMissedModel.dart';
import 'package:astro_guide_astro/models/chat/ChatResponseModel.dart';
import 'package:astro_guide_astro/models/chat/CheckChatResponseModel.dart';
import 'package:astro_guide_astro/models/chat/ChatListModel.dart';
import 'package:astro_guide_astro/models/quickReplies/QuickRepliesListModel.dart';
import 'package:astro_guide_astro/models/response/ResponseModel.dart';
import 'package:astro_guide_astro/models/chat/ChatModel.dart';
import 'package:astro_guide_astro/repositories/ChatRepository.dart';
import 'package:get/get_connect/http/src/multipart/form_data.dart';

class ChatProvider {
  final ChatRepository chatRepository;

  ChatProvider(this.chatRepository);

  Future<ChatListModel> fetch(String token, String endpoint) async {
    var chatListResponse = await chatRepository.fetch(token, endpoint);

    return ChatListModel.fromJson(chatListResponse);
  }

  Future<ChatDetailModel> fetchByID(String token, String endpoint, Map<String, dynamic> body) async {
    var chatListResponse = await chatRepository.fetchByID(token, endpoint, body);

    return ChatDetailModel.fromJson(chatListResponse);
  }
  //
  // Future<CheckChatResponseModel> check(String token, String endpoint, Map<String, dynamic> body) async {
  //   var checkChatResponse = await chatRepository.fetchByID(token, endpoint, body);
  //
  //   return CheckChatResponseModel.fromJson(checkChatResponse);
  // }

  Future<ResponseModel> initiate(String token, String endpoint, Map<String, dynamic> body) async {
    var response = await chatRepository.fetchByID(token, endpoint, body);

    return ResponseModel.fromJson(response);
  }

  Future<ChatMissedModel> reconnect(String token, String endpoint, Map<String, dynamic> body) async {
    var response = await chatRepository.fetchByID(token, endpoint, body);

    return ChatMissedModel.fromJson(response);
  }

  Future<ChatResponseModel> send(FormData formData, String token) async {
    var chatResponse = await chatRepository.send(formData, token);

    return ChatResponseModel.fromJson(chatResponse);
  }


  Future<ResponseModel> manage(String token, String endpoint, Map<String, dynamic> body) async {
    var response = await chatRepository.fetchByID(token, endpoint, body);

    return ResponseModel.fromJson(response);
  }

  Future<QuickRepliesListModel> fetchQuickReplies(String token, String endpoint) async {
    var response = await chatRepository.fetch(token, endpoint);

    return QuickRepliesListModel.fromJson(response);
  }

  Future<ResponseModel> delete(String token, String endpoint) async {
    var responseModel = await chatRepository.fetch(token, endpoint);

    return ResponseModel.fromJson(responseModel);
  }
}
