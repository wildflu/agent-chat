


import 'package:chatagent/model/message.dart';
import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  TextEditingController messageController = TextEditingController();
  List<Amessage> convertation = [
  ];

  DialogAuthCredentials ?credentials;
  DialogFlowtter ?instance;

  Future sendMessage() async {
    if(messageController.text.isEmpty) return;
    FocusManager.instance.primaryFocus?.unfocus();
    convertation.add(Amessage(text: messageController.text, isQuestion: true));
    update();
    DetectIntentResponse response = await instance!.detectIntent(
      queryInput: QueryInput(text: TextInput(text: messageController.text, languageCode: "en",)),
    );
    messageController.clear();
    String? textResponse = response.text;
    convertation.add(Amessage(text: textResponse!, isQuestion: false));
    update();
  }

  @override
  void onInit() async{
    super.onInit();
    credentials = await DialogAuthCredentials.fromFile('assets/agant-chat-byuh-4635c14e299b.json');
    instance = DialogFlowtter(credentials: credentials!, sessionId: '1');
  }
}

