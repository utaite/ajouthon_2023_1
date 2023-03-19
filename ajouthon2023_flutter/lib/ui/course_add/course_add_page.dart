import 'package:ajouthon2023/constant/colors.dart';
import 'package:ajouthon2023/constant/styles.dart';
import 'package:ajouthon2023/model/course/course_model.dart';
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
          int isRecommend(CourseModel course) =>
              state.departments.contains(course.department) && [0, 2].contains(course.type) && state.grade == course.grade - 1 ? 1 : -1;
          int isReject(CourseModel course) => course.prerequisite.isset &&
                  course.prerequisite.every((x) =>
                      !state.checkedCourses.values.expand((y) => y).map((y) => state.courses.where((z) => z.name == y).firstOrNull?.uuid).contains(x))
              ? 1
              : -1;

          final filters = state.courses
              .where((x) =>
                  (state.selectDepartments.isNullOrEmpty || state.selectDepartments.contains(x.department)) &&
                  (state.selectGrades.isNullOrEmpty || state.selectGrades.contains(x.grade)) &&
                  (state.selectTypes.isNullOrEmpty || state.selectTypes.contains(x.type)))
              .toList()
            ..sort((a, b) {
              if (isRecommend(b) != isRecommend(a)) {
                return isRecommend(b).compareTo(isRecommend(a));
              } else if (isReject(a) != isReject(b)) {
                return isReject(a).compareTo(isReject(b));
              } else if ((state.grade - a.grade).abs() != (state.grade - b.grade).abs()) {
                return (state.grade - a.grade + 1).abs().compareTo((state.grade - b.grade + 1).abs());
              } else if (a.type % 2 != b.type % 2) {
                return (a.type % 2).compareTo(b.type % 2);
              }

              return a.name.compareTo(b.name);
            });
          final totalCredit = state.checkedCourses[state.grade].elvis
              .map((x) => state.courses.where((y) => y.name == x).firstOrNull)
              .map((x) => (x?.credit).elvis)
              .fold<int>(0, (a, c) => a + c);

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
                              text: '수강할 과목을 선택해주세요.',
                              style: textBlack22.copyWith(
                                fontWeight: FontWeight.bold,
                                height: 4 / 3,
                              ),
                            ),
                            if (totalCredit > 0)
                              TextSpan(
                                text: '($totalCredit학점)',
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
                          ...state.departmentList.toList().asMap().keys.map((x) => DecoratedBox(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: colorPrimary,
                                  ),
                                  color:
                                      state.selectDepartments.contains(x) ? colorPrimary.withOpacity(1 / 4) : context.theme.scaffoldBackgroundColor,
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
                                        state.departmentList[x].elvis,
                                        style: textBlack10.copyWith(
                                          color: colorPrimary,
                                        ),
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
                                    color: colorPrimary,
                                  ),
                                  color: state.selectGrades.contains(x) ? colorPrimary.withOpacity(1 / 4) : context.theme.scaffoldBackgroundColor,
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
                                        style: textBlack10.copyWith(
                                          color: colorPrimary,
                                        ),
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
                                    color: colorPrimary,
                                  ),
                                  color: state.selectTypes.contains(x) ? colorPrimary.withOpacity(1 / 4) : context.theme.scaffoldBackgroundColor,
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
                                        ['교양필수' ,'전공필수', '전공선택'][x].elvis,
                                        style: textBlack10.copyWith(
                                          color: colorPrimary,
                                        ),
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
                            color: isActive ? colorPrimary.withOpacity(1 / 4) : null,
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
                              onLongPress: () => controller.onLongPressedCheckedCourse(x.value.name),
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
                                      isActive
                                          ? Icon(
                                              Icons.check,
                                              color: colorPrimary,
                                            )
                                          : isRecommend(x.value) == 1
                                              ? DecoratedBox(
                                                  decoration: BoxDecoration(
                                                    color: colorPrimary,
                                                    borderRadius: BorderRadius.circular(6888),
                                                  ),
                                                  child: Padding(
                                                    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                                                    child: Text(
                                                      '추천',
                                                      style: textWhite10.copyWith(
                                                        fontWeight: FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              : isReject(x.value) == 1
                                                  ? DecoratedBox(
                                                      decoration: BoxDecoration(
                                                        color: Colors.red,
                                                        borderRadius: BorderRadius.circular(6888),
                                                      ),
                                                      child: Padding(
                                                        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                                                        child: Text(
                                                          '비추천',
                                                          style: textWhite10.copyWith(
                                                            fontWeight: FontWeight.bold,
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  : const SizedBox.shrink(),
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
                                                  color: colorPrimary,
                                                ),
                                                color: context.theme.scaffoldBackgroundColor,
                                                borderRadius: BorderRadius.circular(6888),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 7.5, vertical: 5),
                                                child: Text(
                                                  y.elvis,
                                                  style: textBlack10.copyWith(
                                                    color: colorPrimary,
                                                  ),
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
