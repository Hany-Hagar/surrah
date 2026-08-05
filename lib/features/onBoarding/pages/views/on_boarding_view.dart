import 'package:flutter/material.dart';
import '../widgets/on_boarding_body.dart';
import '../../models/on_boarding_model.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final PageController pageController = PageController();

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final data = onBoardingsData(context: context);

    return Scaffold(
      body: PageView.builder(
        controller: pageController,
        itemCount: data.length,
        itemBuilder: (context, index) {
          return OnBoardingBody(
            onBoardingModel: data[index],
            pageController: pageController,
            pageIndicator: _PageIndicator(
              data: data,
              pageController: pageController,
            ),
          );
        },
      ),
    );
  }
}

class _PageIndicator extends StatelessWidget {
  final List<OnBoardingModel> data;
  final PageController pageController;

  const _PageIndicator({required this.data, required this.pageController});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return SmoothPageIndicator(
      controller: pageController,
      count: data.length,
      effect: ExpandingDotsEffect(
        spacing: 8,
        dotWidth: 8,
        dotHeight: 8,
        expansionFactor: 3,
        radius: 8,
        dotColor: colors.outlineVariant,
        activeDotColor: colors.secondary,
      ),
    );
  }
}
