import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../collection_model.dart';

class CollectionController extends GetxController {
  var collectionList = <Collection>[].obs;
  var selectedCollection = ''.obs;

  Future<void> fetchCollections() async {
    final fireStore = FirebaseFirestore.instance.collection('collections');
    try {
      QuerySnapshot snapshot = await fireStore.get();
      collectionList.value = snapshot.docs.map((doc) {
        return Collection(
          id: doc.id,
          technology: doc['technology'],
          collection: doc['collection'],
        );
      }).toList();
    } catch (e) {
      // ignore: avoid_print
      print('Error fetching collections: $e');
    }
  }
}
