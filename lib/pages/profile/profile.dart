import 'package:aggie/bloc/plan/plan_cubit.dart';
import 'package:aggie/bloc/user/user_cubit.dart';
import 'package:aggie/pages/profile/components/loadding.dart';
import 'package:aggie/pages/profile/components/plan_card.dart';
import 'package:aggie/router/route.dart';
import 'package:aggie/theme/design_token.dart';
import 'package:aggie/widgets/appbar.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<ProfilePage> {
  Future handleRefresh() async {
    await Provider.of<PlanCubit>(context, listen: false).refresh();
  }

  handleSignOut() async {
    await Provider.of<UserCubit>(context, listen: false).logout();
    PageRouter.redirectToLogin(context);
  }

  @override
  Widget build(BuildContext context) {
    final userCubit = Provider.of<UserCubit>(context);
    final userState = userCubit.state;
    final planCubit = Provider.of<PlanCubit>(context);
    final planState = planCubit.state;
    return Scaffold(
      appBar: getAppBar(context),
      body: RefreshIndicator(
        onRefresh: handleRefresh,
        child: Container(
          padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: userState is UserSingedIn
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(baseRadius),
                          border: Border.all(color: gray3, width: 2)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Profile Detail',
                            style: Theme.of(context).textTheme.subtitle2,
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Name : '),
                              Text('${userState.user.name}')
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Email : '),
                              Text('${userState.user.email}')
                            ],
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.red)),
                                  onPressed: handleSignOut,
                                  child: Text('Sign Out'))
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      'My Plans',
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Flexible(
                      child: planState is PlanStateLoading
                          ? LoadingScreenMap()
                          : planState is PlanLoaded
                              ? ListView(
                                  children: [
                                    for (var plan in planState.plans)
                                      Container(
                                        padding:
                                            EdgeInsets.only(top: 4, bottom: 4),
                                        child: PlanCard(
                                          plan: plan,
                                        ),
                                      )
                                  ],
                                )
                              : null,
                    )
                  ],
                )
              : null,
        ),
      ),
    );
  }
}
