import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget svgAssetAppName = SvgPicture.asset('assets/app-name.svg',
    semanticsLabel: 'Nome Dicionário Wai Wai');

final Widget svgAssetAppLogo = SvgPicture.asset('assets/app-logo.svg',
    semanticsLabel: 'Logo do Dicionário Wai Wai');

Widget pngAssetAppLogo = const Image(
  width: 230,
  image: AssetImage("assets/app-logo.png"),
);
