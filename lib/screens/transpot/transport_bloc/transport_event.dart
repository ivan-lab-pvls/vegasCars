part of 'transport_bloc.dart';

@immutable
abstract class TransportEvent {}

class GetAllTransportsEvent extends TransportEvent {}

class AddTransportEvent extends TransportEvent {
  final TransportModel transport;

  AddTransportEvent({required this.transport});
}

class DeleteTransportEvent extends TransportEvent {
  final TransportModel transport;

  DeleteTransportEvent({required this.transport});
}

class EditTransportEvent extends TransportEvent {
  final TransportModel transport;
  final TransportModel editedTransport;

  EditTransportEvent({required this.transport, required this.editedTransport});
}