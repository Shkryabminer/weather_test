import 'package:flutter/material.dart';
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
        height: 70,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: const Color(0xFF362979)),
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
    return const TextStyle(fontSize: 24, fontWeight: FontWeight.w300, color: Color(0xFFFFFFFF));
  }
}
