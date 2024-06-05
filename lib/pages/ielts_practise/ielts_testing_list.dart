import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

class IeltsTestingScreen extends StatefulWidget {
  @override
  _IeltsTestingScreenState createState() => _IeltsTestingScreenState();
}

class _IeltsTestingScreenState extends State<IeltsTestingScreen> with TickerProviderStateMixin {
  final List<int> _itemsPart1 = [];
  final List<int> _itemsPart2 = [];
  final List<int> _itemsPart3 = [];
  final List<int> _itemsPart4 = [];
  final GlobalKey<AnimatedListState> _listKeyPart1 = GlobalKey<AnimatedListState>();
  final GlobalKey<AnimatedListState> _listKeyPart2 = GlobalKey<AnimatedListState>();
  final GlobalKey<AnimatedListState> _listKeyPart3 = GlobalKey<AnimatedListState>();
  final GlobalKey<AnimatedListState> _listKeyPart4 = GlobalKey<AnimatedListState>();
  bool _isLoadedPart1 = false;
  bool _isLoadedPart2 = false;
  bool _isLoadedPart3 = false;
  bool _isLoadedPart4 = false;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('IELTS Testing Practice'),
          elevation: 0,
          backgroundColor: Colors.blue[500],
          actions: const [
            IconButton(
              onPressed: null,
              icon: Icon(Icons.search),
            ),
          ],
        ),
        body: Column(
          children: [
            Container(
              color: Colors.white,
              child: const TabBar(
                labelColor: Colors.blue,
                unselectedLabelColor: Colors.black,
                indicatorColor: Colors.blue,
                tabs: [
                  Tab(text: 'Part 1'),
                  Tab(text: 'Part 2'),
                  Tab(text: 'Part 3'),
                  Tab(text: 'Part 4'),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  buildAnimatedListView('Part 1', _itemsPart1, _listKeyPart1, _isLoadedPart1, () {
                    _loadItems(_itemsPart1, _listKeyPart1);
                    _isLoadedPart1 = true;
                  }),
                  buildAnimatedListView('Part 2', _itemsPart2, _listKeyPart2, _isLoadedPart2, () {
                    _loadItems(_itemsPart2, _listKeyPart2);
                    _isLoadedPart2 = true;
                  }),
                  buildAnimatedListView('Part 3', _itemsPart3, _listKeyPart3, _isLoadedPart3, () {
                    _loadItems(_itemsPart3, _listKeyPart3);
                    _isLoadedPart3 = true;
                  }),
                  buildAnimatedListView('Part 4', _itemsPart4, _listKeyPart4, _isLoadedPart4, () {
                    _loadItems(_itemsPart4, _listKeyPart4);
                    _isLoadedPart4 = true;
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _loadItems(List<int> items, GlobalKey<AnimatedListState> listKey) async {
    for (int i = 0; i < 10; i++) {
      await Future.delayed(const Duration(milliseconds: 120));
      items.add(i);
      listKey.currentState?.insertItem(items.length - 1);
    }
  }

  Widget buildAnimatedListView(String part, List<int> items, GlobalKey<AnimatedListState> listKey, bool isLoaded, VoidCallback onVisible) {
    return VisibilityDetector(
      key: Key(part),
      onVisibilityChanged: (VisibilityInfo info) {
        if (info.visibleFraction > 0 && !isLoaded) {
          onVisible();
        }
      },
      child: KeepAliveAnimatedList(
        key: listKey,
        initialItemCount: items.length,
        padding: const EdgeInsets.all(10.0),
        itemBuilder: (context, index, animation) {
          return _buildItem(part, items[index], animation);
        },
      ),
    );
  }

  Widget _buildItem(String part, int item, Animation<double> animation) {
    double progressValue = (item + 1) / 10.0;
    int score = item + 1;

    return SizeTransition(
      sizeFactor: animation,
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
        elevation: 4.0,
        child: ListTile(
          leading: CircleAvatar(
            child: Text((item + 1).toString()),
          ),
          title: Text('$part: Item ${(item + 1)}'),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LinearProgressIndicator(
                value: progressValue,
                backgroundColor: Colors.grey[300],
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
              ),
              const SizedBox(height: 5),
              Text('Score: $score/10'),
            ],
          ),
        ),
      ),
    );
  }
}

class KeepAliveAnimatedList extends StatefulWidget {
  const KeepAliveAnimatedList({
    Key? key,
    required this.itemBuilder,
    required this.initialItemCount,
    required this.padding,
  }) : super(key: key);

  final Widget Function(BuildContext, int, Animation<double>) itemBuilder;
  final int initialItemCount;
  final EdgeInsetsGeometry padding;

  @override
  _KeepAliveAnimatedListState createState() => _KeepAliveAnimatedListState();
}

class _KeepAliveAnimatedListState extends State<KeepAliveAnimatedList> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return AnimatedList(
      key: widget.key,
      initialItemCount: widget.initialItemCount,
      padding: widget.padding,
      itemBuilder: widget.itemBuilder,
    );
  }

  @override
  bool get wantKeepAlive => true;
}
