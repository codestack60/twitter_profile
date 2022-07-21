import 'package:flutter/material.dart';
import 'package:twitter_profile/widgets/my_avatar.dart';
import 'package:twitter_profile/widgets/tweets.dart';
import 'package:twitter_profile/widgets/twitter%20tabs.dart';
import 'package:twitter_profile/widgets/twitter_header.dart';

class TwitterProfilePage extends StatefulWidget {
  @override
  _TwitterProfilePageState createState() => _TwitterProfilePageState();
}

class _TwitterProfilePageState extends State<TwitterProfilePage> {
  static double avatarMaximumRadius = 40.0;
  static double avatarMinimumRadius = 15.0;
  double avatarRadius = avatarMaximumRadius;
  double expandedHeader = 130.0;
  double translate = -avatarMaximumRadius;
  bool isExpanded = true;
  double offset = 0.0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueGrey[900],
        body: NotificationListener<ScrollUpdateNotification>(
          onNotification: (scrollNotification) {
            final pixels = scrollNotification.metrics.pixels;

            // check if scroll is vertical ( left to right OR right to left)
            final scrollTabs = (scrollNotification.metrics.axisDirection ==
                    AxisDirection.right ||
                scrollNotification.metrics.axisDirection == AxisDirection.left);

            if (!scrollTabs) {
              // and here prevents animation of avatar when you scroll tabs
              if (expandedHeader - pixels <= kToolbarHeight) {
                if (isExpanded) {
                  translate = 0.0;
                  setState(() {
                    isExpanded = false;
                  });
                }
              } else {
                translate = -avatarMaximumRadius + pixels;
                if (translate > 0) {
                  translate = 0.0;
                }
                if (!isExpanded) {
                  setState(() {
                    isExpanded = true;
                  });
                }
              }

              offset = pixels * 0.4;

              final newSize = (avatarMaximumRadius - offset);

              setState(() {
                if (newSize < avatarMinimumRadius) {
                  avatarRadius = avatarMinimumRadius;
                } else if (newSize > avatarMaximumRadius) {
                  avatarRadius = avatarMaximumRadius;
                } else {
                  avatarRadius = newSize;
                }
              });
            }
            return false;
          },
          child: DefaultTabController(
            length: 8,
            child: CustomScrollView(
              physics: ClampingScrollPhysics(),
              slivers: <Widget>[
                SliverAppBar(
                  expandedHeight: expandedHeader,
                  backgroundColor: Colors.grey,
                  leading: BackButton(
                    color: isExpanded ? Colors.grey : Colors.white,
                  ),
                  pinned: true,
                  elevation: 5.0,
                  forceElevated: true,
                  flexibleSpace: Container(
                    decoration: BoxDecoration(
                        color:
                            isExpanded ? Colors.transparent : Colors.blue[800],
                        image: isExpanded
                            ? DecorationImage(
                                fit: BoxFit.cover,
                                alignment: Alignment.bottomCenter,
                                image:
                                    NetworkImage("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAMoAAAD6CAMAAADXwSg3AAAAkFBMVEX///85zv0DVpsWuf0iy/32/f/7/f7f9f8IW54Atf0yzf0AUZkAt/00y/0AUJgAS5bx+/983P540v5H0f3v9Pjp+f+k5v4taaV73P6K3/6d5P70+Ptg1v1w2f5S0/2R4f6y6f4yv/0fr/Biibfa9P9uz/4eYqFdhrXO8f47wf2U2v4Gqu3m7PIAWZ1izf80bac7nreYAAAD8UlEQVR4nO3ciVIaYRAE4IVdUCExGHKo8Qox5tS8/9sF1IRjD/5j1pnp6nmDr7p7t7aooih4vM0bCd1srC25nAxErrrQpkhJJhfKkOICRoKTyWVFCSW9SbgTSiihhBJKKOlDcgUjYSZid8pMahL173iYduFIxHYCJNHeCSXIEmVIcQKTCSV1yUhZgrN4uUyUIdxJg0R7J5TUJTDtmsNIcDIB2gmMZI4j0d7JGUy7KAGWqC9eTgKzeJxMuBNKepRw8ZRQQgkllFBCSR93TUlNMqPEmmSA0y4cCUy7KLEn4eINSmDahSMZUEJJbxKcneBIcNpFiT0JdyJ255RQ4kDynhJzEpx2UWJPgrMTSiihhBJK4u+DlGSiLcHJBEci1i4cifpOKKlJcNpFiT1J0E5GB0J3W/+l+YUl80rozvqTBLVrNJD6O+NrbcncgSSoXTNKdk9dgtMuH5IDGMnLZlJ/nxQ3MpSXzqRBImQxIRGxGJEIWMxIsi2GJJkWU5Isy6QyJcmwGMskw2JQkmqx1q50i8VM0iw2M0mxWM0k3mI3k1hLmORKSnISJ4mxWJeEW4IkY7F2JUhCLR4kYZYgyUzGkS4J+dwPk3x+9VpZsj+X6jZMUpYSlhzJvlyCJKNyKZGw5Em6LWHtepLkW3IlXZbQnZSlhCVf0m4J34mERULSZomX5FhkJM2WsMVvS9It1amMpMkSlkm5I0m1yEnqlpR2pVskJbuWdEmKRWonTZYcSbxFWrJpiXnH51tk27VtyZXEWeQzWVvy2hVr6UfyZEl7n6Ra+pKsLDKSUEt/kqI4/y4jCbP0sfioC5KEWLxI9lv8SPZZPEm6LeqScYyky6Iuicqky+JP0mbxKGm2qEsid9Ju8SqpW9QlSe1qslSX2pIfyZJti2/JpkW9XeM8ydqinkmRvpNti7ok+dm1a1GXZO5kbUGRLC3aiy9+HslIyl+/tSnFWxnLYnj/TpsiY1kMh9MhhGUpWVoQcnmULC2H7i3PEgDLf4l7y4bE+fa3JK5z2ZE4ttQkbi0NEqeWRonLd+XivpniL5dWydJy58rSIXFmadmJw47tkTjafme7XOWyONwrcWIJyOTRYmD7X7stgZJVLp+0Kd2WYMlq+6YtERIbe2m1BC1+w2J3L5ESw5aodj1bbG4/QWJ0L9HterbY61iixKAlWWLPkrKTtcXQ9pMWv2Gx8xzLaNe/XPQ79nAkITFjEZDY2MtD5k4sWb68EaGY2L6YBSkXIMsxkGV6N9amsGPgluOPtJi0AG0fyoLUMSgLUsdosWkB2ssfpFz0Ld9owbYg7YUW0ZPrmLaEezFrGR6K3NSAZSx22hIej8fLvL/HgMzqjQoorwAAAABJRU5ErkJggg=="))
                            : null),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: isExpanded
                          ? Transform(
                              transform: Matrix4.identity()
                                ..translate(0.0, avatarMaximumRadius),
                              child: MyAvatar(
                                size: avatarRadius,
                              ),
                            )
                          : SizedBox.shrink(),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            isExpanded
                                ? SizedBox(
                                    height: avatarMinimumRadius * 2,
                                  )
                                : MyAvatar(
                                    size: avatarMinimumRadius,
                                  ),
                            Padding(
                              padding: const EdgeInsets.only(right: 10.0),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 5.0, horizontal: 10.0),
                                decoration: BoxDecoration(
                                  color: Colors.lightBlue,
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Text(
                                  "Following",
                                  style: TextStyle(
                                      fontSize: 17.0, color: Colors.white),
                                ),
                              ),
                            )
                          ],
                        ),
                        TwitterHeader(),
                      ],
                    ),
                  ),
                ),
                SliverPersistentHeader(
                  pinned: true,
                  delegate: TwitterTabs(50.0),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return Tweet();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}







