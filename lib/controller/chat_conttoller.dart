


import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  
  List messages = [];
  DialogAuthCredentials ?credentials;
  DialogFlowtter ?instance;

  void sendMessage() async {
    DetectIntentResponse response = await instance!.detectIntent(
      queryInput: QueryInput(text: TextInput(text: "Hi", languageCode: "en",)),
    );
    String? textResponse = response.text;
  }

  
  @override
  void onInit() async{
    super.onInit();
    credentials = await DialogAuthCredentials.fromFile('assets/agant-chat-byuh-4635c14e299b.json');
    instance = DialogFlowtter(credentials: credentials!, sessionId: '1');
    sendMessage();
  }
}

