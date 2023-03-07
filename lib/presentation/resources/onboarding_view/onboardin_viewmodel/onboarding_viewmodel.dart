import 'dart:async';

import '../../../../domain/models/models.dart';
import '../../assets_manager.dart';
import '../../base/base_viewmodel/base_viewmodel.dart';
import '../../strings_manager.dart';

class OnboardingViewModel extends BaseViewModel
    with OnboardingViewModelInputs, OnboardingViewModelOutpus {
  int _currentIndex = 0;
  final StreamController<SliderViewObject> _streamController =
      StreamController();

  List<SliderObjects>? _list;

  final List<SliderObjects> _getObjects = <SliderObjects>[
    const SliderObjects(
        desc: AppString.desc,
        lottieImage: LottieImages.onboarding1,
        title: AppString.title1),
    const SliderObjects(
        desc: AppString.desc,
        lottieImage: LottieImages.onboarding2,
        title: AppString.title2),
    const SliderObjects(
        desc: AppString.desc,
        lottieImage: LottieImages.onboarding3,
        title: AppString.title3),
  ];
  @override
  void dispose() {
    _streamController.close();
  }

  @override
  void start() {
    _list = _getObjects;
    _putDataToView();
  }

  void _putDataToView() {
    inputs.add(SliderViewObject(
        currentIndex: _currentIndex,
        numberOfSliders: _list!.length,
        sliderObjects: _list![_currentIndex]));
  }

  @override
  Sink get inputs => _streamController.sink;

  @override
  Stream<SliderViewObject> get outputs =>
      _streamController.stream.map((sliderViewObject) => sliderViewObject);

  @override
  int goNext() {
    int nextIndex = ++_currentIndex;
    if (nextIndex == _list!.length) {
      nextIndex = 0;
    }
    return nextIndex;
  }

  @override
  int goPrevious() {
    int previousIndex = --_currentIndex;
    if (previousIndex == -1) {
      previousIndex = _list!.length - 1;
    }
    return previousIndex;
  }

  @override
  void onPageChanged(int index) {
    _currentIndex = index;
    _putDataToView();
  }
}

abstract class OnboardingViewModelInputs {
  int goNext();
  int goPrevious();
  void onPageChanged(int index);
  Sink get inputs;
}

abstract class OnboardingViewModelOutpus {
  Stream get outputs;
}
