import 'package:best_ui_design_flutter/presentation/resources/appbar_widget.dart';
import 'package:best_ui_design_flutter/presentation/resources/routes_manager.dart';

import '../../../../domain/models/models.dart';
import '../../color_manager.dart';
import '../onboardin_viewmodel/onboarding_viewmodel.dart';
import '../../strings_manager.dart';
import '../../values_manager.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  OnboardingViewModel viewModel = OnboardingViewModel();
  final PageController controller = PageController();

  @override
  void initState() {
    viewModel.start();
    super.initState();
  }

  @override
  void dispose() {
    viewModel.dispose();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: viewModel.outputs,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: Text("Loading....."),
            );
          } else if (snapshot.data == null) {
            return const Center(
              child: Text("Error....."),
            );
          }

          return Scaffold(
            backgroundColor: ColorManager.white,
            appBar: appBarWidget(),
            body: PageView.builder(
              itemCount: snapshot.data!.numberOfSliders,
              onPageChanged: viewModel.onPageChanged,
              controller: controller,
              itemBuilder: (context, index) {
                return _BuildPageView(sliderViewObject: snapshot.data);
              },
            ),
            bottomSheet: Container(
              margin: const EdgeInsets.all(AppMargin.m20),
              color: ColorManager.white,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  snapshot.data!.currentIndex ==
                          snapshot.data!.numberOfSliders - 1
                      ? const SizedBox()
                      : Align(
                          alignment: Alignment.bottomRight,
                          child: TextButton(
                              onPressed: () {
                                controller.animateToPage(
                                    snapshot.data!.numberOfSliders - 1,
                                    duration: const Duration(microseconds: 300),
                                    curve: Curves.linear);
                              },
                              child: const Text(
                                AppString.skip,
                                style: TextStyle(
                                  color: ColorManager.primary,
                                ),
                              ))),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                          onTap: () => controller.animateToPage(
                              viewModel.goPrevious(),
                              duration: const Duration(microseconds: 400),
                              curve: Curves.linear),
                          child: const Icon(
                            Icons.arrow_back_ios,
                            color: ColorManager.primary,
                          )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(snapshot.data!.numberOfSliders,
                            (circleIndex) {
                          return Padding(
                            padding: const EdgeInsets.all(AppPadding.p8),
                            child: Icon(
                              Icons.circle,
                              color: circleIndex == snapshot.data!.currentIndex
                                  ? ColorManager.secondary
                                  : ColorManager.primary,
                              size: 13,
                            ),
                          );
                        }),
                      ),
                      GestureDetector(
                          onTap: () => controller.animateToPage(
                              viewModel.goNext(),
                              duration: const Duration(microseconds: 400),
                              curve: Curves.bounceIn),
                          child: const Icon(
                            Icons.arrow_forward_ios,
                            color: ColorManager.primary,
                          ))
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }
}

class _BuildPageView extends StatelessWidget {
  final SliderViewObject? sliderViewObject;
  const _BuildPageView({required this.sliderViewObject});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: AppSize.s20,
          ),
          Lottie.asset(sliderViewObject!.sliderObjects.lottieImage,
              repeat: false),
          Padding(
            padding: const EdgeInsets.only(top: 35),
            child: Text(
              sliderViewObject!.sliderObjects.title,
              style: Theme.of(context).textTheme.displayLarge,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(AppSize.s40),
            child: Text(
              sliderViewObject!.sliderObjects.desc,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ),
          sliderViewObject!.currentIndex ==
                  sliderViewObject!.numberOfSliders - 1
              ? GestureDetector(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, Routes.loginRoute);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Begin Learning",
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                      const Icon(
                        Icons.arrow_forward_ios,
                        color: ColorManager.primary,
                      )
                    ],
                  ),
                )
              : const SizedBox()
        ],
      ),
    );
  }
}
