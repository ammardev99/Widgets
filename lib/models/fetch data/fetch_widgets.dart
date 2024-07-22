// fetch_widgets.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:widgets/models/widget_model.dart';

Future<List<WidgetModel>> fetchWidgets() async {
  final fireStore = FirebaseFirestore.instance.collection('widgets');
  try {
    QuerySnapshot querySnapshot = await fireStore.get();
    List<WidgetModel> widgets = querySnapshot.docs.map((doc) {
      final data = doc.data() as Map<String, dynamic>;
      return WidgetModel(
        technology: data['technology'] ?? '',
        collection: data['collection'] ?? '',
        image: data['image'] ?? '',
        title: data['title'] ?? '',
        code: data['code'] ?? '',
        description: data['description'] ?? '',
      );
    }).toList();
    return widgets;
  } catch (error) {
    debugPrint('Error fetching widgets: $error');
    rethrow; // Or handle error as needed
  }
}
