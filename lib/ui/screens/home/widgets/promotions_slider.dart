import 'package:bridge_software_task/utils/image_constants.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PromotionsSlider extends StatefulWidget {
  PromotionsSlider({Key? key}) : super(key: key);

  @override
  State<PromotionsSlider> createState() => _PromotionsSliderState();
}

class _PromotionsSliderState extends State<PromotionsSlider> {
  final imgCount = 5;
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          options: CarouselOptions(
            autoPlay: true,
            height: 250.0,
            viewportFraction: 1,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          itemCount: imgCount,
          itemBuilder: (ctx, index, _) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Image.asset(
                    ImageConstants.promotionImages[index],
                    fit: BoxFit.fill,
                  ),
                );
              },
            );
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: ImageConstants.promotionImages.map((url) {
            return Container(
              width: 8.0,
              height: 8.0,
              margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: ImageConstants.promotionImages[_currentIndex] == url ? Theme.of(context).primaryColor : Colors.grey,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
