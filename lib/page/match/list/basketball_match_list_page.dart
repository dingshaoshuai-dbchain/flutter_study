import 'package:flutter/src/widgets/framework.dart';
import 'package:youliao/page/match/base_match_list_page.dart';
import 'package:youliao/page/match/list/basketball_match_index_page.dart';

class BasketballMatchListPage extends BaseMatchListPage {
  const BasketballMatchListPage({super.key});

  @override
  Widget createItemPage() => const BasketballMatchIndexPage();
}
