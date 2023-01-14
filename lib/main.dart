import 'dart:html';

import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:recover_password/button_pattern.dart';
import 'package:recover_password/color_outlet.dart';
import 'package:recover_password/font_family_outlet.dart';
import 'package:recover_password/size_outlet.dart';
import 'package:recover_password/snack_bar_messenger.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Infinity Studios ∞',
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

//==========================================================================================================
//
//==========================================================================================================

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String tokenController = '';

  getPram() {
    var url = window.location.href;
    if (url.contains('=') && url.contains('&')) {
      String token = url.split('=')[1].split('&')[0];
      if (token.contains('unauthorized_client')) {
        String token = 'Código inválido ou expirado.';
        return token;
      } else {
        return token;
      }
    } else {
      String token = 'Nenhum token encontrado.';
      return token;
    }
  }

  @override
  void initState() {
    super.initState();
    tokenController = getPram();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorOutlet.secondaryColor,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.03),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.85,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      'assets/images/coin.png',
                      width: 50,
                      height: 50,
                    ),
                    const Text(
                      'Recuperar senha',
                      style: TextStyle(
                        color: ColorOutlet.colorWhite,
                        fontSize: 20,
                        fontFamily: FontFamilyOutlet.defaultFontFamilyLight,
                      ),
                    ),
                    Container(
                      width: 20,
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.85,
                      child: const Text(
                        'Copie o código abaixo, entre no aplicativo e cole no campo de código de confirmação',
                        style: TextStyle(
                          color: ColorOutlet.colorWhite,
                          fontSize: 14,
                          fontFamily: FontFamilyOutlet.defaultFontFamilyLight,
                        ),
                      ),
                    ),
                    Container(
                      constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.85),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(SizeOutlet.borderRadiusSizeSmall),
                        border: Border.all(color: ColorOutlet.colorWhite),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: SizeOutlet.paddingSizeSmall, vertical: SizeOutlet.paddingSizeSmall),
                      margin: const EdgeInsets.symmetric(vertical: SizeOutlet.borderRadiusSizeBig),
                      child: Text(
                        tokenController,
                        style: const TextStyle(
                          color: ColorOutlet.colorWhite,
                          fontSize: 12,
                          fontFamily: FontFamilyOutlet.defaultFontFamilyLight,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.85,
                      child: ButtonPattern(
                        label: 'Copiar código',
                        onPressed: () {
                          FlutterClipboard.copy(tokenController).then((value) => print('copied'));
                          snackBarMessenger(context: context, message: 'Código copiado com sucesso!');
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.03),
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                    child: Image.asset(
                      'assets/images/infinidade.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                  const Text(
                    'Infinity Studios ∞',
                    style: TextStyle(
                      fontFamily: FontFamilyOutlet.defaultFontFamilyMedium,
                      fontSize: SizeOutlet.textSizeMicro1,
                      color: ColorOutlet.colorPrimaryDark,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
