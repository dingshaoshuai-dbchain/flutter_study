enum MatchMode {
  // 全部
  all(sportId: 0),
  // 足球
  football(sportId: 1),
  // 篮球
  basketball(sportId: 2);

  const MatchMode({required this.sportId});

  final int sportId;
}
