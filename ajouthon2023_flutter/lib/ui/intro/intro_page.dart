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
                  //학년 입력 TextField
                  child: TextField(
                    onChanged: controller.onChangedGrade,
                    style: TextStyle(color: Colors.blue),
                    decoration: const InputDecoration(
                      labelText: "학년을 입력해주세요",
                      floatingLabelStyle: TextStyle(color: Colors.blue),
                      labelStyle: TextStyle(color: Colors.blue),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)), borderSide: BorderSide(width: 1, color: Colors.blueAccent)),
                    ),
                  ),
                ),
                Center(
                  //학과 입력 DropdownButton
                  child: DropdownButton<int>(
                    onChanged: controller.onChangedDepartment,
                    value: state.department,
                    items: state.departmentList.asMap().entries.map((x) {
                      return DropdownMenuItem(
                        value: x.key,
                        child: Text(
                          x.value,
                          style: TextStyle(color: Colors.blue),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                Center(
                  //학번 입력 TextField
                  child: TextField(
                    onChanged: controller.onChangedId,
                    style: TextStyle(color: Colors.blue),
                    decoration: const InputDecoration(
                      labelText: "학번을 입력해주세요",
                      floatingLabelStyle: TextStyle(color: Colors.blue),
                      labelStyle: TextStyle(color: Colors.blue),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)), borderSide: BorderSide(width: 1, color: Colors.blueAccent)),
                    ),
                  ),
                ),
                Row(
                  //복수전공 체크 버튼
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('파란색 '),
                    Transform.scale(
                      scale: 1.5,
                      child: Checkbox(
                        activeColor: Colors.white,
                        hoverColor: Colors.grey,
                        checkColor: Colors.green,
                        value: state.isPluralMajor,
                        onChanged: controller.onChangedPluralMajor,
                      ),
                    ),
                  ],
                ),
                Row(
                  //교환학생 체크 여부
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('파란색 '),
                    Transform.scale(
                      scale: 1.5,
                      child: Checkbox(
                        activeColor: Colors.white,
                        hoverColor: Colors.grey,
                        checkColor: Colors.green,
                        value: state.isPluralMajor,
                        onChanged: controller.onChangedPluralMajor,
                      ),
                    ),
                  ],
                ),
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
