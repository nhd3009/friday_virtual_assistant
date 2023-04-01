
import 'package:friday_virtual_assistant/HistoryChat.dart';

abstract class Repository{
  //GET
  Future<List<Historychat>> getHistoryChat();
  //DELETE
  Future<String> deleteHistoryChat(Historychat historychat);
  //POST
  // Future<void> postData(int id, String question, String content, bool isImage);
}