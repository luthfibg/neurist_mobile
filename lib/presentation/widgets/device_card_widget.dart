import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neurist_mobile/data/models/device_model.dart';
import 'package:neurist_mobile/presentation/blocs/device_bloc/device_bloc.dart';

class DeviceCardWidget extends StatelessWidget {
  const DeviceCardWidget({super.key, required this.device});

  final DeviceModel device;

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
                  image:
                      Image.asset('assets/images/amazfit_gtr2e_a_V.png').image,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            device.name,
            style: const TextStyle(fontSize: 18),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 10),
          Text(
            device.status,
            style: const TextStyle(fontSize: 14),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          GestureDetector(
              onTap: () {
                context
                    .read<DeviceBloc>()
                    .add(DeviceDeleteEvent(id: device.id));
                context.read<DeviceBloc>().add(const DeviceFetchEvent());
              },
              child: const Icon(Icons.delete)),
        ],
      ),
    );
  }
}
