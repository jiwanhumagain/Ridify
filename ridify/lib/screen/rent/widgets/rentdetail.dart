import 'package:flutter/material.dart';

import 'package:velocity_x/velocity_x.dart';

class RentDetail extends StatelessWidget {
  final int rent;
  final int amt;
  final Function ontap;
  final bool enabled;

  const RentDetail({Key? key, required this.rent, required this.enabled, required this.amt, required this.ontap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:(){print("Inkwell is triggered");
      ontap();
      },
  //    onTap: () => ontap(context){},
      child: Container(
        decoration: BoxDecoration(
          color: enabled==true ? Vx.blue500 : Vx.white,
          border: enabled==true
              ? Border.all(color: Colors.white)
              : Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            enabled==true
                ? "$rent Month".text.bold.white.size(10).make()
                : "$rent Month".text.bold.gray900.size(10).make(),
            enabled ==true
                ? "RS.$amt".text.semiBold.white.heightLoose.make().py4()
                : "RS.$amt".text.semiBold.black.heightLoose.make().py4(),
          ],
        ),
      ),
    );
  }
}