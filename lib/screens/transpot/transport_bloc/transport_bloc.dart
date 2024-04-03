import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:car_rent_app/models/transport_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';

part 'transport_event.dart';
part 'transport_state.dart';

class TransportBloc extends Bloc<TransportEvent, TransportState> {
  TransportBloc() : super(TransportInitial()) {
    on<GetAllTransportsEvent>(_GetAllTransportsHandler);
    on<AddTransportEvent>(_addTransportHandler);
    on<DeleteTransportEvent>(_deleteTransportHandler);
    on<EditTransportEvent>(_editTransportHandler);

  }

  void _GetAllTransportsHandler(
      GetAllTransportsEvent event, Emitter<TransportState> emit) async {
    List<TransportModel> transports = [];

    final transportBox = Hive.box('transports');

    if (transportBox.isNotEmpty) {
      for (int i = 0; i < transportBox.length; i++) {
        transports.add(transportBox.getAt(i));
      }

      emit(LoadedAllTransportsState(
          transports: transports.reversed.toList()));
    } else {
      emit(EmptyTransportsListState());
    }
  }

  void _addTransportHandler(
      AddTransportEvent event, Emitter<TransportState> emit) async {
    final transportBox = Hive.box('transports');
    transportBox.add(event.transport);
  }

  void _deleteTransportHandler(
      DeleteTransportEvent event, Emitter<TransportState> emit) async {

    List<TransportModel> transports = [];

    final transportBox = Hive.box('transports');

    if (transportBox.isNotEmpty) {
      for (int i = 0; i < transportBox.length; i++) {
        transports.add(transportBox.getAt(i));
      }

      final int _foundIndex = transports.indexOf(event.transport);
      transportBox.deleteAt(_foundIndex);
    }
  }

  void _editTransportHandler(
      EditTransportEvent event, Emitter<TransportState> emit) async {

    List<TransportModel> transports = [];

    final transportBox = Hive.box('transports');

    if (transportBox.isNotEmpty) {
      for (int i = 0; i < transportBox.length; i++) {
        transports.add(transportBox.getAt(i));
      }

      final int _foundIndex = transports.indexOf(event.transport);
      transportBox.putAt(_foundIndex, event.editedTransport);
    }
  }
}
