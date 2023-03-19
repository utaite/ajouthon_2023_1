import '../../constant/getx/get_model.dart';

class SplashPageModel extends GetModel {
  const SplashPageModel();

  static const SplashPageModel _empty = SplashPageModel();

  factory SplashPageModel.empty() => _empty;

  @override
  bool get isEmpty => this == _empty;

  @override
  SplashPageModel copyWith() {
    return SplashPageModel();
  }

  @override
  List<Object?> get props => [];

  @override
  String toString() => '';
}
