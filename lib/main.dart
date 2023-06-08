import 'package:flutter/material.dart';
import 'package:folding_scroll_view/data/dummy_data.dart';
import 'package:folding_scroll_view/view/page_view_item.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Folding ScrollView',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

//devDiariesWithVee on Instagram
//devDiariesWithVee on Youtube
//vaidehi2701 on Github/Linkedin


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /// The current page of the page view
  double _page = 0;

  /// The index of the leftmost element of the list to be displayed
  int get _firstItemIndex => _page.toInt();

  /// Controller to get the current position of the page view
  final _controller = PageController(
    viewportFraction: 0.5,
  );

  /// The width of a single item
  late final _itemWidth =
      MediaQuery.of(context).size.width * _controller.viewportFraction;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() => setState(() {
          _page = _controller.page!;
        }));
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black38,
      appBar: AppBar(
        backgroundColor: Colors.pink[300],
        title: const Text("DevDiariesWithVee"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              Positioned.fill(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: SizedBox(
                    width: _itemWidth,
                    child: FractionallySizedBox(
                      child: PageViewItem(
                        index: _firstItemIndex,
                        width: _itemWidth,
                        image: model[_firstItemIndex],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 250,
                child: PageView.builder(
                  padEnds: false,
                  controller: _controller,
                  itemBuilder: (context, index) {
                    return Opacity(
                      opacity: index <= _firstItemIndex ? 0 : 1,
                      child: PageViewItem(
                        index: index,
                        width: _itemWidth,
                        image: model[index],
                      ),
                    );
                  },
                  itemCount: model.length,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
