

import 'package:chatagent/controller/chat_conttoller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:typewritertext/typewritertext.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[
            Colors.black,
            Color(0xFF78ACFF),
          ])
        ),
        child: GetBuilder<ChatController>(
          init: ChatController(),
          builder: (controller) {
            return Column(
              children: [
                Expanded(
                  child: controller.convertation.isEmpty
                    ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset('assets/empty_list.svg', width: 200, height: 200,),
                          const Gap(30),
                          const Text('Start Your Chat', style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w500),)
                        ],
                      ),
                    )
                    : ListView.builder(
                    itemCount: controller.convertation.length,
                    itemBuilder: (context, index) {
                      bool isQuestion = controller.convertation[index].isQuestion;
                      return Align(
                        alignment: isQuestion? Alignment.topRight : Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          child: TypeWriterText(
                            text: Text(controller.convertation[index].text, style: const TextStyle(height: 2, color: Colors.white)),
                            duration: const Duration(milliseconds: 50),
                            maintainSize: false,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                
                Container(
                  margin: const EdgeInsets.all(0),
                  padding: const EdgeInsets.only(bottom: 20,top: 10, left: 10,right: 10),
                  height: 80,
                  child: TextFormField(
                    controller: controller.messageController,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(10),
                      hintText: 'what is it ',
                      hintStyle: const TextStyle(color: Colors.white),
                      filled: true,
                      fillColor: Colors.black26,
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(5), borderSide: const BorderSide(width: 1, color: Colors.black26)),
                      errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5), borderSide: const BorderSide(width: 1, color: Colors.black26)),
                      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5), borderSide: const BorderSide(width: 1, color: Colors.black26)),
                      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5), borderSide: const BorderSide(width: 1, color: Colors.black26)),
                      suffixIcon: IconButton(onPressed: (){
                        controller.sendMessage();
                        },
                        icon: const Icon(Icons.send, color: Color(0xFF78ACFF),))
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}