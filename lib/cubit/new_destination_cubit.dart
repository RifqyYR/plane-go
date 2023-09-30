import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:plane_go/models/new_destination_model.dart';
import 'package:plane_go/services/new_destination_service.dart';

part 'new_destination_state.dart';

class NewDestinationCubit extends Cubit<NewDestinationState> {
  NewDestinationCubit() : super(NewDestinationInitial());

  void fetchNewDetination() async {
    try {
      emit(NewDestinationLoading());

      List<NewDestinationModel> destinations =
          await NewDestinationService().fetchNewDestinations();

      emit(NewDestinationSuccess(destinations));
    } catch (e) {
      emit(NewDestinationFailed(e.toString()));
    }
  }
}
