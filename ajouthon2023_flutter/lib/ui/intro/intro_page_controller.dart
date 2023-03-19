import 'package:ajouthon2023/constant/extension.dart';
import 'package:ajouthon2023/constant/getx/get_rx_impl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constant/getx/get_controller.dart';
import '../../constant/pref_helper.dart';
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
  }

  void onChangedDepartment(int? index) {
    change(state.copyWith(
      department: index,
    ));
  }

  void onChangedGrade(int value) {
    change(state.copyWith(
      grade: value,
    ));
  }

  void onChangedPluralMajor(bool? value) {
    change(state.copyWith(
      isPluralMajor: value,
    ));
  }

  void onChangedExchange(bool? value) {
    change(state.copyWith(
      isExchange: value,
    ));
  }

  void onChangedFieldPractice(bool? value) {
    change(state.copyWith(
      isFieldPractice: value,
    ));
  }

  void onChangedParan(bool? value) {
    change(state.copyWith(
      isParan: value,
    ));
  }

  void onChangedPluralMajorInt(int? index) {
    change(state.copyWith(
      pluralIndex: index,
    ));
  }

  void onChangedPluralMajorValue(int? index) {
    change(state.copyWith(
      pluralMajor: index,
    ));
  }

  void onChangedExchangeGrade(String value) {
    change(state.copyWith(
      exchangeGrade: int.tryParse(value),
    ));
  }

  void onChangedFieldPracticeGrade(String value) {
    change(state.copyWith(
      fieldPracticeGrade: int.tryParse(value),
    ));
  }

  void onChangedParanGrade(String value) {
    change(state.copyWith(
      paranGrade: int.tryParse(value),
    ));
  }

  void onPressedBack() {
    change(state.copyWith(
      index: state.index - (state.index % 2 == 0 || state.index == 1 ? 1 : 2),
    ));
  }

  void onPressedIndex(int plus) async {
    change(state.copyWith(
      index: state.index + plus,
    ));
  }

  void onPressedGrade() async {
    await showModalBottomSheet<int>(
      context: Get.context!,
      builder: (context) => Container(
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        child: CupertinoPicker(
          scrollController: FixedExtentScrollController(initialItem: state.grade),
          onSelectedItemChanged: onChangedGrade,
          itemExtent: 30,
          backgroundColor: CupertinoColors.white,
          children: [
            ...List.generate(8, (i) => Text('${(i + 2) ~/ 2}-${(i + 2) % 2 + 1}학기')),
          ],
        ),
      ),
    );
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
          scrollController: FixedExtentScrollController(initialItem: state.department),
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
    }
  }

  void onPressedNext() async {
    await Future.wait([
      PrefHelper.setPrefInt(PrefType.id, state.id),
      PrefHelper.setPrefInt(PrefType.department, state.department),
      PrefHelper.setPrefInt(PrefType.pluralMajor, state.pluralMajor),
      PrefHelper.setPrefInt(PrefType.pluralIndex, state.pluralIndex),
      PrefHelper.setPrefInt(PrefType.exchangeGrade, state.exchangeGrade),
      PrefHelper.setPrefInt(PrefType.fieldPracticeGrade, state.fieldPracticeGrade),
      PrefHelper.setPrefInt(PrefType.paranGrade, state.paranGrade),
    ]);

    await RouteModel.check().toNamed(
      arguments: [
        [state.grade, state.department, state.pluralMajor, state.pluralIndex],
      ],
    );
  }
}
