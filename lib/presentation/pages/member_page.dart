import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neurist_mobile/customs/theme.dart';
// import 'package:neurist_mobile/presentation/pages/insert_member_page.dart';
import 'package:neurist_mobile/presentation/blocs/member_bloc/member_bloc.dart';
import 'package:neurist_mobile/presentation/widgets/member_card_widget.dart';

class MemberPage extends StatelessWidget {
  const MemberPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                child: BlocBuilder<MemberBloc, MemberState>(
                  builder: (context, state) {
                    if (state is MemberFetchedState) {
                      return GridView.count(
                        scrollDirection: Axis.vertical,
                        childAspectRatio:
                            (MediaQuery.of(context).size.height / 2) /
                                (MediaQuery.of(context).size.width / 2 * 2),
                        crossAxisCount: 3,
                        mainAxisSpacing: 15,
                        crossAxisSpacing: 15,
                        physics: const AlwaysScrollableScrollPhysics(),
                        children: state.listMember
                            .map((member) => MemberCardWidget(member: member))
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
