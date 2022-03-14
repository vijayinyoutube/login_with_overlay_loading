import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../business_logic/bloc/Dashboard/dashboard_bloc.dart';
import '../../../Components/loader.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key, required this.title, required this.username})
      : super(key: key);

  final String title;
  final String username;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: BlocConsumer<DashboardBloc, DashboardState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is DashboardLoading) {
            return const LoadingWidget();
          } else {
            return initialLayout();
          }
        },
      ),
    );
  }

  Widget initialLayout() => Center(child: Text("hai $username!"));
}
