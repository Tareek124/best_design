import 'package:equatable/equatable.dart';

class SliderObjects extends Equatable {
  final String lottieImage;
  final String title;
  final String desc;

  const SliderObjects({
    required this.desc,
    required this.lottieImage,
    required this.title,
  });

  @override
  List<Object?> get props => [
        lottieImage,
        title,
        desc,
      ];
}

class SliderViewObject extends Equatable {
  final SliderObjects sliderObjects;
  final int numberOfSliders;
  final int currentIndex;

  const SliderViewObject({
    required this.currentIndex,
    required this.numberOfSliders,
    required this.sliderObjects,
  });

  @override
  List<Object?> get props => [
        sliderObjects,
        currentIndex,
        numberOfSliders,
      ];
}
