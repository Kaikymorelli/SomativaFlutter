// Importa o pacote do Flutter
import 'package:flutter/material.dart';

// Importa os arquivos necessários
import 'imc.dart'; // Para a tela de cálculo do IMC
import 'Contator.dart'; // Para a tela do contador
import 'CadastroUser.dart'; // Para a tela de cadastro de usuário
import 'CadastroProduto.dart'; // Para a tela de cadastro de produtos

// Classe Home que representa a tela inicial da aplicação
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomePageState();
}

// Estado da tela inicial da aplicação
class _HomePageState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    // Retorna um Scaffold, que é uma estrutura básica de página com barra de título e corpo
    return Scaffold(
      appBar: AppBar(
        // Configura a barra de título
        title: Text("MENU"), // Define o título da barra de título
        centerTitle: true, // Centraliza o título
        backgroundColor: Colors.deepOrangeAccent, // Define a cor de fundo da barra de título
      ),
      // Corpo da página
      body: SingleChildScrollView(
        // Permite rolar o conteúdo da página
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 10), // Define o preenchimento interno
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // Ícone representando um negócio
            const Icon(
              Icons.add_business_sharp,
              size: 120.0,
              color: Colors.deepOrangeAccent,
            ),
            // Texto informativo sobre a aplicação principal
            Text(
              "Aplicação Principal",
              textAlign: TextAlign.center, // Centraliza o texto
              style: TextStyle(color: Colors.blueGrey, fontSize: 25.0), // Define o estilo do texto
            ),
            // Espaçamento
            Text(
              "",
              textAlign: TextAlign.center, // Centraliza o texto
              style: TextStyle(color: Colors.blueGrey, fontSize: 25.0), // Define o estilo do texto
            ),
            // Botões para acessar diferentes funcionalidades da aplicação
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                // Botão para acessar a tela de cálculo do IMC
                ElevatedButton(
                  child: const Text("IMC"), // Define o texto do botão
                  onPressed: () {
                    // Define a ação quando o botão é pressionado
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Imc(), // Navega para a tela de cálculo do IMC
                      ),
                    );
                  },
                ),
                // Botão para acessar a tela do contador
                ElevatedButton(
                  child: const Text("Contador"), // Define o texto do botão
                  onPressed: () {
                    // Define a ação quando o botão é pressionado
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Cont(), // Navega para a tela do contador
                      ),
                    );
                  },
                ),
                // Botão para acessar a tela de cadastro de usuário
                ElevatedButton(
                  child: const Text("Cadastro Usuario"), // Define o texto do botão
                  onPressed: () {
                    // Define a ação quando o botão é pressionado
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CadastroUser(), // Navega para a tela de cadastro de usuário
                      ),
                    );
                  },
                ),
                // Botão para acessar a tela de cadastro de produtos
                ElevatedButton(
                  child: const Text("Cadastro de produtos"), // Define o texto do botão
                  onPressed: () {
                    // Define a ação quando o botão é pressionado
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CadastroProduto(), // Navega para a tela de cadastro de produtos
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}