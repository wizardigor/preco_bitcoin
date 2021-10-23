import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _preco = "0";
  void _recuperarPreco() async{
    String url = "https://www.blockchain.com/ticker";
    http.Response response = await http.get(url);
    Map<String, dynamic> retorno = json.decode(response.body);


    setState(() {
      _preco = retorno["BRL"]["symbol"]["buy"].toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(32),
        child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Image.asset("imagens/bitcoin.png"),
                Padding(
                  padding: const EdgeInsets.only(top: 30, bottom: 30),
                  child: Text(
                    "Preço",
                    style: TextStyle(
                      fontSize: 35,
                    ),),
                ),
                RaisedButton(
                  child: Text(
                    _preco,
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white
                    ),),
                  color: Colors.deepOrange,
                  onPressed: _recuperarPreco,
                )
              ],
            )) ,
      ),
    );
  }
}
