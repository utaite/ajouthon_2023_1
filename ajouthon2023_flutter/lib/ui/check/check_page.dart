import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../constant/colors.dart';
import '../../constant/extension.dart';
import '../../constant/styles.dart';
import 'check_page_controller.dart';

class CheckPage extends GetView<CheckPageController> {
  const CheckPage({
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
              onPressed: controller.onPressedNext,
              child: Text(
                '다음',
                style: textBlack14,
              ),
            ),
          ],
          title: Text('수강 과목 선택'),
        ),
        backgroundColor: context.theme.scaffoldBackgroundColor,
        body: SafeArea(
          child: controller.rx((state) {
            final filters = state.courses
                .where((x) =>
                    (state.selectDepartments.isNullOrEmpty || state.selectDepartments.contains(x.department)) &&
                    (state.selectGrades.isNullOrEmpty || state.selectGrades.contains(x.grade)) &&
                    (state.selectTypes.isNullOrEmpty || state.selectTypes.contains(x.type)))
                .toList()
              ..sort((a, b) {
                if ((state.currentGrade - a.grade).abs() != (state.currentGrade - b.grade).abs()) {
                  return (state.currentGrade - a.grade).abs().compareTo((state.currentGrade - b.grade).abs());
                } else if (a.type % 2 != b.type % 2) {
                  return (a.type % 2).compareTo(b.type % 2);
                }

                return a.name.compareTo(b.name);
              });
            final totalCredit = state.checkedCourses[state.currentGrade - 1].elvis
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
                                                  text: '${(state.currentGrade + 1) ~/ 2}-${(state.currentGrade + 1) % 2 + 1}학기',
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
                                text: '${state.grade == state.currentGrade ? '수강중인' : '수강한'} 과목을 선택해주세요.',
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
                            ...state.departments.map((x) => DecoratedBox(
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
                                          ['교양필수', '전공필수', '전공선택'][x].elvis,
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
                        final isActive = state.checkedCourses[state.currentGrade - 1].elvis.contains(x.value.name);

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
                                            color: colorPrimary,
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
      ),
    );
  }
}
