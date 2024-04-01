import 'dart:async';

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
  Timer? _throttleTimer;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _throttleTimer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Icon(
            Icons.search,
            color: Color(0xFFF5F5FF),
            size: 30,
          ),
        ),
        Expanded(
          child: TextField(
            onChanged: (text) {
              if (_throttleTimer?.isActive ?? false) {
                _throttleTimer?.cancel();
              }
              _throttleTimer = Timer(const Duration(milliseconds: 1000), () async {
                widget.onChanged?.call(text);
              });
            },
            cursorColor: const Color(0xFFF5F5FF),
            style: const TextStyle(
                //fontFamily: FontFamily.roboto,
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Color(0xFFF5F5FF)),
            decoration: InputDecoration(
                hintStyle: const TextStyle(color: Color(0xFFF5F5FF), textBaseline: TextBaseline.alphabetic),
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
      ],
    );
  }
}
