import 'package:easecar/app/theme/app_colors.dart';
import 'package:easecar/app/theme/app_dimensions.dart';
import 'package:flutter/material.dart';

class ImageCarouselWidget extends StatefulWidget {
  final PageController pageController;
  final int currentIndex;
  final Function(int) onImageTap;

  const ImageCarouselWidget({
    super.key,
    required this.pageController,
    required this.currentIndex,
    required this.onImageTap,
  });

  @override
  ImageCarouselWidgetState createState() => ImageCarouselWidgetState();
}

class ImageCarouselWidgetState extends State<ImageCarouselWidget> {
  final List<String> _images = [
    'https://www.w3schools.com/w3images/fjords.jpg',
    'https://www.w3schools.com/w3images/mountains.jpg',
    'https://www.w3schools.com/w3images/lights.jpg',
    'https://www.w3schools.com/w3images/forest.jpg',
    'https://www.w3schools.com/w3images/snow.jpg',
    'https://www.w3schools.com/w3images/rocks.jpg',
    'https://www.w3schools.com/w3images/fjords.jpg',
    'https://www.w3schools.com/w3images/fjords.jpg',
    'https://www.w3schools.com/w3images/fjords.jpg',
    'https://www.w3schools.com/w3images/fjords.jpg',
    'https://www.w3schools.com/w3images/fjords.jpg',
    'https://www.w3schools.com/w3images/fjords.jpg',
    'https://www.w3schools.com/w3images/fjords.jpg',
    'https://www.w3schools.com/w3images/fjords.jpg',
    'https://www.w3schools.com/w3images/fjords.jpg',
    'https://www.w3schools.com/w3images/fjords.jpg',
    'https://www.w3schools.com/w3images/fjords.jpg',
  ];

  bool showAllThumbnails = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 240,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: PageView.builder(
            controller: widget.pageController,
            itemCount: _images.length,
            onPageChanged: (index) {
              widget.onImageTap(index);
            },
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppDimensions.mediumExtra,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    _images[index],
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: AppDimensions.smallMedium),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimensions.mediumExtra,
          ),
          child: SizedBox(
            height: 50.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: showAllThumbnails
                  ? _images.length
                  : (_images.length > 5 ? 5 : _images.length),
              itemBuilder: (context, index) {
                bool isLastVisible =
                    index == 4 && _images.length > 5 && !showAllThumbnails;
                return GestureDetector(
                  onTap: () {
                    if (isLastVisible) {
                      setState(() {
                        showAllThumbnails = true;
                      });
                    } else {
                      widget.pageController.jumpToPage(index);
                      widget.onImageTap(index);
                    }
                  },
                  child: Stack(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: AppDimensions.lineExtra,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(
                            color: widget.currentIndex == index
                                ? AppColors.primaryColor
                                : Colors.transparent,
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: Image.network(
                            _images[index],
                            width: 50.0,
                            height: 42.0,
                            fit: BoxFit.cover,
                            color: isLastVisible
                                ? const Color.fromRGBO(255, 255, 255, 0.6)
                                : null,
                            colorBlendMode:
                                isLastVisible ? BlendMode.lighten : null,
                          ),
                        ),
                      ),
                      if (isLastVisible)
                        Positioned.fill(
                          child: Center(
                            child: Text(
                              '+${_images.length - 5}',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: AppColors.primaryColor,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
