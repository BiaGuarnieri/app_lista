import 'package:app_todo/segunda.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: ('App_todo'),
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          '/tela1': (context) => TelaPrincipal(),
          '/tela2': (context) => SegundaTela(),
        },
        initialRoute: '/tela1',
        home: TelaPrincipal());
  }
}

class TelaPrincipal extends StatefulWidget {
  TelaPrincipal({Key? key}) : super(key: key);

  @override
  State<TelaPrincipal> createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  List<String> nomes = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Lista de Tarefas')),
      ),
      body: ListView.builder(
          itemCount: nomes.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(title: Text(nomes[index])),
            );
          }),
      floatingActionButton: FloatingActionButton(
          onPressed: () async {
            String? resposta = await Navigator.of(context)
                .pushNamed('/tela2', arguments: SegundaTela()) as String?;

            if (resposta != null) {
              setState(() {
                nomes.add(resposta);
              });
            }
          },
          child: Icon(Icons.add)),
    );
  }
}
