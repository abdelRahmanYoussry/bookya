import 'package:flutter/material.dart';

import '../widget/circular_indecator.dart';

class SlideShow extends StatelessWidget {
  final double height;
  final double width;

  final List images;
  const SlideShow({
    Key? key,
    required this.height,
    required this.images,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height / 3.5,
      width: double.infinity,
      child: PageView.builder(
        itemCount: images[0].length,
        pageSnapping: true,
        itemBuilder: (context, pagePosition) {
          return Column(
            children: [
              Flexible(
                child: SizedBox(
                  height: height / 3.5,
                  width: double.infinity,
                  child: Image.network(
                    images[0][pagePosition],
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0; i < images[0].length; i++)
                    if (i == pagePosition) ...[
                      const CircularIndecator(isActive: true)
                    ] else
                      const CircularIndecator(isActive: false),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
