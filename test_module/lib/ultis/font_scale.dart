import 'package:flutter/material.dart';
import 'package:test_module/ultis/app_color.dart';

String package = 'mc_component';
// String font = 'SVN-Poppins';
String font = 'SF UI Display';

class RatioScreenApp {
  static double? _ratio;
  static final RatioScreenApp _singleton = RatioScreenApp._instance();

  /// Phải gọi trong hàm build khi khởi tạo tỷ lệ
  ///
  /// Nếu không gọi thì sẽ mặc định tỷ lệ là 1.0
  factory RatioScreenApp.setRatio(double ratio) {
    _ratio ??= ratio;
    return _singleton;
  }

  RatioScreenApp._instance();
  static double getRatio() => _ratio ?? 1.0;
}

extension FontScale on Text {
  static double myRatio = RatioScreenApp.getRatio();

  Text large46({Color? color}) => _copyWith(
      style: TextStyle(
          fontSize: 46 * myRatio,
          height: 1.4783,
          fontFamily: font,
          fontWeight: FontWeight.w600,
          color: color ?? AppColors.titleTextColor,
          package: package));

  Text large38({Color? color}) => _copyWith(
      style: TextStyle(
          fontSize: 38 * myRatio,
          height: 1.5789,
          fontFamily: font,
          fontWeight: FontWeight.w600,
          color: color ?? AppColors.titleTextColor,
          package: package));

  Text large24({Color? color}) => _copyWith(
      style: TextStyle(
          fontSize: 24 * myRatio,
          height: 1.5,
          fontFamily: font,
          fontWeight: FontWeight.w600,
          color: color ?? AppColors.titleTextColor,
          package: package));

  Text semiBold20({Color? color}) => _copyWith(
      style: TextStyle(
          fontSize: 20 * myRatio,
          height: 1.6,
          fontFamily: font,
          fontWeight: FontWeight.w600,
          color: color ?? AppColors.titleTextColor,
          package: package));

  Text regular20({Color? color}) => _copyWith(
      style: TextStyle(
          fontSize: 20 * myRatio,
          height: 1.6,
          fontFamily: font,
          fontWeight: FontWeight.w400,
          color: color ?? AppColors.titleTextColor,
          package: package));

  Text semiBold18({Color? color}) => _copyWith(
      style: TextStyle(
          fontSize: 18 * myRatio,
          fontWeight: FontWeight.w600,
          height: 1.5556,
          fontFamily: font,
          color: color ?? AppColors.titleTextColor,
          package: package));

  Text regular18({Color? color}) => _copyWith(
      style: TextStyle(
          fontSize: 18 * myRatio,
          fontWeight: FontWeight.w400,
          height: 1.5556,
          fontFamily: font,
          color: color ?? AppColors.titleTextColor,
          package: package));

  Text semiBold16({Color? color}) => _copyWith(
      style: TextStyle(
          fontSize: 16 * myRatio,
          height: 1.5,
          fontFamily: font,
          fontWeight: FontWeight.w600,
          color: color ?? AppColors.titleTextColor,
          package: package));

  Text regular16({Color? color}) => _copyWith(
      style: TextStyle(
          fontSize: 16 * myRatio,
          height: 1.5,
          fontFamily: font,
          fontWeight: FontWeight.w400,
          color: color ?? AppColors.titleTextColor,
          package: package));

  Text tag16({Color? color}) => _copyWith(
      style: TextStyle(
          fontSize: 16 * myRatio,
          height: 1.5,
          fontFamily: font,
          fontWeight: FontWeight.w500,
          color: color ?? AppColors.titleTextColor,
          package: package));

  Text semiBold14({Color? color}) => _copyWith(
      style: TextStyle(
          fontSize: 14 * myRatio,
          height: 1.4286,
          fontFamily: font,
          fontWeight: FontWeight.w600,
          color: color ?? AppColors.titleTextColor,
          package: package));

  Text regularContext14({Color? color}) => _copyWith(
      style: TextStyle(
          fontSize: 14 * myRatio,
          height: 1.4286,
          fontFamily: font,
          fontWeight: FontWeight.w400,
          color: color ?? AppColors.titleTextColor,
          package: package));

  Text regularDisplay14({Color? color}) => _copyWith(
      style: TextStyle(
          fontSize: 14 * myRatio,
          height: 1.7143,
          fontFamily: font,
          fontWeight: FontWeight.w400,
          color: color ?? AppColors.titleTextColor,
          package: package));

  Text tag14({Color? color}) => _copyWith(
      style: TextStyle(
          fontSize: 14 * myRatio,
          height: 1.7143,
          fontFamily: font,
          fontWeight: FontWeight.w500,
          color: color ?? AppColors.titleTextColor,
          package: package));

  Text semiBold13({Color? color}) => _copyWith(
      style: TextStyle(
          fontSize: 13 * myRatio,
          height: 1.538,
          fontFamily: font,
          fontWeight: FontWeight.w600,
          color: color ?? AppColors.titleTextColor,
          package: package));

