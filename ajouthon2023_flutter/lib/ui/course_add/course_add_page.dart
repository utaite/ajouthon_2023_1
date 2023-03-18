import 'package:ajouthon2023/constant/styles.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../constant/extension.dart';
import 'course_add_page_controller.dart';

class CourseAddPage extends GetView<CourseAddPageController> {
  const CourseAddPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: controller.onWillPop,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: context.theme.scaffoldBackgroundColor,
          leading: BackButton(
            color: Colors.black,
          ),
          actions: [
            TextButton(
              onPressed: controller.onPressedSave,
              child: Text(
                '확인',
                style: textBlack14,
              ),
            ),
          ],
          title: Text('과목 추가'),
        ),
        backgroundColor: context.theme.scaffoldBackgroundColor,
        body: controller.rx((state) {
          final filters = state.courses.where((x) =>
              (state.selectDepartments.isNullOrEmpty || state.selectDepartments.contains(x.department)) &&
              (state.selectGrades.isNullOrEmpty || state.selectGrades.contains(x.grade)) &&
              (state.selectTypes.isNullOrEmpty || state.selectTypes.contains(x.type)));

          return CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text.rich(
                        TextSpan(
                          children: [
                            WidgetSpan(
                              alignment: PlaceholderAlignment.middle,
                              child: SizedBox(
                                width: 115,
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    border: Border.all(),
                                  ),
                                  child: Material(
                                    type: MaterialType.transparency,
                                    child: InkWell(
                                      onTap: controller.onPressedGrade,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 6),
                                        child: Text.rich(
                                          TextSpan(
                                            children: [
                                              TextSpan(
                                                text: '${(state.grade + 2) ~/ 2}-${(state.grade + 2) % 2 + 1}학기',
                                                style: textBlack22.copyWith(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              WidgetSpan(
                                                child: Icon(Icons.expand_more),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            WidgetSpan(
                              child: const SizedBox(width: 5),
                            ),
                            TextSpan(
                              text: '수강한 과목을 선택해주세요.',
                              style: textBlack22.copyWith(
                                fontWeight: FontWeight.bold,
                                height: 4 / 3,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Wrap(
                        spacing: 5,
                        runSpacing: 5,
                        alignment: WrapAlignment.start,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              '학과',
                              style: textBlack18.copyWith(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          ...state.departmentList.asMap().keys.map((x) => DecoratedBox(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.black,
                                  ),
                                  color: state.selectDepartments.contains(x) ? Colors.green.shade100 : context.theme.scaffoldBackgroundColor,
                                  borderRadius: BorderRadius.circular(6888),
                                ),
                                child: Material(
                                  type: MaterialType.transparency,
                                  child: InkWell(
                                    onTap: () => controller.onPressedSelectDepartment(x),
                                    borderRadius: BorderRadius.circular(6888),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 7.5, vertical: 5),
                                      child: Text(
                                        state.departmentList[x],
                                        style: textBlack10,
                                      ),
                                    ),
                                  ),
                                ),
                              )),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Wrap(
                        spacing: 5,
                        runSpacing: 5,
                        alignment: WrapAlignment.start,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              '학기',
                              style: textBlack18.copyWith(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          ...List.generate(8, (i) => i + 1).map((x) => DecoratedBox(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.black,
                                  ),
                                  color: state.selectGrades.contains(x) ? Colors.green.shade100 : context.theme.scaffoldBackgroundColor,
                                  borderRadius: BorderRadius.circular(6888),
                                ),
                                child: Material(
                                  type: MaterialType.transparency,
                                  child: InkWell(
                                    onTap: () => controller.onPressedSelectGrade(x),
                                    borderRadius: BorderRadius.circular(6888),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 7.5, vertical: 5),
                                      child: Text(
                                        '${(x + 1) ~/ 2}-${(x + 1) % 2 + 1}학기',
                                        style: textBlack10,
                                      ),
                                    ),
                                  ),
                                ),
                              )),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Wrap(
                        spacing: 5,
                        runSpacing: 5,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              '전공/교양',
                              style: textBlack18.copyWith(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          ...List.generate(3, (i) => i).map((x) => DecoratedBox(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.black,
                                  ),
                                  color: state.selectTypes.contains(x) ? Colors.green.shade100 : context.theme.scaffoldBackgroundColor,
                                  borderRadius: BorderRadius.circular(6888),
                                ),
                                child: Material(
                                  type: MaterialType.transparency,
                                  child: InkWell(
                                    onTap: () => controller.onPressedSelectType(x),
                                    borderRadius: BorderRadius.circular(6888),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 7.5, vertical: 5),
                                      child: Text(
                                        ['전공필수', '전공선택', '교양필수'][x].elvis,
                                        style: textBlack10,
                                      ),
                                    ),
                                  ),
                                ),
                              )),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    ...filters.toList().asMap().entries.map((x) {
                      final isActive = state.checkedCourses[state.grade].elvis.contains(x.value.name);

                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: isActive ? Colors.green.shade100 : null,
                            border: Border.all(
                              width: 0,
                            ),
                            borderRadius: [0, filters.lastIndex].contains(x.key)
                                ? BorderRadius.only(
                                    topLeft: x.key == 0 ? Radius.circular(10) : Radius.zero,
                                    topRight: x.key == 0 ? Radius.circular(10) : Radius.zero,
                                    bottomLeft: x.key == filters.lastIndex ? Radius.circular(10) : Radius.zero,
                                    bottomRight: x.key == filters.lastIndex ? Radius.circular(10) : Radius.zero,
                                  )
                                : null,
                          ),
                          child: Material(
                            type: MaterialType.transparency,
                            child: InkWell(
                              onTap: () => controller.onPressedCheckedCourse(x.value.name),
                              borderRadius: [0, filters.lastIndex].contains(x.key)
                                  ? BorderRadius.only(
                                      topLeft: x.key == 0 ? Radius.circular(10) : Radius.zero,
                                      topRight: x.key == 0 ? Radius.circular(10) : Radius.zero,
                                      bottomLeft: x.key == filters.lastIndex ? Radius.circular(10) : Radius.zero,
                                      bottomRight: x.key == filters.lastIndex ? Radius.circular(10) : Radius.zero,
                                    )
                                  : null,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Row(
                                    children: [
                                      const SizedBox(width: 10),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(vertical: 10),
                                          child: Text(
                                            x.value.name,
                                            style: textBlack16,
                                          ),
                                        ),
                                      ),
                                      Visibility(
                                        visible: isActive,
                                        child: Icon(
                                          Icons.check,
                                          color: Colors.green,
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 10),
                                    child: Wrap(
                                      spacing: 5,
                                      runSpacing: 5,
                                      children: [
                                        ...[
                                          state.departmentList[x.value.department],
                                          ...x.value.tags,
                                        ].map((y) => DecoratedBox(
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: isActive ? Colors.green : Colors.black,
                                                ),
                                                color: context.theme.scaffoldBackgroundColor,
                                                borderRadius: BorderRadius.circular(6888),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 7.5, vertical: 5),
                                                child: Text(
                                                  y,
                                                  style: textBlack10,
                                                ),
                                              ),
                                            )),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
