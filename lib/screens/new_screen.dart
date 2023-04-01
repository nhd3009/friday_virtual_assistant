import 'package:flutter/material.dart';
import 'package:friday_virtual_assistant/HistoryChat.dart';
import 'package:friday_virtual_assistant/controller/historychat_controller.dart';
import 'package:friday_virtual_assistant/repository/HistoryChatRepository.dart';

class MyScreen extends StatefulWidget {
  @override
  _MyScreenState createState() => _MyScreenState();
}

class _MyScreenState extends State<MyScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    var historyChatController = HistoryChatController(HistoryChatRepository());

    return Scaffold(
      appBar: AppBar(title: Text('History Chat'),),
      body: FutureBuilder<List<Historychat>>(
        future: historyChatController.fetchChatList(),
        builder: (BuildContext context, AsyncSnapshot snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator());
          }

          if(snapshot.hasError) {
            return Center(
              child: Text('ERROR'),
            );
          }
          return SafeArea(
              child: ListView.separated(
                  itemBuilder: (context, index){
                    var historychat = snapshot.data[index];
                    return Container(
                      height: 100.0,
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        children: [
                          Expanded(flex: 3, child: Text('${historychat.question}')),

                          historychat.isImage
                              ? Expanded(
                                flex: 5,
                                child: Image.network(historychat.content),
                              )
                              : Expanded(
                                  flex: 5,
                                  child: Text(
                                    '${historychat.content}',
                                    maxLines: 10,
                                    overflow: TextOverflow.ellipsis,
                              ),
                          ),
                          Expanded(flex: 1, child: Row(
                            children: [
                              InkWell(
                                onTap: (){
                                    setState(() {
                                      historyChatController.deleteChat(historychat!).then((value){
                                        ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(
                                              duration: const Duration(microseconds: 2000),
                                              content: Text('$value'),
                                            )
                                        );
                                      });
                                  });
                                },
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(10)
                                  ),
                                  child: Center(
                                    child: Text('Delete'),
                                  ),
                                ),
                              ),
                            ],
                          )),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index){
                    return Divider(thickness: 0.5, height: 0.5);
                  },
                  itemCount: snapshot.data?.length ?? 0),
          );
        },
      ),
    );
  }
}