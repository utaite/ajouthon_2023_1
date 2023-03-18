import 'package:ajouthon2023/constant/extension.dart';
import 'package:ajouthon2023/constant/getx/get_rx_impl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constant/getx/get_controller.dart';
import '../../model/route/route_model.dart';
import 'intro_page_model.dart';

class IntroPageController extends GetController<IntroPageModel> {
  IntroPageController({
    required IntroPageModel model,
  }) : super(model);

  void onChangedId(String value) {
    change(state.copyWith(
      id: int.tryParse(value),
    ));
    print(state);
  }

  void onChangedDepartment(int? index) {
    change(state.copyWith(
      department: index,
    ));
    print(state);
  }

  void onChangedGrade(String value) {
    change(state.copyWith(
      grade: int.tryParse(value),
    ));
    print(state);
  }

  void onChangedPluralMajor(bool? value) {
    change(state.copyWith(
      isPluralMajor: value,
    ));
    print(state);
  }

  void onChangedExchange(bool? value) {
    change(state.copyWith(
      isExchange: value,
    ));
    print(state);
  }

  void onChangedFieldPractice(bool? value) {
    change(state.copyWith(
      isFieldPractice: value,
    ));
    print(state);
  }

  void onChangedParan(bool? value) {
    change(state.copyWith(
      isParan: value,
    ));
    print(state);
  }

  void onChangedPluralMajorInt(int? index) {
    change(state.copyWith(
      pluralIndex: index,
    ));
    print(state);
  }

  void onChangedPluralMajorValue(int? index) {
    change(state.copyWith(
      pluralMajor: index,
    ));
    print(state);
  }

  void onChangedExchangeGrade(String value) {
    change(state.copyWith(
      exchangeGrade: int.tryParse(value),
    ));
    print(state);
  }

  void onChangedFieldPracticeGrade(String value) {
    change(state.copyWith(
      fieldPracticeGrade: int.tryParse(value),
    ));
    print(state);
  }

  void onChangedParanGrade(String value) {
    change(state.copyWith(
      paranGrade: int.tryParse(value),
    ));
    print(state);
  }

  void onPressedBack() {
    print('index: ${state.index}');

    change(state.copyWith(
      index: state.index - (state.index % 2 == 0 || state.index == 1 ? 1 : 2),
    ));

    print('index: ${state.index}');
  }

  void onPressedIndex(int plus) async {
    change(state.copyWith(
      index: state.index + plus,
    ));
    print(state);
  }

  void onPressedDepartment() async {
    final index = await showModalBottomSheet<int>(
      context: Get.context!,
      builder: (context) => Container(
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        child: CupertinoPicker(
          itemExtent: 50.0,
          backgroundColor: CupertinoColors.white,
          onSelectedItemChanged: onChangedDepartment,
          children: [
            ...state.departmentList.map((e) => Text(e)),
          ],
        ),
      ),
    );
    if (index is int) {
      change(state.copyWith(
        department: index,
      ));
      print(state);
    }
  }

  void onPressedPluralIndex() async {
    final index = await showModalBottomSheet<int>(
      context: Get.context!,
      builder: (context) => Container(
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        child: CupertinoPicker(
          itemExtent: 50.0,
          backgroundColor: CupertinoColors.white,
          onSelectedItemChanged: onChangedPluralMajorInt,
          children: [
            ...state.majorList.map((e) => Text(e)),
          ],
        ),
      ),
    );
    if (index is int) {
      change(state.copyWith(
        pluralIndex: index,
      ));
      print(state);
    }
  }

  void onPressedPluralMajor() async {
    final index = await showModalBottomSheet<int>(
      context: Get.context!,
      builder: (context) => Container(
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        child: CupertinoPicker(
          itemExtent: 50.0,
          backgroundColor: CupertinoColors.white,
          onSelectedItemChanged: onChangedPluralMajorValue,
          children: [
            ...state.departmentList.map((e) => Text(e)),
          ],
        ),
      ),
    );
    if (index is int) {
      change(state.copyWith(
        pluralMajor: index,
      ));
      print(state);
    }
  }

  void onPressedNext() async {
    await RouteModel.check().toNamed(
      arguments: [
        state.department,
      ],
    );
  }
}
