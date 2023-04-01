
import 'package:friday_virtual_assistant/HistoryChat.dart';
import 'package:friday_virtual_assistant/repository/repository.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HistoryChatRepository implements Repository{
  //use http
  String dataURL = 'http://hicupcake.somee.com/api/HistoryChat';
  @override
  Future<String> deleteHistoryChat(Historychat historychat) async {
    var url = Uri.parse('$dataURL/${historychat.id}');
    var result = 'false';
    await http.delete(url).then((value){
      print(value.body);
      return result = 'True';
    });
    return result;
  }

  @override
  Future<List<Historychat>> getHistoryChat() async {
    List<Historychat> chatList = [];

    var url = Uri.parse('$dataURL');
    var response = await http.get(url);
    print('status code: ${response.statusCode}');
    var body = jsonDecode(response.body);
    //parse
    for(var i = 0; i < body.length; i++){
      chatList.add(Historychat.fromJson(body[i]));
    }

    return chatList;
  }

  
}