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
                    Center(
                      child: Text(
                        "학적 정보를 입력해주세요",
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    FractionallySizedBox(
                      widthFactor: 2 / 3,
                      child: TextButton(
                        onPressed: controller.onPressedGrade,
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          side: BorderSide(color: Colors.black),
                        ),
                        child: Text(state.grade == -1
                            ? "학년을 선택하세요"
                            : '${(state.grade + 2) ~/ 2}-${(state.grade + 2) % 2 + 1}학기'),
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
                        child: Text(state.department == -1
                            ? "학과를 선택하세요"
                            : state.departmentList[state.department]),
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
                          labelText: "학번을 입력해주세요 (ex.202312345)",
                          floatingLabelStyle: TextStyle(color: Colors.black),
                          labelStyle: TextStyle(color: Colors.black),
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 1, color: Colors.black)),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      //과목 선택 버튼
                      child: OutlinedButton(
                        onPressed: state.isFirst
                            ? () => controller.onPressedIndex(1)
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
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TextButton(
                            style: TextButton.styleFrom(
                                padding: const EdgeInsets.all(30),
                                primary: Colors.lightBlueAccent,
                                textStyle: const TextStyle(fontSize: 15)),
                            onPressed: () => controller.onPressedIndex(1),
                            child: Text("네"),
                          ),
                          const SizedBox(width: 20,),
                          TextButton(
                            style: TextButton.styleFrom(
                                padding: const EdgeInsets.only(left: 20, right: 20),
                                primary: Colors.lightBlueAccent,
                                textStyle: const TextStyle(fontSize: 15)),
                            onPressed: () => controller.onPressedIndex(2),
                            child: Text("아니요"),
                          )
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
                            backgroundColor: Colors.lightBlueAccent,
                            padding: EdgeInsets.symmetric(vertical: 20),
                            side: BorderSide(color: Colors.black),
                          ),
                          child: Text(state.pluralIndex == -1
                              ? "전공 유형을 선택하세요"
                              : state.majorList[state.pluralIndex]),
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
                          child: Text(state.pluralMajor == -1
                              ? "학과를 선택하세요"
                              : state.departmentList[state.pluralMajor]),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    SizedBox(
                      height: 20,
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
                          TextButton(
                              onPressed: () => controller.onPressedIndex(1),
                              child: Text("네")),
                          TextButton(
                              onPressed: () => controller.onPressedIndex(2),
                              child: Text("아니요")),
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
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 1, color: Colors.black)),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
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
                      const Center(
                        child: Text(
                          "이전에 현장실습을 하셨었나요?",
                          style: TextStyle(fontSize: 25),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                              onPressed: () => controller.onPressedIndex(1),
                              child: Text("네")),
                          TextButton(
                              onPressed: () => controller.onPressedIndex(2),
                              child: Text("아니요")),
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
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 1, color: Colors.black)),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
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
                      const Center(
                        child: Text(
                          "이전에 파란학기를 진행하셨었나요?",
                          style: TextStyle(fontSize: 25),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                              onPressed: () => controller.onPressedIndex(1),
                              child: Text("네")),
                          TextButton(
                              onPressed: () => controller.onPressedIndex(2),
                              child: Text("아니요")),
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
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 1, color: Colors.black)),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
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
                state.index < 9
                    ? const SizedBox.shrink()
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("정보를 확인해주세요.", style: TextStyle(fontSize: 25)),
                          SizedBox(
                            height: 30,
                          ),
                          Text("학적 정보", style: TextStyle(fontSize: 13)),
                          Column(
                            children: [
                              Text(
                                  '${(state.grade + 2) ~/ 2}-${(state.grade + 2) % 2 + 1}학기'),
                              Text(state.departmentList[state.department]),
                              Text('${state.id}'),
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Column(
                            children: [
                              Text(
                                "교내활동",
                                style: TextStyle(fontSize: 17),
                              ),
                              Text(
                                state.pluralIndex >= 0
                                    ? "${state.majorList[state.pluralIndex]} ${state.departmentList[state.pluralMajor]}"
                                    : '복수전공/부전공 -',
                              ),
                              Text(
                                  "교환학생 ${state.exchangeGrade == 0 ? '-' : state.exchangeGrade}"),
                              Text(
                                  "현장실습 ${state.fieldPracticeGrade == 0 ? '-' : state.fieldPracticeGrade}"),
                              Text(
                                  "파란학기 ${state.paranGrade == 0 ? '-' : state.paranGrade}"),
                              Center(
                                  child: TextButton(onPressed: (){}, child: Text("Data send Test"))),
                            ],
                          )
                        ],
                      ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
