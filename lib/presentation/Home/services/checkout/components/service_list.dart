import 'package:flutter/material.dart';
import 'package:garagecare/CustomWidgets/serviceCard.dart';
import 'package:garagecare/Riverpod/allservices_riverpod.dart';


class ServiceList extends StatelessWidget {
  final List<ServicePackage> services;

  const ServiceList({required this.services});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.only(top: 8),
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: services.length,
      itemBuilder: (context, index) {
        final service = services[index];
        return ServiceCard(
          service: service,
          isSelected: false,
          onSelected: (value) {},
          showCheckbox: false,
        );
      },
    );
  }
}
