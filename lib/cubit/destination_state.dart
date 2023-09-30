part of 'destination_cubit.dart';

abstract class DestinationState extends Equatable {
  const DestinationState();

  @override
  List<Object> get props => [];
}

class DestinationInitial extends DestinationState {}

class DestinationLoading extends DestinationState {}

class DestinationSucces extends DestinationState {
  final List<DestinationModel> destinations;

  const DestinationSucces(this.destinations);

  @override
  List<Object> get props => [destinations];
}

class DestinationFailed extends DestinationState {
  final String error;

  const DestinationFailed(this.error);

  @override
  List<Object> get props => [error];
}
