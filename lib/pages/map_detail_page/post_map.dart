import 'package:aggie/bloc/plan/plan_cubit.dart';
import 'package:aggie/router/route.dart';
import 'package:aggie/theme/design_token.dart';
import 'package:aggie/widgets/CTextField.dart';
import 'package:aggie/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class PostMapPage extends StatefulWidget {
  final LatLng location;
  final String address;

  PostMapPage({@required this.location, this.address});

  @override
  State<StatefulWidget> createState() {
    return _PostMapPageState();
  }
}

class _PostMapPageState extends State<PostMapPage> {
  TextEditingController address = TextEditingController();
  TextEditingController planName = TextEditingController();

  handleCretePlan() async {
    final res = await Provider.of<PlanCubit>(context, listen: false)
        .createPlan(planName.text, address.text, widget.location);
    if (res != null)
      PageRouter.redirectToHome(context);
    else {
      ScaffoldMessenger.of(context).showSnackBar(getErrorSnackBar());
    }
  }

  SnackBar getErrorSnackBar() {
    return SnackBar(
      backgroundColor: Colors.red,
      action: SnackBarAction(
        label: 'Close',
        textColor: Colors.white,
        onPressed: () {
          // Code to execute.
        },
      ),
      content: Text('   Create Failed'),
      duration: const Duration(milliseconds: 1500),
      width: 280.0, // Width of the SnackBar.
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0, // Inner padding for SnackBar content.
      ),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    address.text = widget.address;
  }

  @override
  Widget build(BuildContext context) {
    final planCubit = Provider.of<PlanCubit>(context);

    return Scaffold(
      appBar: getAppBar(context),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
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
                          position: LatLng(widget.location.latitude,
                              widget.location.longitude)),
                    },
                    initialCameraPosition: CameraPosition(
                        target: LatLng(widget.location.latitude,
                            widget.location.longitude),
                        zoom: 16)),
              ),
              Container(
                padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 24,
                    ),
                    Text(
                      'Name of Plan',
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    CTextField(
                      hintText: 'name of plan*',
                      controller: planName,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      'Address',
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    CTextField(
                      hintText: 'address*',
                      controller: address,
                      maxLine: null,
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Center(
                      child: Container(
                        width: 200,
                        height: 50,
                        decoration: BoxDecoration(
                            color: primary,
                            borderRadius: BorderRadius.circular(20)),
                        child: planCubit.state is PlanStateLoading
                            ? SpinKitRing(
                                color: Colors.white,
                                size: 30,
                                lineWidth: 2,
                              )
                            : TextButton(
                                child: Center(
                                    child: Text(
                                  'Create Plan',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      color: white),
                                )),
                                onPressed: handleCretePlan,
                              ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
