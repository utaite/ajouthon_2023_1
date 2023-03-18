import 'dart:math';

import 'package:ajouthon2023/constant/api.dart';
import 'package:ajouthon2023/constant/colors.dart';
import 'package:ajouthon2023/constant/styles.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../constant/extension.dart';
import 'main_page_controller.dart';

const double collapsedHeight = kToolbarHeight;
const double expandedHeight = kToolbarHeight * 2.5;

class MainPage extends GetView<MainPageController> {
  const MainPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: controller.onWillPop,
      child: Scaffold(
        body: SafeArea(child: controller.rx(
          (state) {
            return CustomScrollView(
              slivers: [
                SliverAppBar(
                  backgroundColor: context.theme.scaffoldBackgroundColor,
                  flexibleSpace: LayoutBuilder(
                    builder: (context, constraints) {
                      final value = (constraints.biggest.height / collapsedHeight - 1) / 3 * 2;
                      final opacity = value * 2 - 1;

                      return Stack(
                        children: [
                          Positioned.fill(
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: Opacity(
                                opacity: value,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 5),
                                  child: FractionallySizedBox(
                                    widthFactor: 1 / 3,
                                    child: Image.asset('assets/logo.png'),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned.fill(
                            child: Padding(
                              padding: EdgeInsets.only(top: value * 30),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const SizedBox(width: 20),
                                  Expanded(
                                    child: Stack(
                                      children: [
                                        Positioned.fill(
                                          child: Align(
                                            alignment: Alignment(-value / 3 - 2 / 3, 0),
                                            child: Text(
                                              collegeList[state.department].elvis,
                                              style: textBlack18.copyWith(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned.fill(
                                          child: Align(
                                            alignment: Alignment(value / 3 + 2 / 3, 0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment: CrossAxisAlignment.end,
                                              children: [
                                                Text(
                                                  departmentList[state.department].elvis,
                                                  style: textBlack18.copyWith(
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                ...[
                                                  if (state.pluralMajor >= 0 && state.pluralIndex >= 0)
                                                    Text(
                                                      '제1${majorList[state.pluralMajor]} ${departmentList[state.pluralIndex]}',
                                                      style: textBlack14,
                                                    ),
                                                  const SizedBox(height: 10),
                                                  Text('${state.id}', style: textBlack14),
                                                ].map((x) => Visibility(
                                                      visible: opacity > 0,
                                                      child: Opacity(
                                                        opacity: max(0, opacity),
                                                        child: x,
                                                      ),
                                                    )),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 20),
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                  collapsedHeight: collapsedHeight,
                  expandedHeight: expandedHeight,
                  pinned: true,
                ),
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          const SizedBox(width: 20),
                          Expanded(
                            child: Text(
                              '이수 ${state.courses.values.expand((x) => x.map((y) => y.credit)).fold<int>(0, (a, c) => a + c)}/128 학점',
                              style: textBlack18.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(width: 20),
                          DecoratedBox(
                            decoration: BoxDecoration(
                              color: context.theme.primaryColor,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Material(
                              type: MaterialType.transparency,
                              child: InkWell(
                                onTap: controller.onPressedReset,
                                borderRadius: BorderRadius.circular(15),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 7.5, horizontal: 15),
                                  child: Text(
                                    '학점 초기화',
                                    style: textWhite16.copyWith(
                                      fontWeight: FontWeight.w500,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 20),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          const SizedBox(width: 20),
                          Expanded(
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                color: context.theme.primaryColor,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Material(
                                type: MaterialType.transparency,
                                child: InkWell(
                                  onTap: () =>
                                      controller.onPressedAdd((state.courses.entries.where((x) => x.value.isNullOrEmpty).firstOrNull?.key).elvis),
                                  borderRadius: BorderRadius.circular(15),
                                  child: Padding(
                                    padding: const EdgeInsets.all(15),
                                    child: Text(
                                      '학기 추가',
                                      style: textWhite16.copyWith(
                                        fontWeight: FontWeight.w500,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                color: context.theme.primaryColor,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Material(
                                type: MaterialType.transparency,
                                child: InkWell(
                                  onTap: controller.onPressedList,
                                  borderRadius: BorderRadius.circular(15),
                                  child: Padding(
                                    padding: const EdgeInsets.all(15),
                                    child: Text(
                                      '과목 목록',
                                      style: textWhite16.copyWith(
                                        fontWeight: FontWeight.w500,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 20),
                        ],
                      ),
                      const SizedBox(height: 20),
                      ...state.courses.entries.where((x) => x.value.isset).toList().reversed.expand((x) => [
                            const SizedBox(height: 20),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const SizedBox(width: 20),
                                Expanded(
                                  child: Text(
                                    '${(x.key + 2) ~/ 2}-${(x.key + 2) % 2 + 1}학기 수강과목',
                                    style: textBlack18.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Material(
                                  type: MaterialType.transparency,
                                  child: InkWell(
                                    onTap: () => controller.onPressedAdd(x.key),
                                    borderRadius: BorderRadius.circular(20),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 10),
                                      child: Row(
                                        children: [
                                          const SizedBox(width: 10),
                                          Icon(
                                            Icons.add_circle,
                                            color: colorPrimary,
                                          ),
                                          const SizedBox(width: 5),
                                          Text(
                                            '과목 추가',
                                            style: textBlack18.copyWith(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const SizedBox(width: 10),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                              ],
                            ),
                            const SizedBox(height: 20),
                            ...x.value.asMap().entries.map((y) => Dismissible(
                                  key: UniqueKey(),
                                  onDismissed: (_) => controller.onDismissed(x.key, y.value.name),
                                  direction: DismissDirection.endToStart,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 20),
                                    child: DecoratedBox(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          width: 0,
                                        ),
                                        borderRadius: [0, x.value.lastIndex].contains(y.key)
                                            ? BorderRadius.only(
                                                topLeft: y.key == 0 ? Radius.circular(10) : Radius.zero,
                                                topRight: y.key == 0 ? Radius.circular(10) : Radius.zero,
                                                bottomLeft: y.key == x.value.lastIndex ? Radius.circular(10) : Radius.zero,
                                                bottomRight: y.key == x.value.lastIndex ? Radius.circular(10) : Radius.zero,
                                              )
                                            : null,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 10,
                                          horizontal: 10,
                                        ),
                                        child: SizedBox(
                                          width: double.infinity,
                                          child: Text(y.value.name),
                                        ),
                                      ),
                                    ),
                                  ),
                                )),
                            const SizedBox(height: 10),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  '${x.value.map((y) => y.credit).fold<int>(0, (a, c) => a + c)}학점',
                                  style: textBlack16.copyWith(
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ]),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ],
            );
          },
        )),
      ),
    );
  }
}
