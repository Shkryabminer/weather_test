import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_test/domain/models/city_model.dart';

class CityCard extends StatelessWidget {
  final CityModel city;
  final Function? callBack;

  const CityCard({required this.city, this.callBack, super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: () {
        callBack?.call();
      },
      child: Container(
        height: 70.h,
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12.w), color: const Color(0xFF362979)),
        child: Row(
          children: [
            Expanded(
              child: Text(
                "${city.city}, ${city.country}",
                maxLines: 1,
                style: _getTextStyle(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextStyle _getTextStyle() {
    return TextStyle(fontSize: 24.h, fontWeight: FontWeight.w300, color: const Color(0xFFFFFFFF));
  }
}
