part of 'new_destination_cubit.dart';

abstract class NewDestinationState extends Equatable {
  const NewDestinationState();

  @override
  List<Object> get props => [];
}

class NewDestinationInitial extends NewDestinationState {}

class NewDestinationLoading extends NewDestinationState {}

class NewDestinationSuccess extends NewDestinationState {
  final List<NewDestinationModel> destinations;

  const NewDestinationSuccess(this.destinations);

  @override
  List<Object> get props => [destinations];
}

class NewDestinationFailed extends NewDestinationState {
  final String error;

  const NewDestinationFailed(this.error);

  @override
  List<Object> get props => [error];
}
