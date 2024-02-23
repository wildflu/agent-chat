


import 'package:chatagent/controller/chat_conttoller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

void main() {
  test('test the Convertation controller', ()async{
    ChatController chatController = Get.put(ChatController());
    chatController.onInit();
    await Future.delayed(const Duration(seconds: 1));
    await chatController.sendMessage();
    expect(chatController.convertation.length, 2);
  });
}