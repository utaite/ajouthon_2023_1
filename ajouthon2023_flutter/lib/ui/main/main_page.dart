import 'dart:math';

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
                                              '정보통신대학',
                                              style: text_black_22.copyWith(
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
                                                  '소프트웨어학과',
                                                  style: text_black_22.copyWith(
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                ...[
                                                  Text('제1복수전공 미디어학과', style: text_black_16),
                                                  const SizedBox(height: 10),
                                                  Text('202021766', style: text_black_16),
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
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          const SizedBox(width: 20),
                          Expanded(
                            child: Text(
                              '이수 100/128 학점',
                              style: text_black_18.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: controller.onPressedList,
                            icon: Icon(Icons.list),
                          ),
                          const SizedBox(width: 10),
                        ],
                      ),
                      ...state.courses.entries.expand((x) => [
                            const SizedBox(height: 20),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const SizedBox(width: 20),
                                Expanded(
                                  child: Text(
                                    '${x.key}',
                                    style: text_black_18.copyWith(
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
                                          Icon(Icons.add_circle),
                                          const SizedBox(width: 5),
                                          Text(
                                            '과목추가',
                                            style: text_black_18.copyWith(
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
                            ...x.value.asMap().entries.map((y) => Padding(
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
                                      child: Text(y.value.name),
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
                                  style: text_black_16.copyWith(
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
