// Importa os pacotes necessários do Flutter
import 'package:flutter/material.dart';
import 'package:work_flutter/home.dart'; // Importa o arquivo home.dart, que provavelmente contém a definição da tela inicial da aplicação

// Função principal que é executada quando o aplicativo é iniciado
void main() {
  // Executa o aplicativo, passando uma instância de MyApp
  runApp(const MyApp());
}

// Classe MyApp que representa o aplicativo como um todo
class MyApp extends StatelessWidget {
  const MyApp({super.key}); // Construtor de MyApp

  // Este método constrói a árvore de widgets do aplicativo
  @override
  Widget build(BuildContext context) {
    // Retorna um MaterialApp, que é o widget raiz do aplicativo
    return MaterialApp(
      // Configuração para não mostrar a faixa de depuração no canto superior direito
      debugShowCheckedModeBanner: false,
      // Define a tela inicial da aplicação como uma instância de Home
      home: Home(),
    );
  }
}