import 'package:get/get.dart';
import 'package:flutter/material.dart';

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
          title: Text('수강 과목 선택'),
        ),
        backgroundColor: context.theme.scaffoldBackgroundColor,
        body: SafeArea(
          child: controller.rx((state) {
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
                                text: '${state.grade == state.currentGrade ? '수강중인' : '수강했던'} 과목을 선택해주세요.',
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
                                          state.departmentList[x].elvis,
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
                        final isActive = state.checkedCourses[state.currentGrade - 1].elvis.contains(x.value.name);

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
                                                    y.elvis,
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
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: state.checkedCourses.values.every((x) => x.isset) ? Colors.green.shade400 : Colors.grey,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Material(
                            type: MaterialType.transparency,
                            child: InkWell(
                              onTap: state.checkedCourses.values.every((x) => x.isset) ? controller.onPressedNext : null,
                              borderRadius: BorderRadius.circular(15),
                              child: Padding(
                                padding: const EdgeInsets.all(15),
                                child: Text(
                                  '완료',
                                  style: textWhite16.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
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
