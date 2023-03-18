import '../../constant/getx/get_model.dart';

class CheckPageModel extends GetModel {
  const CheckPageModel();

  static const CheckPageModel _empty = CheckPageModel();

  factory CheckPageModel.empty() => _empty;

  @override
  bool get isEmpty => this == _empty;

  @override
  CheckPageModel copyWith() {
    return CheckPageModel();
  }

  @override
  List<Object?> get props => [];

  @override
  String toString() => '';
}
