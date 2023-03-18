import 'package:equatable/equatable.dart';

abstract class GetModel extends Equatable {
  const GetModel();

  bool get isEmpty;

  GetModel copyWith();
}
