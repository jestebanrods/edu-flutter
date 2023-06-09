import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InfiniteScrollScreen extends StatefulWidget {
  const InfiniteScrollScreen({super.key});

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {
  final ScrollController scrollController = ScrollController();
  List<int> ids = [1, 2, 3, 4, 5];
  bool isLoading = false;
  bool isMounted = true;
  bool isTop = true;

  void addFiveImages() {
    final lastId = ids.last;
    ids.addAll([1, 2, 3, 4, 5].map((id) => lastId + id));
  }

  void moveScrollToBottom() {
    if (scrollController.position.pixels + 150 <=
        scrollController.position.maxScrollExtent) return;

    scrollController.animateTo(
      scrollController.position.pixels + 120,
      duration: const Duration(milliseconds: 300),
      curve: Curves.fastOutSlowIn,
    );
  }

  void moveScrollToTop() {
    scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 300),
      curve: Curves.fastOutSlowIn,
    );
  }

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      isTop = scrollController.position.pixels < 150;
      setState(() {});

      if (scrollController.position.pixels + 500 >=
          scrollController.position.maxScrollExtent) {
        loadNextPage();
      }
    });
  }

  Future<void> loadNextPage() async {
    if (isLoading) {
      return;
    }

    isLoading = true;
    setState(() {});

    // Emulates HTTP Delay.
    await Future.delayed(const Duration(seconds: 2));
    addFiveImages();

    isLoading = false;
    if (!isMounted) {
      return;
    }

    setState(() {});
    moveScrollToBottom();
  }

  Future<void> onRefresh() async {
    isLoading = true;
    setState(() {});

    // Emulates HTTP Delay.
    await Future.delayed(const Duration(seconds: 2));
    if (!isMounted) {
      return;
    }

    isLoading = false;
    final lastId = ids.last;
    ids.clear();
    ids.add(lastId + 1);
    addFiveImages();
    setState(() {});
  }

  @override
  void dispose() {
    scrollController.dispose();
    isMounted = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MediaQuery.removePadding(
        removeTop: true,
        removeBottom: true,
        context: context,
        child: RefreshIndicator(
          edgeOffset: 10,
          strokeWidth: 2,
          onRefresh: onRefresh,
          child: ListView.builder(
            controller: scrollController,
            itemCount: ids.length,
            itemBuilder: (context, index) {
              return FadeInImage(
                fit: BoxFit.cover,
                width: double.infinity,
                height: 300,
                placeholder: const AssetImage('assets/images/jar-loading.gif'),
                image: NetworkImage(
                    'https://picsum.photos/id/${ids[index]}/500/300'),
              );
            },
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          isTop
              ? const SizedBox()
              : FadeIn(
                  child: FloatingActionButton(
                    onPressed: () {
                      moveScrollToTop();
                    },
                    child: const Icon(Icons.arrow_upward),
                  ),
                ),
          const SizedBox(height: 20),
          FloatingActionButton(
            onPressed: () {
              context.pop();
            },
            child: isLoading
                ? SpinPerfect(
                    infinite: true,
                    duration: const Duration(milliseconds: 500),
                    child: const Icon(Icons.refresh_rounded),
                  )
                : FadeIn(
                    child: const Icon(Icons.keyboard_return),
                  ),
          ),
        ],
      ),
    );
  }
}
