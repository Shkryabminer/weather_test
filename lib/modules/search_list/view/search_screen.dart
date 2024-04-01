import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:weather_test/modules/search_list/search_list_cubit.dart';
import 'package:weather_test/modules/search_list/search_list_cubit_state.dart';
import 'package:weather_test/modules/search_list/view/components/city_card.dart';
import 'package:weather_test/modules/search_list/view/components/search_bar.dart';

@RoutePage()
class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    // TODO: implement build
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            colors: [Color(0xff2E335A), Color(0xff1C1B33)], begin: Alignment.topCenter, end: Alignment.bottomCenter),
      ),
      child: SafeArea(
        top: true,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0.w),
            child: BlocBuilder<SearchListCubit, SearchListState>(builder: (context, searchListState) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    height: 50.h,
                    alignment: Alignment.centerLeft,
                    child: InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: SizedBox(
                        //height: 24.h,
                        width: 24.w,
                        child: SvgPicture.asset(
                          'assets/images/chevron_left.svg',
                          color: Colors.white,
                          fit: BoxFit.scaleDown,
                          height: 30.h,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Container(
                    height: 50.h,
                    decoration: BoxDecoration(color: const Color(0xFF1F1F3C), borderRadius: BorderRadius.circular(10)),
                    child: CustomSearchBar(
                      controller: controller,
                      placeholder: "Search for a city",
                      onChanged: (text) {
                        BlocProvider.of<SearchListCubit>(context).getCities(sortKey: text);
                      },
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  searchListState.cities != null && searchListState.cities!.isNotEmpty
                      ? Expanded(
                          child: ListView.separated(
                            itemCount: searchListState.cities!.length,
                            itemBuilder: (context, index) {
                              return CityCard(
                                callBack: () {
                                  Get.back(result: searchListState.cities![index]);
                                },
                                city: searchListState.cities![index],
                              );
                            },
                            separatorBuilder: (context, index) {
                              return SizedBox(
                                height: 10.h,
                              );
                            },
                          ),
                        )
                      : Container()
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
