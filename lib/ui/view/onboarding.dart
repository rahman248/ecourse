import 'package:ecourse/ui/shared/shared_styles.dart';
import 'package:ecourse/ui/shared/ui_helpers.dart';
import 'package:ecourse/ui/viewModels/onboarding_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stacked/stacked.dart';

import '../../main.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {

  final int _numPages = 3;
  final PageController _pageController = PageController(initialPage: 0);

  int _currentPage = 0;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }


  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<OnBoardingViewModel>.reactive(
      viewModelBuilder: () => OnBoardingViewModel(),
      builder: (context, model, child) =>
          Scaffold(
            body: AnnotatedRegion<SystemUiOverlayStyle>(
                value: SystemUiOverlayStyle.light,
                child: Container(
                    decoration: boxDecoration,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 40.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Container(
                            alignment: Alignment.centerRight,
                            margin: const EdgeInsets.only(right: 25),
                            child: ElevatedButton(
                              onPressed: () {
                                model.setStoreFirstTime(true);
                                if (_currentPage == 2){
                                  model.handleOnBoardLogic;
                                }


                              },
                              child: const Text(
                                'Skip',
                                style: kLabelStyle,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.75,
                            child: PageView(
                              physics: const ClampingScrollPhysics(),
                              controller: _pageController,
                              onPageChanged: (int page) {
                                setState(() {
                                  _currentPage = page;
                                });
                              },
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(40.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                    children: const <Widget>[
                                      Flexible(
                                        fit: FlexFit.tight,
                                        flex: 5,
                                        child: Center(
                                          child: Image(
                                            image: AssetImage(
                                              'assets/images/onboarding0.png',
                                            ),
                                            height: 300.0,
                                            width: 300.0,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 30.0),
                                      Text(
                                        'Connect people\naround the world',
                                        style: kTitleStyle,
                                      ),
                                      Expanded(child: SizedBox(height: 100.0)),
                                      Text(
                                        'Lorem ipsum dolor sit amet, consect adipiscing elit, sed do eiusmod tempor incididunt ut labore et.',
                                        style: kSubtitleStyle,
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(40.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                    children: const <Widget>[
                                      Flexible(
                                        fit: FlexFit.tight,
                                        flex: 5,
                                        child: Center(
                                          child: Image(
                                            image: AssetImage(
                                                'assets/images/onboarding1.png'),
                                            height: 300.0,
                                            width: 300.0,
                                          ),
                                        ),
                                      ),
                                      Expanded(child: SizedBox(height: 30.0)),
                                      Text(
                                        'Live your life smarter\nwith us!',
                                        style: kTitleStyle,
                                      ),
                                      Expanded(child: SizedBox(height: 15.0)),
                                      Text(
                                        'Lorem ipsum dolor sit amet, consect adipiscing elit, sed do eiusmod tempor incididunt ut labore et.',
                                        style: kSubtitleStyle,
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(40.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: const <Widget>[
                                      Flexible(
                                        fit: FlexFit.tight,
                                        flex: 5,
                                        child: Center(
                                          child: Image(
                                            image: AssetImage(
                                              'assets/images/onboarding2.png',
                                            ),
                                            width: 300.0,
                                            height: 300.0,
                                          ),
                                        ),
                                      ),
                                      Expanded(child: SizedBox(height: 30.0)),
                                      Text(
                                        'Get a new experience\nof imagination',
                                        style: kTitleStyle,
                                      ),
                                      Expanded(child: SizedBox(height: 10.0)),
                                      Text(
                                        'Lorem ipsum dolor sit amet, consect adipiscing elit, sed do eiusmod tempor incididunt ut labore et.',
                                        style: kSubtitleStyle,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: _buildPageIndicator(),
                          ),

                          _currentPage != _numPages - 1 ? Expanded(
                            child: Container(
                              alignment: FractionalOffset.bottomRight,
                              margin: const EdgeInsets.only(right: 25),
                              child: ElevatedButton(
                                onPressed: () {
                                  _pageController.nextPage(
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.ease,
                                  );
                                  model.setStoreFirstTime(true);
                                  if (_currentPage == 2){
                                    model.handleOnBoardLogic();
                                  }
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: const <Widget>[
                                    Text(
                                      'Next',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(width: 10.0),
                                  ],
                                ),
                              ),
                            ),
                          ) : const Text(''),
                        ],
                      ),

                    )
                ),
            ),
            bottomSheet: _currentPage == _numPages - 1
                ? Container(
              height: 100.0,
              width: double.infinity,
              color: Colors.white,
              child: GestureDetector(
                onTap: () async {
                  print("Data Page == $_currentPage");
                  if (_currentPage == 2){
                    model.setStoreFirstTime(true);
                  }

                  model.handleOnBoardLogic();

                  //Navigator.of(context).pushReplacementNamed(NAV_SCREEN);

                },
                child: const Center(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 30.0),
                    child: Text(
                      'Get started',
                      style: TextStyle(
                        color: Color(0xFF5B16D0),
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ) : const Text(''),
          ),

    );
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      height: 8.0,
      width: isActive ? 24.0 : 16.0,
      decoration: BoxDecoration(
        color: isActive ? Colors.white : const Color(0xFF7B51D3),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
    );
  }
}
