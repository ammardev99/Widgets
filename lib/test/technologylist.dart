import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:widgets/utilities/color.dart';

class TechnologyData extends StatefulWidget {
  const TechnologyData({super.key});

  @override
  State<TechnologyData> createState() => _TechnologyDataState();
}

class _TechnologyDataState extends State<TechnologyData> {
  // String myColor = '0xFF1D2F4A';
  //                 textColor: Color(myColor),

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Technology List'),
        centerTitle: true,
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('technology').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text('No technologies found'));
          }
          List<DocumentSnapshot> docs = snapshot.data!.docs;
          return ListView.builder(
            itemCount: docs.length,
            itemBuilder: (context, index) {
              var data = docs[index].data() as Map<String, dynamic>;
              return ListTile(
                textColor: hexToColor(data['color']),
                splashColor: AppColors.splashColor,
                hoverColor: const Color(0xFFDA3939),
                leading: Image.network(data['icon'], width: 40, height: 40),
                title: Text(data['title']),
                subtitle: Text('Color: ${data['color']}'),
                onTap: () {},
              );
            },
          );
        },
      ),
    );
  }

}
