import 'package:app_clara/activit_page.dart';
import 'package:app_clara/tela_info.dart';
import 'package:flutter/material.dart';
import 'class_atividade.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _verDetalhes(
      String titulo, String descricao, String prazo, String data) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetalhesAtividadePage(
          titulo: titulo,
          descricao: descricao,
          prazo: prazo,
          data: data,
          // Passe outros detalhes, se necessário.
        ),
      ),
    );
  }

  List<Atividade> atividades = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xCE7CD0DC),
        title: const Center(
          child: Text('Minhas Atividades'),
        ),
      ),
      body: Column(
        children: [
          Center(
            child: ClipOval(
              child: Container(
                color: Colors.white,
                width: 200,
                height: 200,
                child: Image.asset(
                  'assets/images/icon.png',
                  width: 100,
                  height: 100,
                ),
              ),
            ),
          ),
          Expanded(
            child: atividades.isEmpty
                ? const Center(
                    child: Text('Nenhuma atividade adicionada ainda.'),
                  )
                : ListView.builder(
                    itemCount: atividades.length,
                    itemBuilder: (context, index) {
                      final atividade = atividades[index];
                      return GestureDetector(
                        onTap: () {
                          _verDetalhes(
                            atividade.titulo,
                            atividade.descricao,
                            atividade.prazo,
                            atividade.data,
                          );
                        },
                        child: ListTile(
                          title: Text(atividades[index].titulo),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
      backgroundColor: const Color(0xFFE3FBFF),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          final atividade = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AtividadePage()),
          );
          if (atividade != null) {
            setState(() {
              atividades.add(atividade);
            });
          }
        },
        label: const Text('Add Atividade',
            style: TextStyle(color: Color.fromARGB(206, 0, 221, 255))),
        icon: const Icon(Icons.add),
        backgroundColor: const Color(0xFFFFF8F8),
      ),
    );
  }
}
