import 'package:flutter/material.dart';
import 'package:garagecare/CustomWidgets/serviceCard.dart';
import 'package:garagecare/Riverpod/allservices_riverpod.dart';


class ServiceListSection extends StatelessWidget {
  const ServiceListSection({
    Key? key,
    required this.services,
    required this.removeService,
    required this.screenWidth,
  }) : super(key: key);

  final List<ServicePackage> services;
  final void Function(int) removeService;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.only(top: 18),
            itemCount: services.length,
            itemBuilder: (context, index) {
              final service = services[index];
              return Dismissible(
                key: Key(service.id),
                direction: DismissDirection.endToStart,
                background: Container(
                  color: Colors.red.shade300,
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.only(right: 16),
                  child: Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                ),
                onDismissed: (direction) {
                  removeService(index);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('${service.name} removed from cart'),
                    ),
                  );
                },
                child: ServiceCard(
                  service: service,
                  isSelected: true,
                  onSelected: (value) {},
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
