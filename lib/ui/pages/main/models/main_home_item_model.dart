import 'package:equatable/equatable.dart';

class MainHomeItemModel extends Equatable {
  final bool isNew;
  final String title;
  final String subtitle;
  final String picture;
  final bool isBuy;

  const MainHomeItemModel({
    required this.isNew,
    required this.title,
    required this.subtitle,
    required this.picture,
    required this.isBuy,
  });

  @override
  List<Object?> get props => [isNew, title, subtitle, picture, isBuy];
}
