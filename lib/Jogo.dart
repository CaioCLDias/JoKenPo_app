import 'dart:math';

import 'package:flutter/material.dart';

class Jogo extends StatefulWidget {
  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {

  var _imageBot = AssetImage('images/padrao.png');
  var _mensagem = "Escolha uma opcão abaixo";

  //metodo para selecionar de forma aleatória a escolha do app
  void opcaoSelecionada(String escolhaUsuario){

    var opcoes = ["pedra", "papel", "tesoura"];
    var numero = new Random().nextInt(3);
    var escolhaBot = opcoes[numero];

    switch(escolhaBot){
      case 'pedra':
        setState(() {
          this._imageBot = AssetImage("images/pedra.png");
        });
        break;
      case 'papel':
        setState(() {
          this._imageBot = AssetImage("images/papel.png");
        });
        break;
      case 'tesoura':
        setState(() {
          this._imageBot = AssetImage("images/tesoura.png");
        });
        break;
    }

    //validar o ganhador
    // usuário ganhador
    if((escolhaUsuario == 'pedra' && escolhaBot == 'tesoura') ||
        (escolhaUsuario == 'tesoura' && escolhaBot == 'papel') ||
        (escolhaUsuario == 'papel' && escolhaBot == 'pedra')){

      setState(() {
        this._mensagem = "Parabéns você ganhou! :)";
      });
    }
    // Bot ganhador
    else if((escolhaBot =='pedra' && escolhaUsuario == 'tesoura') ||
        (escolhaBot == 'tesoura' && escolhaUsuario == 'papel') ||
        (escolhaBot == 'papel' && escolhaUsuario == 'pedra')){

      setState(() {
        this._mensagem = "Infelizmente você perdeu! :( Tente outra vez";
      });

    }
    //empate
    else {
      setState(() {
        this._mensagem = "Empate! :|";
      });

    }
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('JoKenPo'),
      ),
      body: Center(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top:32, bottom: 16),
                child:  Text(
                    "Escolha do App",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold
                    ),
                ),
              ),
              Image(image: this._imageBot),
              Padding(
                padding: EdgeInsets.only(top:32, bottom: 16),
                child:  Text(
                  this._mensagem,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () => opcaoSelecionada("pedra"),
                    child: Image.asset('images/pedra.png', height: 100,)
                  ),
                  GestureDetector(
                      onTap: () => opcaoSelecionada("papel"),
                      child: Image.asset('images/papel.png', height: 100,)
                  ),
                  GestureDetector(
                      onTap: () => opcaoSelecionada("tesoura"),
                      child: Image.asset('images/tesoura.png', height: 100,)
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
