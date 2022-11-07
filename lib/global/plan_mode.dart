import 'dart:ui';

enum PlanMode {
  SIGNLE(color: Color(0xFF181818)),
  And_2_1(color: Color(0xFFFA3F3F), iconPath: 'app/ic_plan_type_2_and_1'),
  PACKAGE(color: Color(0xFF9069F6), iconPath: 'app/ic_plan_type_package');

  const PlanMode({required this.color, this.iconPath});

  final Color color;
  final String? iconPath;
}
