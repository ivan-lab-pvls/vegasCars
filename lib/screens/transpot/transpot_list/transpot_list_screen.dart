import 'package:auto_route/auto_route.dart';
import 'package:car_rent_app/router/router.dart';
import 'package:car_rent_app/screens/transpot/transport_bloc/transport_bloc.dart';
import 'package:car_rent_app/theme/colors.dart';
import 'package:car_rent_app/widgets/action_button_widget.dart';
import 'package:car_rent_app/widgets/app_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class TransportListScreen extends StatefulWidget {
  const TransportListScreen({super.key});

  @override
  State<TransportListScreen> createState() => _TransportListScreenState();
}

class _TransportListScreenState extends State<TransportListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgWhite,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        context.router.push(SettingsRoute());
                      },
                      child: Text(
                        'Settings',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                          color: AppColors.buttonBlue,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        context.router.push(NewsListRoute());
                      },
                      child: Text(
                        'News',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                          color: AppColors.buttonBlue,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                BlocProvider(
                  create: (context) =>
                      TransportBloc()..add(GetAllTransportsEvent()),
                  child: BlocConsumer<TransportBloc, TransportState>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      if (state is EmptyTransportsListState) {
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: 50),
                            Image.asset('assets/images/elements/list-image.png',
                                width: 325),
                            SizedBox(height: 50),
                            Text(
                              'There\'s no info',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                                color: AppColors.darkBlue,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Add a new car via the button below',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: AppColors.darkBlue50,
                              ),
                            ),
                          ],
                        );
                      } else if (state is LoadedAllTransportsState) {
                        return Column(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Main',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 32,
                                  color: AppColors.darkBlue,
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            ListView.separated(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              padding: EdgeInsets.symmetric(vertical: 16),
                              itemCount: state.transports.length,
                              separatorBuilder:
                                  (BuildContext context, int index) =>
                                      const SizedBox(height: 15),
                              itemBuilder: (BuildContext context, int index) {
                                final transport = state.transports[index];
                                return GestureDetector(
                                  onTap: () {
                                    context.router.push(TransportInfoRoute(transport: transport));
                                  },
                                  child: AppContainer(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              transport.name,
                                              style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 16,
                                                color: AppColors.darkBlue,
                                              ),
                                            ),
                                            Text(
                                              '${transport.carYear}',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 16,
                                                color: AppColors.darkBlue,
                                              ),
                                            ),
                                            SizedBox(height: 10),
                                            Text(
                                              '${transport.rentalCost}\$ ${transport.paymentType}',
                                              style: TextStyle(
                                                color: AppColors.darkBlue50,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          children: [
                                            Container(
                                              padding: EdgeInsets.all(8),
                                              decoration: BoxDecoration(
                                                  color: AppColors.darkBlue,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              8.0))),
                                              child: Text(
                                                transport.state,
                                                style: TextStyle(
                                                  color: transport.state ==
                                                          'Perfect'
                                                      ? AppColors.green
                                                      : transport.state ==
                                                              'Average'
                                                          ? AppColors.orange
                                                          : AppColors.red,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 15),
                                            Icon(
                                              Icons.arrow_forward_ios_rounded,
                                              color: AppColors.buttonBlue,
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        );
                      }
                      return Center(child: CircularProgressIndicator());
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ActionButtonWidget(
          text: 'Add new transport',
          width: 350,
          onTap: () {
            context.router.push(AddTransportRoute());
          }),
    );
  }
}
