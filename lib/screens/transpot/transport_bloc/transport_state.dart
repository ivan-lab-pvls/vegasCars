part of 'transport_bloc.dart';

@immutable
abstract class TransportState {}

class TransportInitial extends TransportState {}

class LoadedAllTransportsState extends TransportState {
  final List<TransportModel> transports;

  LoadedAllTransportsState({required this.transports});
}

class EmptyTransportsListState extends TransportState {}