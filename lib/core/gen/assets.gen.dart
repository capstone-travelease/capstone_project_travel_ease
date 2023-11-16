/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsAnimationsGen {
  const $AssetsAnimationsGen();

  /// File path: assets/animations/loading.json
  String get loading => 'assets/animations/loading.json';

  /// List of all assets
  List<String> get values => [loading];
}

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/momo.png
  AssetGenImage get momo => const AssetGenImage('assets/icons/momo.png');

  /// File path: assets/icons/tpbank.webp
  AssetGenImage get tpbank => const AssetGenImage('assets/icons/tpbank.webp');

  /// File path: assets/icons/upload.png
  AssetGenImage get upload => const AssetGenImage('assets/icons/upload.png');

  /// File path: assets/icons/vcb.png
  AssetGenImage get vcb => const AssetGenImage('assets/icons/vcb.png');

  /// File path: assets/icons/vnpay.jpg
  AssetGenImage get vnpay => const AssetGenImage('assets/icons/vnpay.jpg');

  /// File path: assets/icons/zalopay.png
  AssetGenImage get zalopay => const AssetGenImage('assets/icons/zalopay.png');

  /// List of all assets
  List<AssetGenImage> get values => [momo, tpbank, upload, vcb, vnpay, zalopay];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/cancelled.png
  AssetGenImage get cancelled =>
      const AssetGenImage('assets/images/cancelled.png');

  /// File path: assets/images/completed.png
  AssetGenImage get completed =>
      const AssetGenImage('assets/images/completed.png');

  /// File path: assets/images/noImage.jpg
  AssetGenImage get noImage => const AssetGenImage('assets/images/noImage.jpg');

  /// File path: assets/images/no_image_user.jpg
  AssetGenImage get noImageUser =>
      const AssetGenImage('assets/images/no_image_user.jpg');

  /// File path: assets/images/ongoing.png
  AssetGenImage get ongoing => const AssetGenImage('assets/images/ongoing.png');

  /// File path: assets/images/qrcode.png
  AssetGenImage get qrcode => const AssetGenImage('assets/images/qrcode.png');

  /// File path: assets/images/startapp.png
  AssetGenImage get startapp =>
      const AssetGenImage('assets/images/startapp.png');

  /// List of all assets
  List<AssetGenImage> get values =>
      [cancelled, completed, noImage, noImageUser, ongoing, qrcode, startapp];
}

class Assets {
  Assets._();

  static const $AssetsAnimationsGen animations = $AssetsAnimationsGen();
  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
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
