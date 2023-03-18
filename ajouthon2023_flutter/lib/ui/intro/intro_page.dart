import 'package:ajouthon2023/constant/getx/get_rx_impl.dart';
import 'package:flutter/material.dart';

import '../../constant/extension.dart';
import 'intro_page_controller.dart';

class IntroPage extends GetView<IntroPageController> {
  const IntroPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: controller.onWillPop,
      child: controller.rx((state) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Column(
              children: [
                Center(
                  //과목 선택 버튼
                  child: OutlinedButton(
                    onPressed: controller.onPressedNext,
                    child: Text("다음"),
                  ),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
