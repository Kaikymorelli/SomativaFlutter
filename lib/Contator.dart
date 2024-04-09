// Importa o pacote do Flutter
import 'package:flutter/material.dart';

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
        title: const Text('Tela contador'), // Define o título da barra de título
        centerTitle: true, // Centraliza o título
        backgroundColor: Colors.amber, // Define a cor de fundo da barra de título
      ),
      // Corpo da página
      body: Center(
        child: ElevatedButton(
          child: const Text('Leva pra tela de cadastro dos usuarios'), // Define o texto do botão
          onPressed: () {
            // Define a ação quando o botão é pressionado
            Navigator.pushNamed(
              context,
              '/CadastroUser', // Navega para a rota '/CadastroUser'
            );
          },
        ),
      ),
    );
  }
}

// Classe Cont que representa a tela do contador
class Cont extends StatefulWidget {
  const Cont({super.key});

  @override
  State<Cont> createState() => _ContPageState();
}

// Estado da tela do contador
class _ContPageState extends State<Cont> {
  int _counter = 0; // Variável para armazenar o contador

  // Método para incrementar o contador
  void _incrementCounter() {
    setState(() {
      _counter++; // Incrementa o contador
    });
  }

  // Método para decrementar o contador
  void _decrementCounter() {
    setState(() {
      _counter--; // Decrementa o contador
    });
  }

  @override
  Widget build(BuildContext context) {
    // Retorna um Scaffold, que é uma estrutura básica de página com barra de título e corpo
    return Scaffold(
      appBar: AppBar(
        // Configura a barra de título
        backgroundColor: Theme.of(context).colorScheme.inversePrimary, // Define a cor de fundo da barra de título
        title: Text("Texto teste"), // Define o título da barra de título
      ),
      // Corpo da página
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:', // Texto informativo
            ),
            Text(
              '$_counter', // Exibe o valor do contador
              style: Theme.of(context).textTheme.headlineMedium, // Define o estilo do texto
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Botão para incrementar o contador
                ElevatedButton(
                  onPressed: _incrementCounter, // Define a ação quando o botão é pressionado
                  child: const Icon(Icons.add), // Define o ícone do botão como um ícone de adição
                ),
                // Botão para decrementar o contador
                ElevatedButton(
                  onPressed: _decrementCounter, // Define a ação quando o botão é pressionado
                  child: const Icon(Icons.remove), // Define o ícone do botão como um ícone de subtração
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}