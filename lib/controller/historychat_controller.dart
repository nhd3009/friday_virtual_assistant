
import 'package:friday_virtual_assistant/HistoryChat.dart';
import 'package:friday_virtual_assistant/repository/repository.dart';
import 'package:http/http.dart' as http;

class HistoryChatController{
  late final Repository _repository;

  HistoryChatController(this._repository);

  //Get
  Future<List<Historychat>> fetchChatList() async{
    return _repository.getHistoryChat();
  }

  //Delete
  Future<String> deleteChat(Historychat historychat) async{
    return _repository.deleteHistoryChat(historychat);
  }

  //post
  Future<void> postData(String question, String content, bool isImage) async {
    final url = Uri.parse('http://hicupcake.somee.com/api/HistoryChat?question=${question}&content=${content}&isImage=${isImage}');
    try {
      final respons3 = await http.post(url).then((resopons3) {
        if(resopons3.statusCode == 200){
          print('POST REQUEST SUCCESSFUL');
        }
        else{
          print('Error: ${resopons3.statusCode}');
        }
      });
      // final response = await http.post(url, headers: headers);
      // if (response.statusCode == 200) {
      //   print('POST request successful');
      // } else {
      //   print('Error: ${response.statusCode}');
      // }
    } catch (error) {
      print('Error: $error');
    }
  }
}