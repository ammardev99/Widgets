import 'package:flutter/material.dart';
import 'package:widgets/models/fetch%20data/fetch_widgets.dart';
import 'package:widgets/models/widget_model.dart';
import 'package:widgets/widgets/component_cart.dart';

class WidgetsData extends StatefulWidget {
  const WidgetsData({super.key});

  @override
  State<WidgetsData> createState() => _WidgetsDataState();
}

class _WidgetsDataState extends State<WidgetsData> {
  late Future<List<WidgetModel>> _fetchWidgetsFuture;

  @override
  void initState() {
    super.initState();
    _fetchWidgetsFuture = fetchWidgets(); // Fetch widgets on initialization
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Widgets List'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: FutureBuilder<List<WidgetModel>>(
          future: _fetchWidgetsFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }
            if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('No widgets found'));
            }

            List<WidgetModel> widgets = snapshot.data!;

            return ListView.builder(
              itemCount: widgets.length,
              itemBuilder: (context, index) {
                final widget = widgets[index];
                return showWidgetCard(widget.title, widget.image, widget.code,
                    widget.description);
              },
            );
          },
        ),
      ),
    );
  }
}
