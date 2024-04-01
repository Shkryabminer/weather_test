import 'package:flutter/material.dart';

class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({Key? key, this.onChanged, this.onSubmitted, required this.controller, this.placeholder})
      : super(key: key);

  final TextEditingController controller;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final String? placeholder;

  @override
  _CustomSearchBarState createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  late bool menuIsShown;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: const Icon(Icons.search, color: Color(0xFFF5F5FF)),
        ),
        Expanded(
          child: TextField(
            onChanged: (text) {
              widget.onChanged?.call(text);
            },
            cursorColor: Color(0xFFF5F5FF),
            cursorHeight: 20,
            style: const TextStyle(
                //fontFamily: FontFamily.roboto,
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Color(0xFFF5F5FF)),
            decoration: InputDecoration(
                hintStyle: const TextStyle(color: Color(0xFFF5F5FF)),
                hintText: widget?.placeholder,
                filled: true,
                contentPadding: EdgeInsets.zero,
                border: InputBorder.none,
                fillColor: Colors.transparent,
                isCollapsed: true),
            controller: widget.controller,
            keyboardType: TextInputType.text,
            textAlign: TextAlign.start,
            textAlignVertical: TextAlignVertical.center,
            autocorrect: false,
            enableSuggestions: false,
            onSubmitted: (value) {
              widget.onSubmitted?.call(value);
            },
          ),
        ),
        // Row(
        //   children: [
        //     if (widget.controller.text.isNotEmpty)
        //       InkWell(
        //         onTap: () {},
        //         child: IconButton(
        //           icon: _buildCleanButton(context),
        //           onPressed: () {
        //             widget.controller.text = '';
        //             setState(() {});
        //           },
        //         ),
        //       ),
        //     InkWell(
        //       onTap: () {
        //         widget.onMenuTap?.call();
        //         setState(() {
        //           menuIsShown = !menuIsShown;
        //         });
        //       },
        //       child: SvgPicture.asset(
        //         Assets.images.icMore.path,
        //         color: menuIsShown ? filesColors.primary500 : filesColors.black600,
        //         height: 24.h,
        //       ),
        //     ),
        //   ],
        // ),
      ],
    );
  }

  // Widget _buildCleanButton(BuildContext context) {
  //   //var filesColors = Theme.of(context).extension<FileColors>()!;
  //   return Container(
  //     // height: 18.h,
  //     // width: 18.h,
  //     decoration: BoxDecoration(color: filesColors.black400, borderRadius: BorderRadius.circular(10.h)),
  //     child: Icon(
  //       Icons.close,
  //       color: filesColors.black600,
  //       size: 15.h,
  //     ),
  //   );
  // }
}
