// Importa a biblioteca 'dart:math' para utilizar funções matemáticas, como 'pow' (potência)
import 'dart:math';

// Importa o pacote do Flutter
import 'package:flutter/material.dart';

// Importa o arquivo Contator.dart (presumivelmente para um contador)
import 'Contator.dart';

// Função principal que é executada quando o aplicativo é iniciado
void main() {
  // Executa o aplicativo, passando uma instância de MyApp
  runApp(const MyApp());
}

// Classe MyApp que representa o aplicativo como um todo
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Retorna um Scaffold, que é uma estrutura básica de página com barra de título e corpo
    return Scaffold(
      appBar: AppBar(
        // Configura a barra de título
        title: const Text('Tela imc'), // Define o título da barra de título
        centerTitle: true, // Centraliza o título
        backgroundColor: Colors.amber, // Define a cor de fundo da barra de título
      ),
      // Corpo da página
      body: Center(
        child: ElevatedButton(
          child: const Text('Leva pra tela de contador'), // Define o texto do botão
          onPressed: () {
            // Define a ação quando o botão é pressionado
            Navigator.pushNamed(
              context,
              '/contador', // Navega para a rota '/contador'
            );
          },
        ),
      ),
    );
  }
}

// Classe Imc que representa a tela de cálculo de IMC (Índice de Massa Corporal)
class Imc extends StatefulWidget {
  const Imc({super.key});

  @override
  State<Imc> createState() => _ImcPageState();
}

class _ImcPageState extends State<Imc> {
  // Controladores para os campos de entrada de peso e altura
  TextEditingController pesoController = new TextEditingController();
  TextEditingController alturaController = new TextEditingController();
  // Variável para armazenar o texto informativo sobre o IMC
  String _textoInfo = "Informe seus dados";

  // Método para limpar os campos de entrada e o texto informativo
  void _limpar_tela() {
    pesoController.text = ""; // Limpa o campo de entrada de peso
    alturaController.text = ""; // Limpa o campo de entrada de altura
    setState(() {
      _textoInfo = "Informe seus dados"; // Atualiza o texto informativo
    });
  }

  // Método para calcular o IMC com base nos valores inseridos nos campos de entrada
  void _calcular_Imc() {
    setState(() {
      // Obtém os valores de peso e altura dos campos de entrada
      double peso = double.parse(pesoController.text);
      double altura = double.parse(alturaController.text);

      // Calcula o IMC
      double imc = peso / pow((altura / 100), 2);

      // Determina a categoria do IMC com base nos valores padrão
      if (imc < 16.5) {
        _textoInfo = "Desnutrido (${imc})";
      } else if (imc <= 18.5) {
        _textoInfo = "Abaixo do peso (${imc})";
      } else if (imc <= 24.9) {
        _textoInfo = "Peso ideal (${imc})";
      } else if (imc <= 29.9) {
        _textoInfo = "Sobre peso (${imc})";
      } else if (imc <= 34.9) {
        _textoInfo = "Obesidade grau 1(${imc})";
      } else if (imc <= 39.9) {
        _textoInfo = "Obesidade grau 2(${imc})";
      } else {
        _textoInfo = "Obesidade grau 3(${imc})";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Retorna um Scaffold, que é uma estrutura básica de página com barra de título e corpo
    return Scaffold(
        appBar: AppBar(
          // Configura a barra de título
          title: Text("Calculadora IMC"), // Define o título da barra de título
          centerTitle: true, // Centraliza o título
          backgroundColor: Colors.blue, // Define a cor de fundo da barra de título
          actions: <Widget>[
            // Adiciona um botão na barra de título para limpar os campos de entrada
            IconButton(
              onPressed: _limpar_tela, // Define a ação quando o botão é pressionado
              icon: Icon(Icons.refresh), // Define o ícone do botão como um ícone de atualização
            )
          ],
        ),
        // Corpo da página
        body: SingleChildScrollView(
        // Permite rolar o conteúdo da página
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 10), // Define o preenchimento interno
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: <Widget>[
    // Ícone representando uma pessoa
    const Icon(
    Icons.person_outline,
    size: 120.0,
    color: Colors.indigoAccent,
    ),
    // Campo de entrada para o peso
    TextField(
    keyboardType: TextInputType.number,
    decoration: InputDecoration(
    labelText: "PESO(Kg)", // Define o rótulo do campo de entrada
    labelStyle: TextStyle(color: Colors.amberAccent), // Define o estilo do rótulo
    ),
    textAlign: TextAlign.center, // Centraliza o texto no campo de entrada
    style: TextStyle(fontSize: 25.0), // Define o tamanho do texto
    controller: pesoController, // Define o controlador do campo de entrada
    ),
    // Campo de entrada para a altura
    TextField(
    keyboardType: TextInputType.number,
    decoration: InputDecoration(
    labelText: "ALTURA(CM)", // Define o rótulo do campo de entrada
    labelStyle: TextStyle(color: Colors.amberAccent), // Define o estilo do rótulo
    ),
    textAlign: TextAlign.center, // Centraliza o texto no campo de entrada
    style: TextStyle(fontSize: 25.0), // Define o tamanho do texto
    controller: alturaController, // Define o controlador do campo de entrada
    ),
    // Botão para calcular o IMC
    Padding(
    padding: const EdgeInsets.only(top: 10, bottom: 10),
    child: SizedBox(
    height: 50.0,
    child: ElevatedButton(
    onPressed: _calcular_Imc, // Define a ação quando o botão é pressionado
    child: const Text("Calcular"), // Define o texto do botão
    ),
    ),
    ),
    // Texto informativo sobre o IMC
      Text(
        _textoInfo,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.blue,
            fontSize: 25.0
        ),
      ),
    ]
    ),
        ),
    );
  }
}