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

Widget svgAssetNotFound = SvgPicture.asset('assets/not-found.svg',
    semanticsLabel: 'Sem itens para exibir');

Widget svgAssetNoThumb = SvgPicture.asset('assets/no-thumbnail.svg',
    semanticsLabel: 'Sem imagem para exibir');

Widget svgAssetEmptyList = SvgPicture.asset('assets/empty-list.svg',
    height: 250, semanticsLabel: 'Sem sem palavras na base de dados');
