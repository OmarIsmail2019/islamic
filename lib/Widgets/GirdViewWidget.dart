import 'package:flutter/material.dart';
import 'package:muslim/constant/AppColor.dart';
import 'package:sizer/sizer.dart';

class default_grid_view extends StatelessWidget {
  const default_grid_view(
      {Key? key,
      required this.text,
      required this.image,
      required this.onTap,
     })
      : super(key: key);

  final String text;
  final String image;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 15,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            gradient: LinearGradient(
              colors: [
                Colors.lightBlue.shade400,
                Colors.lightBlueAccent.shade100
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset(image,fit: BoxFit.contain,),
              Text(
                text,
                style: TextStyle(
                  fontSize: 17.sp,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'UthmanicHafs',
                  color: AppConstant.defaultIconAndTextColor,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
