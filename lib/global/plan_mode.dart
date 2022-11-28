import 'dart:ui';

enum PlanMode {
  single(color: Color(0xFF181818)),
  and21(color: Color(0xFFFA3F3F), iconPath: 'ic_plan_type_2_and_1'),
  package(color: Color(0xFF9069F6), iconPath: 'ic_plan_type_package');

  const PlanMode({required this.color, this.iconPath});

  final Color color;
  final String? iconPath;
}
