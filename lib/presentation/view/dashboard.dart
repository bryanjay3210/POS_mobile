import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'admin_pannel/admin_dashboard.dart';
import 'admin_pannel/product/cubit/product_listing_cubit.dart';
import 'authenticated/authenticated.dart';
import 'login/cubit/login_cubit.dart';
import 'login/login.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => LoginCubit()),
          BlocProvider(create: (context) => ProductListingCubit()),
        ],
        child: BlocBuilder<LoginCubit, LoginState>(
          builder: (context, state) {
            if (state.isLogin && !state.isAdmin) {
              return const Authenticated();
            }
            if (state.isLogin && state.isAdmin) {
              return const AdminDashboard();
            }
            return const LoginScreen();
          },
        ));
  }
}