  Text regularContext13({Color? color}) => _copyWith(
      style: TextStyle(
          fontSize: 13 * myRatio,
          height: 1.538,
          fontFamily: font,
          fontWeight: FontWeight.w400,
          color: color ?? AppColors.titleTextColor,
          package: package));

  Text regularDisplay13({Color? color}) => _copyWith(
      style: TextStyle(
          fontSize: 13 * myRatio,
          height: 1.8461,
          fontFamily: font,
          fontWeight: FontWeight.w400,
          color: color ?? AppColors.titleTextColor,
          package: package));

  Text tag13({Color? color}) => _copyWith(
      style: TextStyle(
          fontSize: 13 * myRatio,
          height: 1.8461,
          fontFamily: font,
          fontWeight: FontWeight.w500,
          color: color ?? AppColors.titleTextColor,
          package: package));
  Text semiBold12({Color? color}) => _copyWith(
      style: TextStyle(
          fontSize: 12 * myRatio,
          height: 1.3333,
          fontFamily: font,
          fontWeight: FontWeight.w600,
          color: color ?? AppColors.titleTextColor,
          package: package));

  Text regularContext12({Color? color}) => _copyWith(
      style: TextStyle(
          fontSize: 12 * myRatio,
          height: 1.3333,
          fontFamily: font,
          fontWeight: FontWeight.w400,
          color: color ?? AppColors.titleTextColor,
          package: package));

  Text regularDisplay12({Color? color}) => _copyWith(
      style: TextStyle(
          fontSize: 12 * myRatio,
          height: 1.6667,
          fontFamily: font,
          fontWeight: FontWeight.w400,
          color: color ?? AppColors.titleTextColor,
          package: package));

  Text tag12({Color? color}) => _copyWith(
      style: TextStyle(
          fontSize: 12 * myRatio,
          height: 1.3333,
          fontFamily: font,
          fontWeight: FontWeight.w500,
          color: color ?? AppColors.titleTextColor,
          package: package));

  Text semiBold11({Color? color}) => _copyWith(
      style: TextStyle(
          fontSize: 11 * myRatio,
          height: 1.0909,
          fontFamily: font,
          fontWeight: FontWeight.w600,
          color: color ?? AppColors.titleTextColor,
          package: package));

  Text regularContext11({Color? color}) => _copyWith(
      style: TextStyle(
          fontSize: 11 * myRatio,
          height: 1.0909,
          fontFamily: font,
          fontWeight: FontWeight.w400,
          color: color ?? AppColors.titleTextColor,
          package: package));

  Text regularDisplay11({Color? color}) => _copyWith(
      style: TextStyle(
          fontSize: 11 * myRatio,
          height: 1.4545,
          fontFamily: font,
          fontWeight: FontWeight.w400,
          color: color ?? AppColors.titleTextColor,
          package: package));

  Text tag11({Color? color}) => _copyWith(
      style: TextStyle(
          fontSize: 11 * myRatio,
          height: 1.0909,
          fontFamily: font,
          fontWeight: FontWeight.w500,
          color: color ?? AppColors.titleTextColor,
          package: package));

  Text _copyWith(
      {Key? key,
      StrutStyle? strutStyle,
      TextAlign? textAlign,
      TextDirection textDirection = TextDirection.ltr,
      Locale? locale,
      bool? softWrap,
      TextOverflow? overflow,
      double? textScaleFactor,
      int? maxLines,
      String? semanticsLabel,
      TextWidthBasis? textWidthBasis,
      TextStyle? style}) {
    return Text(data ?? '',
        key: key ?? this.key,
        strutStyle: strutStyle ?? this.strutStyle,
        textAlign: textAlign ?? this.textAlign,
        textDirection: textDirection,
        locale: locale ?? this.locale,
        softWrap: softWrap ?? this.softWrap,
        overflow: overflow ?? this.overflow,
        textScaleFactor: textScaleFactor ?? this.textScaleFactor,
        maxLines: maxLines ?? this.maxLines,
        semanticsLabel: semanticsLabel ?? this.semanticsLabel,
        textWidthBasis: textWidthBasis ?? this.textWidthBasis,
        style: style != null ? this.style?.merge(style) ?? style : this.style);
  }
}

var normalTextStyle = const TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 12,
    color: AppColors.titleTextColor,
    height: 1.31);

var smallRegular = const TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 14,
    color: AppColors.bodyTextColor,
    height: 1.3);
var boldSmallRegular = const TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 14,
    color: AppColors.bodyTextColor,
    height: 1.3);

TextSpan listTextSpanHasHighlight(List<String?> text) {
  return text.length == 3
      ? TextSpan(text: '', children: [
          TextSpan(text: text[0], style: smallRegular),
          TextSpan(text: text[1], style: boldSmallRegular),
          TextSpan(text: text[2], style: smallRegular),
        ])
      : TextSpan(text: '', children: [
          TextSpan(text: text[0], style: smallRegular),
          TextSpan(text: text[1], style: boldSmallRegular),
          TextSpan(text: text[2], style: smallRegular),
          TextSpan(text: text[3] ?? '', style: boldSmallRegular),
          TextSpan(text: text[4] ?? '', style: smallRegular),
        ]);
}
