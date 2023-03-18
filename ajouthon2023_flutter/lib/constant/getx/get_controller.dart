import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';

import 'get_model.dart';

abstract class GetController<T extends GetModel> extends Value<T> with GetLifeCycleBase {
  GetController(T initial) : super(initial) {
    $configureLifeCycle();
  }

  @override
  @mustCallSuper
  void onInit() {
    super.onInit();
    SchedulerBinding.instance?.addPostFrameCallback((_) => onReady());
  }

  @override
  T get state => super.state!;

  Future<bool> get isWillPop async => true;

  Future<bool> onWillPop() => isWillPop;
}
