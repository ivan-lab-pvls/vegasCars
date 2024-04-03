import 'package:auto_route/auto_route.dart';
import 'package:car_rent_app/router/router.dart';
import 'package:car_rent_app/theme/colors.dart';
import 'package:car_rent_app/widgets/action_button_widget.dart';
import 'package:car_rent_app/widgets/textfield_app_widget.dart';
import 'package:chip_list/chip_list.dart';
import 'package:flutter/material.dart';

@RoutePage()
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final pageController = PageController();

  final nameController = TextEditingController();

  List<String> timesList = ['1-3 times', '4-7 times', 'More than 7 times'];
  String times = '1-3 times';
  int _timesIndex = 0;

  int _pageIndex = 0;

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgWhite,
      body: SafeArea(
        child: Container(
          child: PageView(
            physics: NeverScrollableScrollPhysics(),
            controller: pageController,
            onPageChanged: (index) {
              setState(() {
                _pageIndex = index;
              });
            },
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/elements/onboarding-image.png',
                      width: 340),
                  SizedBox(height: 40),
                  Text(
                    'Manage your rental',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 32,
                      color: AppColors.darkBlue,
                    ),
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    width: 200,
                    child: Text(
                      'Keep track of your water transportation rentals',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: AppColors.darkBlue50,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Let’s start',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 32,
                        color: AppColors.darkBlue,
                      ),
                    ),
                    SizedBox(height: 20),
                    TextFieldAppWidget(controller: nameController, title: 'What is your name?'),
                    SizedBox(height: 20),
                    Text(
                      'How often you rent a car per month?',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: AppColors.darkBlue50,
                      ),
                    ),
                    SizedBox(height: 5),
                    ChipList(
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                      spacing: 10,
                      runSpacing: 10,
                      listOfChipNames: timesList,
                      activeBorderColorList: [AppColors.buttonBlue],
                      inactiveBorderColorList: [AppColors.bgWhite],
                      activeBgColorList: [AppColors.blue],
                      inactiveBgColorList: [AppColors.blue],
                      activeTextColorList: [AppColors.darkBlue],
                      inactiveTextColorList: [AppColors.darkBlue],
                      listOfChipIndicesCurrentlySeclected: [_timesIndex],
                      shouldWrap: true,
                      checkmarkColor: AppColors.darkBlue,
                      extraOnToggle: (val) {
                        _timesIndex = val;
                        setState(() {
                          times = timesList[_timesIndex];
                        });
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ActionButtonWidget(
          text: _pageIndex == 0 ? 'Next' : 'Continue',
          width: 350,
          onTap: () {
            if (_pageIndex == 0) {
              pageController.nextPage(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut);
            } else {
              context.router.push(TransportListRoute());
            }
          }),
    );
  }
}
