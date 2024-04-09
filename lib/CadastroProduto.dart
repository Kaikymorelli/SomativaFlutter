// Importa o pacote do Flutter
import 'package:flutter/material.dart';

// Classe MyApp que representa a tela inicial do cadastro de produtos
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Retorna um Scaffold, que é uma estrutura básica de página com barra de título e corpo
    return Scaffold(
      appBar: AppBar(
        // Configura a barra de título
        title:  Text('Cadastro de produtos'), // Define o título da barra de título
        centerTitle: true, // Centraliza o título
        backgroundColor: Colors.blueGrey, // Define a cor de fundo da barra de título
      ),
      // Corpo da página
      body: Center(
        child: ElevatedButton(
          // Botão para voltar à tela anterior
          onPressed: () {
            Navigator.popUntil(context, ModalRoute.withName('/')); // Retorna à tela inicial
          },
          child: Text ('voltar'), // Define o texto do botão
        ),
      ),
    );
  }
}

// Classe CadastroProduto que representa a tela de cadastro de produtos
class CadastroProduto extends StatefulWidget {
  const CadastroProduto({super.key});

  @override
  State<CadastroProduto> createState() => _CadastroProdutoState();
}

// Estado da tela de cadastro de produtos
class _CadastroProdutoState extends State<CadastroProduto> {
  TextEditingController nomeController =TextEditingController(); // Controlador para o campo de nome do produto
  TextEditingController descricaoController = TextEditingController(); // Controlador para o campo de descrição do produto
  String _textInfo = "Informe seus dados"; // Variável para armazenar informações de texto

  // Método para realizar o cadastro de produtos
  void _cadastro() {
    setState(() {
      String nome = nomeController.text; // Obtém o valor do campo de nome do produto
      String descricao = descricaoController.text; // Obtém o valor do campo de descrição do produto
      if (nome.isEmpty || descricao.isEmpty) {
        _textInfo = "Os campos estão vazios"; // Define uma mensagem de erro se os campos estiverem vazios
      } else {
        _textInfo = "Produto foi cadastrado com sucesso"; // Define uma mensagem de sucesso se o cadastro for realizado com sucesso
      }
    });
  }

  // Método para limpar os campos e a mensagem de texto
  void _limpar_tela() {
    nomeController.text = ""; // Limpa o campo de nome do produto
    descricaoController.text = ""; // Limpa o campo de descrição do produto
    setState(() {
      _textInfo = "Informe os dados do produto"; // Define a mensagem de texto para informar dados
    });
  }

  @override
  Widget build(BuildContext context) {
    // Retorna um Scaffold, que é uma estrutura básica de página com barra de título e corpo
    return Scaffold(
      appBar: AppBar(
        // Configura a barra de título
        title: Text("Cadastro de produto"), // Define o título da barra de título
        centerTitle: true, // Centraliza o título
        backgroundColor: Colors.amber, // Define a cor de fundo da barra de título
        actions: <Widget>[
          // Adiciona um botão na barra de título para limpar os campos
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
            // Ícone representando um produto
            const Icon(
              Icons.person,
              size: 120.0,
              color: Colors.amberAccent,
            ),
            // Campo de entrada para o nome do produto
            TextField(
              keyboardType: TextInputType.text, // Define o tipo de entrada do teclado
              decoration: InputDecoration(
                labelText: "Nome do produto", // Define o rótulo do campo de entrada
                labelStyle: TextStyle(color: Colors.amberAccent), // Define o estilo do rótulo
              ),
              textAlign: TextAlign.center, // Centraliza o texto no campo de entrada
              style: TextStyle(fontSize: 25.0), // Define o tamanho do texto
              controller: nomeController, // Define o controlador do campo de entrada
            ),
            // Campo de entrada para a descrição do produto
            TextField(
              keyboardType: TextInputType.text, // Define o tipo de entrada do teclado
              decoration: InputDecoration(
                labelText: "Descrição do produto", // Define o rótulo do campo de entrada
                labelStyle: TextStyle(color: Colors.amberAccent), // Define o estilo do rótulo
              ),
              textAlign: TextAlign.center, // Centraliza o texto no campo de entrada
              style: TextStyle(fontSize: 25.0), // Define o tamanho do texto
              obscureText: true, // Oculta o texto digitado
              controller: descricaoController, // Define o controlador do campo de entrada
            ),
            // Botão para realizar o cadastro
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: SizedBox(
                height: 50.0,
                child: ElevatedButton(
                  onPressed: _cadastro, // Define a ação quando o botão é pressionado
                  child: const Text("Cadastre-se"), // Define o texto do botão
                ),
              ),
            ),
            // Exibe a mensagem informativa
            Text(
              _textInfo, // Exibe a mensagem informativa
              textAlign: TextAlign.center, // Centraliza o texto
              style: TextStyle(color: Colors.blue, fontSize: 25.0), // Define o estilo do texto
            )
          ],
        ),
      ),
    );
  }
}