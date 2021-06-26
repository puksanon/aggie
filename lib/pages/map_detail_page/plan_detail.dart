import 'package:aggie/bloc/plan_detail/plan_detail_cubit.dart';
import 'package:aggie/models/plan_model.dart';
import 'package:aggie/pages/map_detail_page/components/loadding.dart';
import 'package:aggie/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class PlanDetailPage extends StatefulWidget {
  final Plan plan;
  PlanDetailPage({@required this.plan});

  @override
  State<StatefulWidget> createState() {
    return _PlanDetailState();
  }
}

class _PlanDetailState extends State<PlanDetailPage> {
  TextEditingController address;
  TextEditingController planName;

  @override
  void initState() {
    super.initState();
    Provider.of<PlanDetailCubit>(context, listen: false)
        .loadData(widget.plan.planId);
  }

  @override
  Widget build(BuildContext context) {
    final planDetailState = Provider.of<PlanDetailCubit>(context).state;
    return Scaffold(
      appBar: getAppBar(context),
      body: Container(
        child: planDetailState is PlanDetailStateLoading
            ? PlanLoadingPage()
            : planDetailState is PlanDetailLoaded
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 175,
                        child: GoogleMap(
                            rotateGesturesEnabled: false,
                            zoomControlsEnabled: false,
                            zoomGesturesEnabled: false,
                            scrollGesturesEnabled: false,
                            markers: <Marker>{
                              Marker(
                                  markerId: MarkerId('1'),
                                  position: planDetailState.plan.location),
                            },
                            initialCameraPosition: CameraPosition(
                                target: planDetailState.plan.location,
                                zoom: 16)),
                      ),
                      Flexible(
                        child: Container(
                          padding:
                              EdgeInsets.only(left: 24, right: 24, bottom: 24),
                          child: ListView(
                            children: [
                              SizedBox(
                                height: 24,
                              ),
                              Text(
                                '${planDetailState.plan.planName}',
                                style: Theme.of(context).textTheme.headline5,
                              ),
                              SizedBox(
                                height: 24,
                              ),
                              Text(
                                'Location',
                                style: Theme.of(context).textTheme.subtitle1,
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              Text(
                                'Lat : ${planDetailState.plan.location.latitude}, Lng : ${planDetailState.plan.location.longitude}',
                              ),
                              SizedBox(
                                height: 24,
                              ),
                              Text(
                                'Address',
                                style: Theme.of(context).textTheme.subtitle1,
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              Text(
                                '${planDetailState.plan.address}',
                              ),
                              SizedBox(
                                height: 24,
                              ),
                              Text(
                                'ความเหมาะสม',
                                style: Theme.of(context).textTheme.subtitle1,
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              Text(
                                '${planDetailState.plan.unit}',
                              ),
                              SizedBox(
                                height: 24,
                              ),
                              Text(
                                'ชุดดิน',
                                style: Theme.of(context).textTheme.subtitle1,
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              Text(
                                '${planDetailState.plan.soil}',
                              ),
                              SizedBox(
                                height: 24,
                              ),
                              Text(
                                'ชั้นหินอุ้มน้ำ',
                                style: Theme.of(context).textTheme.subtitle1,
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              Text(
                                '${planDetailState.plan.hydro}',
                              ),
                              SizedBox(
                                height: 24,
                              ),
                              Text(
                                'ศักยภาพนํ้าดาบาล',
                                style: Theme.of(context).textTheme.subtitle1,
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              Text(
                                '${planDetailState.plan.gwav}',
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  )
                : null,
      ),
    );
  }
}
