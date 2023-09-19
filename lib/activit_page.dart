import 'package:flutter/material.dart';
import 'class_atividade.dart';

class AtividadePage extends StatefulWidget {
  const AtividadePage({Key? key});

  @override
  State<AtividadePage> createState() => _AtividadePageState();
}

class _AtividadePageState extends State<AtividadePage> {
  final TextEditingController _tituloController = TextEditingController();
  final TextEditingController _descricaoController = TextEditingController();
  final TextEditingController _prazoController = TextEditingController();
  final TextEditingController _dataController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xCE7CD0DC),
        title: const Text('Adicionar Atividade'),
      ),
      backgroundColor: const Color(0xFFFFF8F8),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Row(
                children: [
                  const Text('Título da Atividade:'),
                  const SizedBox(
                      width: 10), // Espaço entre o texto e o TextFormField
                  Expanded(
                    child: TextFormField(
                      controller: _tituloController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Row(
                children: [
                  const Text('O que será feito:'),
                  const SizedBox(width: 28),
                  Expanded(
                    child: TextFormField(
                      controller: _descricaoController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Row(
                children: [
                  const Text('Prazo:'),
                  const SizedBox(width: 90),
                  Expanded(
                    child: TextFormField(
                      controller: _prazoController,
                      keyboardType: TextInputType.datetime,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Row(
                children: [
                  const Text('Data:'),
                  const SizedBox(width: 95),
                  Expanded(
                    child: TextFormField(
                      controller: _dataController,
                      keyboardType: TextInputType.datetime,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          final atividade = Atividade(
            titulo: _tituloController.text,
            descricao: _descricaoController.text,
            prazo: _prazoController.text,
            data: _dataController.text,
          );
          Navigator.pop(context, atividade);
        },
        label: const Text('Adicionar'),
        icon: const Icon(Icons.done),
        backgroundColor: const Color(0xCE7CD0DC),
      ),
    );
  }
}
