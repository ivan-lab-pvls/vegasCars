import 'package:car_rent_app/models/transport_model.dart';
import 'package:car_rent_app/router/router.dart';
import 'package:car_rent_app/screens/transpot/transport_bloc/transport_bloc.dart';
import 'package:car_rent_app/theme/colors.dart';
import 'package:car_rent_app/widgets/action_button_widget.dart';
import 'package:car_rent_app/widgets/textfield_app_widget.dart';
import 'package:chip_list/chip_list.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class EditTransportScreen extends StatefulWidget {
  final TransportModel transport;

  const EditTransportScreen({super.key, required this.transport});

  @override
  State<EditTransportScreen> createState() => _EditTransportScreenState();
}

class _EditTransportScreenState extends State<EditTransportScreen> {
  final pageController = PageController();

  final nameController = TextEditingController();
  final rentalCostController = TextEditingController();
  final carYearController = TextEditingController();
  final horsepowerController = TextEditingController();
  final commentController = TextEditingController();

  List<String> paymentTypeList = ['Weekly', 'Monthly', 'Annually'];
  String paymentType = 'Weekly';
  int _paymentTypeIndex = 0;

  List<String> stateList = ['Perfect', 'Average', 'Bad'];
  String state = 'Perfect';
  int _stateIndex = 0;

  int _pageIndex = 0;

  @override
  void initState() {
    initFields();
    super.initState();
  }

  void initFields() {
    nameController.text = widget.transport.name;
    rentalCostController.text = '${widget.transport.rentalCost}';
    carYearController.text = '${widget.transport.carYear}';
    horsepowerController.text = '${widget.transport.horsepower}';
    commentController.text = widget.transport.comment;
  }

  @override
  void dispose() {
    nameController.dispose();
    rentalCostController.dispose();
    carYearController.dispose();
    horsepowerController.dispose();
    commentController.dispose();
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgWhite,
      appBar: AppBar(
        backgroundColor: AppColors.bgWhite,
        leadingWidth: 110,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: GestureDetector(
            onTap: () {
              context.router.pop();
            },
            child: Row(
              children: [
                Icon(Icons.arrow_back_ios_new, color: AppColors.buttonBlue),
                SizedBox(width: 5),
                Text(
                  'Back',
                  style: TextStyle(
                    color: AppColors.buttonBlue,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
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
              SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Edit transport',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 32,
                            color: AppColors.darkBlue,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      TextFieldAppWidget(
                          controller: nameController, title: 'Name of car'),
                      SizedBox(height: 15),
                      TextFieldAppWidget(
                          controller: rentalCostController,
                          title: 'Rental cost, \$'),
                      SizedBox(height: 15),
                      Text(
                        'How often payment is made?',
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
                        listOfChipNames: paymentTypeList,
                        activeBorderColorList: [AppColors.buttonBlue],
                        inactiveBorderColorList: [AppColors.bgWhite],
                        activeBgColorList: [AppColors.blue],
                        inactiveBgColorList: [AppColors.blue],
                        activeTextColorList: [AppColors.darkBlue],
                        inactiveTextColorList: [AppColors.darkBlue],
                        listOfChipIndicesCurrentlySeclected: [
                          _paymentTypeIndex
                        ],
                        shouldWrap: true,
                        checkmarkColor: AppColors.darkBlue,
                        extraOnToggle: (val) {
                          _paymentTypeIndex = val;
                          setState(() {
                            paymentType = paymentTypeList[_paymentTypeIndex];
                          });
                        },
                      ),
                      SizedBox(height: 10),
                      TextFieldAppWidget(
                          controller: carYearController, title: 'Сar year'),
                      SizedBox(height: 15),
                      TextFieldAppWidget(
                          controller: horsepowerController,
                          title: 'Horsepower'),
                      SizedBox(height: 20),
                      ActionButtonWidget(
                          text: 'Continue',
                          width: double.infinity,
                          onTap: () {
                            if (nameController.text.isNotEmpty &&
                                rentalCostController.text.isNotEmpty &&
                                int.tryParse(rentalCostController.text) !=
                                    null &&
                                carYearController.text.isNotEmpty &&
                                int.tryParse(carYearController.text) != null &&
                                horsepowerController.text.isNotEmpty &&
                                int.tryParse(horsepowerController.text) !=
                                    null) {
                              pageController.nextPage(
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.easeInOut);
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor: AppColors.buttonBlue,
                                  content: Text(
                                    'Firstly, enter information',
                                    style: TextStyle(color: AppColors.white),
                                  ),
                                ),
                              );
                            }
                          }),
                    ],
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Edit transport',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 32,
                            color: AppColors.darkBlue,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      TextFieldAppWidget(
                          controller: commentController,
                          title: 'Write a comment about car'),
                      SizedBox(height: 15),
                      Text(
                        'State of transport',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                          color: AppColors.darkBlue,
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
                        listOfChipNames: stateList,
                        activeBorderColorList: [AppColors.buttonBlue],
                        inactiveBorderColorList: [AppColors.bgWhite],
                        activeBgColorList: [AppColors.blue],
                        inactiveBgColorList: [AppColors.blue],
                        activeTextColorList: [AppColors.darkBlue],
                        inactiveTextColorList: [AppColors.darkBlue],
                        listOfChipIndicesCurrentlySeclected: [_stateIndex],
                        shouldWrap: true,
                        checkmarkColor: AppColors.darkBlue,
                        extraOnToggle: (val) {
                          _stateIndex = val;
                          setState(() {
                            state = stateList[_stateIndex];
                          });
                        },
                      ),
                      SizedBox(height: 20),
                      ActionButtonWidget(
                          text: 'Add new transport',
                          width: double.infinity,
                          onTap: () {
                            if (commentController.text.isNotEmpty) {
                              context.read<TransportBloc>().add(
                                  EditTransportEvent(
                                    transport: widget.transport,
                                      editedTransport: TransportModel(
                                          name: nameController.text,
                                          rentalCost: int.parse(
                                              rentalCostController.text),
                                          paymentType: paymentType,
                                          carYear:
                                              int.parse(carYearController.text),
                                          horsepower: int.parse(
                                              horsepowerController.text),
                                          state: state,
                                          comment: commentController.text)));
                              context.router.push(TransportListRoute());
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor: AppColors.buttonBlue,
                                  content: Text(
                                    'Firstly, enter information',
                                    style: TextStyle(color: AppColors.white),
                                  ),
                                ),
                              );
                            }
                          })
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
