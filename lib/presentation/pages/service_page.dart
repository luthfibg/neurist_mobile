import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neurist_mobile/customs/theme.dart';
// import 'package:neurist_mobile/presentation/pages/insert_member_page.dart';
import 'package:neurist_mobile/presentation/blocs/service_bloc/service_bloc.dart';
import 'package:neurist_mobile/presentation/widgets/service_card_widget.dart';

class ServicePage extends StatelessWidget {
  const ServicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Search',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: BlocBuilder<ServiceBloc, ServiceState>(
                  builder: (context, state) {
                    if (state is ServiceFetchedState) {
                      return GridView.count(
                        scrollDirection: Axis.vertical,
                        childAspectRatio:
                            (MediaQuery.of(context).size.height / 2) /
                                (MediaQuery.of(context).size.width / 2 * 2),
                        crossAxisCount: 3,
                        mainAxisSpacing: 15,
                        crossAxisSpacing: 15,
                        physics: const AlwaysScrollableScrollPhysics(),
                        children: state.listService
                            .map((service) =>
                                ServiceCardWidget(service: service))
                            .toList(),
                      );
                    }
                    return const Center(child: CircularProgressIndicator());
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton.extended(
      //   onPressed: () {
      //     Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //         builder: (context) => const InsertDevice(),
      //       ),
      //     );
      //   },
      //   elevation: 12,
      //   label: const Text('New Device'),
      //   backgroundColor: AppColors.cadetGrey,
      //   icon: const Icon(Icons.add_circle_outline_rounded),
      // ),
    );
  }
}
