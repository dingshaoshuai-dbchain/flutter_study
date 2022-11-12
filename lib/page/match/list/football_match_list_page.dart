import 'package:flutter/src/widgets/framework.dart';
import 'package:youliao/page/match/base_match_list_page.dart';
import 'package:youliao/page/match/list/hot_match_index_page.dart';

import 'football_match_index_page.dart';

class FootballMatchListPage extends BaseMatchListPage {
  const FootballMatchListPage({super.key});

  @override
  Widget createItemPage() => const FootballMatchIndexPage();
}
