import 'package:flutter/material.dart';

class TwitterTabs extends SliverPersistentHeaderDelegate {
  final double size;

  TwitterTabs(this.size);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.blueGrey[900],
      height: size,
      child: TabBar(
        isScrollable: true,
        tabs: <Widget>[
          Tab(
            text: "Tweets",
          ),
          Tab(
            text: "Tweets & replies",
          ),
          Tab(
            text: "Media",
          ),
          Tab(
            text: "Likes",
          ),
          Tab(
            text: "Tweets",
          ),
          Tab(
            text: "Tweets & replies",
          ),
          Tab(
            text: "Media",
          ),
          Tab(
            text: "Likes",
          )
        ],
      ),
    );
  }

  @override
  double get maxExtent => size;

  @override
  double get minExtent => size;

  @override
  bool shouldRebuild(TwitterTabs oldDelegate) {
    return oldDelegate.size != size;
  }
}