import 'package:ajouthon2023/constant/getx/get_rx_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

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
          appBar: state.index > 0
              ? AppBar(
                  backgroundColor: context.theme.scaffoldBackgroundColor,
                  leading: BackButton(
                    onPressed: controller.onPressedBack,
                    color: Colors.black,
                  ),
                )
              : null,
          backgroundColor: Colors.white,
          body: SafeArea(
            child: IndexedStack(
              index: state.index,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    FractionallySizedBox(
                      widthFactor: 2 / 3,
                      child: Center(
                        //학년 입력 TextField
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          onChanged: controller.onChangedGrade,
                          style: TextStyle(color: Colors.black),
                          decoration: const InputDecoration(
                            labelText: "학년을 입력해주세요",
                            floatingLabelStyle: TextStyle(color: Colors.black),
                            labelStyle: TextStyle(color: Colors.black),
                            enabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, color: Colors.black)),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 25),
                    FractionallySizedBox(
                      widthFactor: 2 / 3,
                      child: TextButton(
                        onPressed: controller.onPressedDepartment,
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          side: BorderSide(color: Colors.black),
                        ),
                        child: Text(state.department == -1 ? "학과를 선택하세요" : state.departmentList[state.department]),
                      ),
                    ),
                    SizedBox(height: 25),
                    FractionallySizedBox(
                      widthFactor: 2 / 3,
                      child: TextFormField(
                        onChanged: controller.onChangedId,
                        keyboardType: TextInputType.number,
                        style: TextStyle(color: Colors.black),
                        decoration: const InputDecoration(
                          labelText: "학번을 입력해주세요",
                          floatingLabelStyle: TextStyle(color: Colors.black),
                          labelStyle: TextStyle(color: Colors.black),
                          enabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, color: Colors.black)),
                        ),
                      ),
                    ),
                    Center(
                      //과목 선택 버튼
                      child: OutlinedButton(
                        onPressed: true
                            // state.isFirst
                            ? controller.onPressedNext
                            : null,
                        child: Text("다음"),
                      ),
                    ),
                  ],
                ), //인덱스 0 인트로 페이지
                Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Center(
                        child: Text(
                          "복수전공/부전공을 하고 있나요?",
                          style: TextStyle(fontSize: 25),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(onPressed: () => controller.onPressedIndex(1), child: Text("네")),
                          TextButton(onPressed: () => controller.onPressedIndex(2), child: Text("아니요")),
                        ],
                      ),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("복수전공/부전공을 하고 있나요?", style: TextStyle(fontSize: 25)),
                    SizedBox(height: 20),
                    Center(
                      child: FractionallySizedBox(
                        widthFactor: 2 / 3,
                        child: TextButton(
                          onPressed: controller.onPressedPluralIndex,
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical: 20),
                            side: BorderSide(color: Colors.black),
                          ),
                          child: Text(state.pluralIndex == -1 ? "전공 유형을 선택하세요" : state.majorList[state.pluralIndex]),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Center(
                      child: FractionallySizedBox(
                        widthFactor: 2 / 3,
                        child: TextButton(
                          onPressed: controller.onPressedPluralMajor,
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical: 20),
                            side: BorderSide(color: Colors.black),
                          ),
                          child: Text(state.pluralMajor == -1 ? "학과를 선택하세요" : state.departmentList[state.pluralMajor]),
                        ),
                      ),
                    ),
                    Center(
                      //과목 선택 버튼
                      child: OutlinedButton(
                        onPressed: () => controller.onPressedIndex(1),
                        child: Text("다음"),
                      ),
                    ),
                  ],
                ),
                Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Center(
                        child: Text(
                          "이전에 교환학생을 다녀오셨나요?",
                          style: TextStyle(fontSize: 25),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(onPressed: () => controller.onPressedIndex(1), child: Text("네")),
                          TextButton(onPressed: () => controller.onPressedIndex(2), child: Text("아니요")),
                        ],
                      ),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("이전에 교환학생을 다녀오셨나요?", style: TextStyle(fontSize: 25)),
                    SizedBox(height: 20),
                    FractionallySizedBox(
                      widthFactor: 2 / 3,
                      child: TextFormField(
                        onChanged: controller.onChangedExchangeGrade,
                        keyboardType: TextInputType.number,
                        style: TextStyle(color: Colors.black),
                        decoration: const InputDecoration(
                          labelText: "이수 학점을 입력해주세요",
                          floatingLabelStyle: TextStyle(color: Colors.black),
                          labelStyle: TextStyle(color: Colors.black),
                          enabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, color: Colors.black)),
                        ),
                      ),
                    ),
                    Center(
                      //과목 선택 버튼
                      child: OutlinedButton(
                        onPressed: () => controller.onPressedIndex(1),
                        child: Text("다음"),
                      ),
                    ),
                  ],
                ),
                Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Center(
                        child: Text(
                          "이전에 현장실습을 하셨었나요?",
                          style: TextStyle(fontSize: 25),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(onPressed: () => controller.onPressedIndex(1), child: Text("네")),
                          TextButton(onPressed: () => controller.onPressedIndex(2), child: Text("아니요")),
                        ],
                      ),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("이전에 현장실습을 하셨었나요?", style: TextStyle(fontSize: 25)),
                    SizedBox(height: 20),
                    FractionallySizedBox(
                      widthFactor: 2 / 3,
                      child: TextFormField(
                        onChanged: controller.onChangedFieldPracticeGrade,
                        keyboardType: TextInputType.number,
                        style: TextStyle(color: Colors.black),
                        decoration: const InputDecoration(
                          labelText: "이수 학점을 입력해주세요",
                          floatingLabelStyle: TextStyle(color: Colors.black),
                          labelStyle: TextStyle(color: Colors.black),
                          enabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, color: Colors.black)),
                        ),
                      ),
                    ),
                    Center(
                      //과목 선택 버튼
                      child: OutlinedButton(
                        onPressed: () => controller.onPressedIndex(1),
                        child: Text("다음"),
                      ),
                    ),
                  ],
                ),
                Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Center(
                        child: Text(
                          "이전에 파란학기를 진행하셨었나요?",
                          style: TextStyle(fontSize: 25),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(onPressed: () => controller.onPressedIndex(1), child: Text("네")),
                          TextButton(onPressed: () => controller.onPressedIndex(2), child: Text("아니요")),
                        ],
                      ),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("이전에 파란학기를 진행하셨었나요?", style: TextStyle(fontSize: 25)),
                    SizedBox(height: 20),
                    FractionallySizedBox(
                      widthFactor: 2 / 3,
                      child: TextFormField(
                        onChanged: controller.onChangedParanGrade,
                        keyboardType: TextInputType.number,
                        style: TextStyle(color: Colors.black),
                        decoration: const InputDecoration(
                          labelText: "이수 학점을 입력해주세요",
                          floatingLabelStyle: TextStyle(color: Colors.black),
                          labelStyle: TextStyle(color: Colors.black),
                          enabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, color: Colors.black)),
                        ),
                      ),
                    ),
                    Center(
                      //과목 선택 버튼
                      child: OutlinedButton(
                        onPressed: () => controller.onPressedIndex(1),
                        child: Text("다음"),
                      ),
                    ),
                  ],
                ),
                Center()
              ],
            ),
          ),
        );
      }),
    );
  }
}
