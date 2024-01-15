import 'package:bridge_software_task/models/product_detail.dart' as pd;
import 'package:bridge_software_task/utils/string_util.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImagesSlider extends StatefulWidget {
  final pd.Media media;

  const ImagesSlider(this.media, {super.key});

  @override
  State<ImagesSlider> createState() => _ImagesSliderState();
}

class _ImagesSliderState extends State<ImagesSlider> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final images = widget.media.images;


    return Column(
      children: [
        CarouselSlider.builder(
          options: CarouselOptions(
            autoPlay: true,
            viewportFraction: 1,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          itemCount: images.length,
          itemBuilder: (ctx, index, _) {
            return Builder(
              builder: (BuildContext context) {
                final imageUrl = StringUtil.convertToUrl(images[index].url);


                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.contain,
                  ),
                );
              },
            );
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: images.map((url) {
            return Container(
              width: 8.0,
              height: 8.0,
              margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: images[_currentIndex] == url ? Theme.of(context).primaryColor : Colors.grey,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
