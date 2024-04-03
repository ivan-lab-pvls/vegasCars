import 'package:auto_route/auto_route.dart';
import 'package:car_rent_app/models/transport_model.dart';
import 'package:car_rent_app/router/router.dart';
import 'package:car_rent_app/screens/transpot/transport_bloc/transport_bloc.dart';
import 'package:car_rent_app/screens/transpot/transport_info/widget/info_row_widget.dart';
import 'package:car_rent_app/theme/colors.dart';
import 'package:car_rent_app/widgets/action_button_widget.dart';
import 'package:car_rent_app/widgets/app_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class TransportInfoScreen extends StatefulWidget {
  final TransportModel transport;

  const TransportInfoScreen({super.key, required this.transport});

  @override
  State<TransportInfoScreen> createState() => _TransportInfoScreenState();
}

class _TransportInfoScreenState extends State<TransportInfoScreen> {
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
              context.router.push(TransportListRoute());
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
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: GestureDetector(
              onTap: () {
                context.router.push(EditTransportRoute(transport: widget.transport));
              },
              child: Text(
                'Edit',
                style: TextStyle(
                  color: AppColors.buttonBlue,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Transport info',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 32,
                      color: AppColors.darkBlue,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                AppContainer(child: Column(
                  children: [
                    InfoRowWidget(title: 'Name', value: widget.transport.name),
                    SizedBox(height: 15),
                    InfoRowWidget(title: 'Rental cost', value: '${widget.transport.rentalCost}\$'),
                    SizedBox(height: 15),
                    InfoRowWidget(title: 'Payment type', value: widget.transport.paymentType),
                    SizedBox(height: 15),
                    InfoRowWidget(title: 'Сar year', value: '${widget.transport.carYear}'),
                    SizedBox(height: 15),
                    InfoRowWidget(title: 'Horsepower', value: '${widget.transport.horsepower}'),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'State',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: AppColors.darkBlue50,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: AppColors.darkBlue,
                              borderRadius:
                              BorderRadius.all(
                                  Radius.circular(
                                      8.0))),
                          child: Text(
                            widget.transport.state,
                            style: TextStyle(
                              color: widget.transport.state ==
                                  'Perfect'
                                  ? AppColors.green
                                  : widget.transport.state ==
                                  'Average'
                                  ? AppColors.orange
                                  : AppColors.red,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                )),
                SizedBox(height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Comment',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: AppColors.darkBlue50,
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    Container(
                        width: double.infinity,
                        padding:
                        EdgeInsets.symmetric(horizontal: 22, vertical: 16),
                        decoration: BoxDecoration(
                            color: AppColors.blue,
                            borderRadius:
                            BorderRadius.all(Radius.circular(8.0))),
                        child: Text(
                          widget.transport.comment,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: AppColors.darkBlue,
                          ),
                        )),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ActionButtonWidget(
          text: 'Delete transport',
          width: 350,
          onTap: () {
            context.read<TransportBloc>().add(DeleteTransportEvent(transport: widget.transport));
            context.router.push(TransportListRoute());
          }),
    );
  }
}
