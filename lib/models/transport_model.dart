import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'transport_model.g.dart';

@HiveType(typeId: 0)
class TransportModel {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final int rentalCost;
  @HiveField(2)
  final String paymentType;
  @HiveField(3)
  final int carYear;
  @HiveField(4)
  final int horsepower;
  @HiveField(5)
  final String state;
  @HiveField(6)
  final String comment;

  TransportModel(
      {required this.name,
      required this.rentalCost,
      required this.paymentType,
      required this.carYear,
      required this.horsepower,
      required this.state,
      required this.comment});
}
