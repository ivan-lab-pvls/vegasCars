// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transport_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TransportModelAdapter extends TypeAdapter<TransportModel> {
  @override
  final int typeId = 0;

  @override
  TransportModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TransportModel(
      name: fields[0] as String,
      rentalCost: fields[1] as int,
      paymentType: fields[2] as String,
      carYear: fields[3] as int,
      horsepower: fields[4] as int,
      state: fields[5] as String,
      comment: fields[6] as String,
    );
  }

  @override
  void write(BinaryWriter writer, TransportModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.rentalCost)
      ..writeByte(2)
      ..write(obj.paymentType)
      ..writeByte(3)
      ..write(obj.carYear)
      ..writeByte(4)
      ..write(obj.horsepower)
      ..writeByte(5)
      ..write(obj.state)
      ..writeByte(6)
      ..write(obj.comment);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TransportModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
