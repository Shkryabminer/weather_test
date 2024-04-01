/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/background_image.jpeg
  AssetGenImage get backgroundImage =>
      const AssetGenImage('assets/images/background_image.jpeg');

  /// File path: assets/images/chevron_left.svg
  String get chevronLeft => 'assets/images/chevron_left.svg';

  /// File path: assets/images/house.jpeg
  AssetGenImage get houseJpeg =>
      const AssetGenImage('assets/images/house.jpeg');

  /// File path: assets/images/house.png
  AssetGenImage get housePng => const AssetGenImage('assets/images/house.png');

  /// File path: assets/images/house.svg
  String get houseSvg => 'assets/images/house.svg';

  /// File path: assets/images/ic_search.svg
  String get icSearch => 'assets/images/ic_search.svg';

  /// File path: assets/images/weather_background_image.svg
  String get weatherBackgroundImage =>
      'assets/images/weather_background_image.svg';

  /// List of all assets
  List<dynamic> get values => [
        backgroundImage,
        chevronLeft,
        houseJpeg,
        housePng,
        houseSvg,
        icSearch,
        weatherBackgroundImage
      ];
}

class Assets {
  Assets._();

  static const String cities = 'assets/cities.json';
  static const $AssetsImagesGen images = $AssetsImagesGen();

  /// List of all assets
  static List<String> get values => [cities];
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
