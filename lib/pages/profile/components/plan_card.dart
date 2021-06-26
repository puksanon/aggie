import 'package:aggie/models/plan_model.dart';
import 'package:aggie/router/route.dart';
import 'package:aggie/theme/design_token.dart';
import 'package:flutter/material.dart';

class PlanCard extends StatefulWidget {
  final Plan plan;
  PlanCard({@required this.plan});

  @override
  State<StatefulWidget> createState() {
    return _PlanCardState();
  }
}

class _PlanCardState extends State<PlanCard> {
  handleGoToDetail() {
    PageRouter.goToPlanDetailPage(context, widget.plan);
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
          primary: Theme.of(context).textTheme.caption.color,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(baseRadius)),
          backgroundColor: Theme.of(context).primaryColor,
          padding: EdgeInsets.zero,
          minimumSize: Size(50, 30),
          alignment: Alignment.centerLeft),
      onPressed: handleGoToDetail,
      child: Container(
        padding: EdgeInsets.all(16),
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
            border: Border.all(width: 2, color: gray3),
            borderRadius: BorderRadius.circular(baseRadius)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${widget.plan.planName}',
              style: Theme.of(context).textTheme.subtitle2,
            ),
            Icon(
              Icons.arrow_forward_ios_rounded,
              size: 16,
            )
          ],
        ),
      ),
    );
  }
}
