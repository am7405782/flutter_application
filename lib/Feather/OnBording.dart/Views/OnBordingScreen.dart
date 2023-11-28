import 'package:flutter/material.dart';
import 'package:flutter_application_1/LoginScrren.dart';
import 'package:flutter_application_1/Feather/OnBording.dart/Widget/MyFadeAnimation.dart';
import 'package:flutter_application_1/core/Constant.dart';
import 'package:flutter_application_1/core/shard/imageAssets.dart';
import 'package:flutter_application_1/core/shard/text.dart';

/// for load image fast you should replace network image with asset image
/// and replace image url with image path
class FurnitureExample extends StatefulWidget {
  const FurnitureExample({super.key});

  @override
  State<FurnitureExample> createState() => _FurnitureExampleState();
}

class _FurnitureExampleState extends State<FurnitureExample>
    with TickerProviderStateMixin {
  final List<dynamic> _furniture = [
    {
      'title': 'Discover \nModern',
      'sub_title': 'Choose from thousands of items that fit your style.',
      'image': "assets/images/one.jpg",
    },
    {
      'title': 'Upgrade \nYour Home',
      'sub_title':
          'Find stylish and high-quality furniture that suits your lifestyle.',
      'image': ondording2,
    },
    {
      'title': 'Shop for the Best',
      'sub_title':
          'Discover innovative designs and attractive colors in our extensive collection.',
      'image': ondording3,
    },
  ];

  late final AnimationController _controller;

  late final Animation<double> _animation;

  int _currentIndex = 0;

  final PageController _pageController = PageController();

  void _nextPage() {
    // next with animation if less than length
    if (_currentIndex < _furniture.length - 1) {
      _pageController.animateToPage(
        _currentIndex + 1,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void initState() {
    _controller =
        AnimationController(duration: const Duration(seconds: 20), vsync: this)
          ..repeat(reverse: true);

    _animation = Tween<double>(begin: 1.0, end: 1.5)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.linear));
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // PageView
          PageView.builder(
            controller: _pageController,
            itemCount: _furniture.length,
            onPageChanged: (int index) {
              _controller.value = 0.0;
              _currentIndex = index;
              _controller.forward();
              setState(() {});
            },
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  // image ====>>>
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    clipBehavior: Clip.hardEdge,
                    decoration: const BoxDecoration(),
                    child: ScaleTransition(
                      scale: _animation,
                      child: Image.asset(
                        _furniture[index]['image'],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  // text ====>>>
                  Container(
                    padding: const EdgeInsets.all(20),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomRight,
                        colors: [
                          Colors.black.withOpacity(0.9),
                          Colors.black.withOpacity(0.8),
                          Colors.black.withOpacity(0.2),
                          Colors.black.withOpacity(0.1),
                        ],
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyFadeAnimation(
                          delay: 3,
                          child: Text(
                            _furniture[index]['title'],
                            style: StyleText.textStyle42,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        MyFadeAnimation(
                          delay: 4,
                          child: Text(
                            _furniture[index]['sub_title'],
                            style: TextStyle(
                              color: Colors.grey.shade400,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        ),

                        // next button ====>>>
                        MyFadeAnimation(
                          delay: 5,
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: MaterialButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40),
                              ),
                              onPressed: () {
                                if (_currentIndex < _furniture.length - 1) {
                                  _nextPage();
                                } else if (_currentIndex ==
                                    _furniture.length - 1) {
                                  navigetFinsh(
                                      navig: const LoginScrren(),
                                      context: context);
                                }
                              },
                              color: Colors.orange,
                              padding: const EdgeInsetsDirectional.only(
                                end: 5,
                                start: 30,
                                top: 5,
                                bottom: 5,
                              ),
                              child: SizedBox(
                                height: 40,
                                width: MediaQuery.of(context).size.width * 0.4,
                                child: Row(
                                  children: [
                                    Text(
                                      _currentIndex == _furniture.length - 1
                                          ? 'Get Started'
                                          : 'Next',
                                      style: TextStyle(
                                        color: Colors.orange.shade50,
                                        fontSize: 16,
                                      ),
                                    ),
                                    const Spacer(),
                                    Container(
                                      padding: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        color: Colors.orange.shade300,
                                        borderRadius: BorderRadius.circular(
                                          40,
                                        ),
                                      ),
                                      child: Icon(
                                        Icons.arrow_forward,
                                        color: Colors.orange.shade100,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),

          // number of pages and current page 1/3 text
          SafeArea(
            child: Container(
              padding: const EdgeInsets.all(20),
              alignment: AlignmentDirectional.topCenter,
              child: MyFadeAnimation(
                delay: 7,
                child: Align(
                  alignment: Alignment.topRight,
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    onPressed: () {
                      navigetFinsh(
                          navig: const LoginScrren(), context: context);
                    },
                    color: Colors.orange,
                    padding: const EdgeInsetsDirectional.only(
                      end: 5,
                      start: 30,
                      top: 5,
                      bottom: 5,
                    ),
                    child: SizedBox(
                      height: 40,
                      width: MediaQuery.of(context).size.width * 0.2,
                      child: Row(
                        children: [
                          Text(
                            "Skip",
                            style: TextStyle(
                              color: Colors.orange.shade50,
                              fontSize: 16,
                            ),
                          ),
                          const Spacer(),
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.orange.shade300,
                              borderRadius: BorderRadius.circular(
                                40,
                              ),
                            ),
                            child: Icon(
                              Icons.arrow_forward,
                              color: Colors.orange.shade100,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
