import 'package:flutter/material.dart';

class DetalhesAtividadePage extends StatelessWidget {

  
  final String titulo;
  final String descricao;
  final String prazo;
  final String data;

  DetalhesAtividadePage({
    required this.titulo,
    required this.descricao,
    required this.prazo,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes da Atividade'),
        backgroundColor: Color(0xCE7CD0DC),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Título: $titulo'),
            Text('Descrição: $descricao'),
            Text('Prazo: $prazo'),
            Text('Data: $data'),
            // Outros detalhes, se necessário.
          ],
        ),
      ),
    );
  }
}