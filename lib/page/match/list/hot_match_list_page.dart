import 'package:flutter/src/widgets/framework.dart';
import 'package:youliao/page/match/base_match_list_page.dart';
import 'package:youliao/page/match/list/hot_match_index_page.dart';

class HotMatchListPage extends BaseMatchListPage {
  const HotMatchListPage({super.key});

  @override
  Widget createItemPage() => const HotMatchIndexPage();
}
