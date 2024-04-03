import 'package:auto_route/auto_route.dart';
import 'package:car_rent_app/theme/colors.dart';
import 'package:car_rent_app/widgets/action_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:in_app_review/in_app_review.dart';

@RoutePage()
class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgWhite,
      appBar: AppBar(
        backgroundColor: AppColors.bgWhite,
        leadingWidth: 110,
        leading: GestureDetector(
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Settings',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 32,
                      color: AppColors.darkBlue,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 22, vertical: 16),
                  decoration: BoxDecoration(
                      color: AppColors.blue,
                      borderRadius: BorderRadius.all(Radius.circular(8.0))),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/elements/settings-image.png',
                          width: 260),
                      SizedBox(height: 20),
                      Text(
                        'Your opinion is important!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                          color: AppColors.darkBlue,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'We need your feedback to get better',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: AppColors.darkBlue50,
                        ),
                      ),
                      SizedBox(height: 20),
                      ActionButtonWidget(
                          text: 'Rate app',
                          width: 300,
                          onTap: () {
                            InAppReview.instance
                                .openStoreListing(appStoreId: '6480516957');
                          })
                    ],
                  ),
                ),
                SizedBox(height: 15),
                ListTile(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute<void>(
                          builder: (BuildContext context) => const Read(
                                reader:
                                    'https://docs.google.com/document/d/1xWRoXUq5N2YO__JfgxtcKRU6BkqumhJI_IF-_piq5Ig/edit?usp=sharing',
                              )),
                    );
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  tileColor: AppColors.blue,
                  leading: SvgPicture.asset('assets/images/settings/terms.svg'),
                  title: Text(
                    'Terms of use',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: AppColors.darkBlue,
                    ),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios_rounded,
                      color: AppColors.buttonBlue),
                ),
                SizedBox(height: 15),
                ListTile(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute<void>(
                          builder: (BuildContext context) => const Read(
                                reader:
                                    'https://docs.google.com/document/d/1Tsx3w4S8cmDinPhIt0PF6fejfy1QUPDl6p-Tj-Qk-LM/edit?usp=sharing',
                              )),
                    );
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  tileColor: AppColors.blue,
                  leading:
                      SvgPicture.asset('assets/images/settings/privacy.svg'),
                  title: Text(
                    'Privacy Policy',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: AppColors.darkBlue,
                    ),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios_rounded,
                      color: AppColors.buttonBlue),
                ),
                SizedBox(height: 15),
                ListTile(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute<void>(
                          builder: (BuildContext context) => const Read(
                                reader: 'https://forms.gle/D52HH2LUUfKwJjSj9',
                              )),
                    );
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  tileColor: AppColors.blue,
                  leading:
                      SvgPicture.asset('assets/images/settings/support.svg'),
                  title: Text(
                    'Support page',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: AppColors.darkBlue,
                    ),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios_rounded,
                      color: AppColors.buttonBlue),
                ),
                SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Read extends StatelessWidget {
  final String reader;

  const Read({Key? key, required this.reader}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
      ),
      body: SafeArea(
        bottom: false,
        child: InAppWebView(
          initialUrlRequest: URLRequest(url: Uri.parse(reader)),
        ),
      ),
    );
  }
}
