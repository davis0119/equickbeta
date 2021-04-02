import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ImageCarousel extends StatefulWidget {
  @override
  _ImageCarouselState createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {

  int _current = 0;
  List<Widget> photos = [
    Container(color: Colors.red), Container(color: Colors.blue), Container(color: Colors.green),
  ];
  final CarouselController _controller = CarouselController();


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          CarouselSlider.builder(
            itemBuilder: (context, index, realIdx) {
              return Container(
                margin: EdgeInsets.all(5.0),
                child: photos[index],
              );
            },
            itemCount: photos.length,
            options: CarouselOptions(
              scrollDirection: Axis.horizontal,
              height: 250,
              aspectRatio: 2,
              viewportFraction: 0.7,
              initialPage: _current,
              enableInfiniteScroll: false,
              autoPlay: false,
              enlargeCenterPage: true,
              enlargeStrategy: CenterPageEnlargeStrategy.scale,
            ),
            carouselController: _controller,
          ),
        ],
      ),
    );
  }
}


/*class ImageSlideshow extends StatefulWidget {
  @override
  _ImageSlideshowState createState() => _ImageSlideshowState();
}

class _ImageSlideshowState extends State<ImageSlideshow> {

  final PageController ctrl = PageController(viewportFraction: 0.8);

  // Keep track of current page to avoid unnecessary renders
  int currentPage = 0;

  @override
  void initState() {
    // Set state when page changes
    ctrl.addListener(() {
      int next = ctrl.page.round();

      if(currentPage != next) {
        setState(() {
          currentPage = next;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: ctrl,
      itemCount: 3,
      itemBuilder: (context, int currentIdx) {
        if (currentIdx == 0) {
          return _buildTagPage();
        } else if (2 >= currentIdx) {
          // Active page
          bool active = currentIdx == currentPage;
          return _buildStoryPage();
        }
      },
    );
  }
}*/
