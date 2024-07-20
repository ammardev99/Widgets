import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'technology_model.dart'; // Adjust the import path if necessary

class TechnologyController extends GetxController {
  var technologyList = <Technology>[].obs;
  var selectedTechnology = ''.obs;

  Future<void> fetchTechnologies() async {
    final fireStore = FirebaseFirestore.instance.collection('technologies');
    try {
      QuerySnapshot snapshot = await fireStore.get();
      technologyList.value = snapshot.docs.map((doc) {
        return Technology(
          id: doc.id,
          title: doc['title'],
          icon: doc['icon'],
          color: doc['color'],
        );
      }).toList();
    } catch (e) {
      // ignore: avoid_print
      print('Error fetching technologies: $e');
    }
  }
}
