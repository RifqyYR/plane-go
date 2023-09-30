import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:plane_go/models/new_destination_model.dart';

class NewDestinationService {
  final CollectionReference _newDestinationRef =
      FirebaseFirestore.instance.collection('new_destination');

  Future<List<NewDestinationModel>> fetchNewDestinations() async {
    try {
      QuerySnapshot result = await _newDestinationRef.get();

      List<NewDestinationModel> newDestinations = result.docs.map((e) {
        return NewDestinationModel.fromJson(
            e.id, e.data() as Map<String, dynamic>);
      }).toList();

      return newDestinations;
    } catch (e) {
      rethrow;
    }
  }
}
