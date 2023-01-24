import 'dart:html';

import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:recover_password/shared/button_pattern.dart';
import 'package:recover_password/shared/color_outlet.dart';
import 'package:recover_password/shared/font_family_outlet.dart';
import 'package:recover_password/shared/size_outlet.dart';
import 'package:recover_password/shared/snack_bar_messenger.dart';

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
  bool boasVindas = true;

  getPram() {
    var url = window.location.href;
    if (url.contains('=') && url.contains('&')) {
      String token = url.split('=')[1].split('&')[0];
      if (token.contains('unauthorized_client')) {
        String token = 'Código inválido ou expirado.';
        boasVindas = false;
        return token;
      } else {
        boasVindas = false;
        return token;
      }
    } else {
      String token = 'Nenhum token encontrado.';
      boasVindas = true;
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
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
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
                      Text(
                        !boasVindas ? 'Assista e ganhe' : 'Infinity Studios ∞',
                        style: const TextStyle(
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
              !boasVindas
                  ? SizedBox(
                      height: MediaQuery.of(context).size.height * 0.8,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.85,
                              child: const Text(
                                'Seja bem-vindo, agora você pode acessar o aplicativo e começar a aproveitar os benefícios de fazer parte da nossa comunidade.\n\n' 'O código abaixo é o seu token de acesso, ele é único e não deve ser compartilhado com ninguém. Ele serve para que você possa recuperar sua senha caso a esqueça.',
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
                    )
                  : SizedBox(
                      height: MediaQuery.of(context).size.height * 0.8,
                      child: Center(
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.85,
                          child: const Text(
                            'Seja bem-vindo, agora você pode acessar o aplicativo e começar a aproveitar os benefícios de fazer parte da nossa comunidade.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: ColorOutlet.colorWhite,
                              fontSize: 14,
                              fontFamily: FontFamilyOutlet.defaultFontFamilyLight,
                            ),
                          ),
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
      ),
    );
  }
}
