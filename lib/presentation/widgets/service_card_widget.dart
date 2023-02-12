import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neurist_mobile/data/models/service_model.dart';
import 'package:neurist_mobile/presentation/blocs/service_bloc/service_bloc.dart';

class ServiceCardWidget extends StatelessWidget {
  const ServiceCardWidget({super.key, required this.service});

  final ServiceModel service;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.maxFinite,
      width: double.maxFinite,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 1),
        borderRadius: const BorderRadius.all(Radius.circular(5)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(width: 5, color: Colors.transparent),
                borderRadius: const BorderRadius.all(
                  Radius.circular(5),
                ),
                image: DecorationImage(
                  image: Image.asset(
                    'assets/images/hardware.png',
                  ).image,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            service.serviceName,
            style: const TextStyle(fontSize: 18),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 10),
          Text(
            service.serviceAddress,
            style: const TextStyle(fontSize: 14),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          GestureDetector(
              onTap: () {
                context
                    .read<ServiceBloc>()
                    .add(ServiceDeleteEvent(serviceId: service.serviceId));
                context.read<ServiceBloc>().add(const ServiceFetchEvent());
              },
              child: const Icon(Icons.delete)),
        ],
      ),
    );
  }
}
