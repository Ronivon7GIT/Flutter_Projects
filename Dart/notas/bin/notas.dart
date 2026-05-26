import 'dart:io';

void main() {
  List<String> notas = <String>[];
  menu(notas);
}

String getcomando() {
  print("O que deseja fazer? Adicionar nota - 1, Listar notas - 2, Sair - 3.");
  List<String> comandos = <String>["1", "2", "3"];
  String entrada = "";

  entrada = stdin.readLineSync()!;

  if (entrada == null || !comandos.contains(entrada)) {
    print("Comando inválido, tente novamente.");
    getcomando();
  }

  return entrada;
}

List<String> addNota(List<String> notas) {
  print("Digite a nota que deseja adicionar:");
  String? nota;
  nota = stdin.readLineSync();

  if (nota == null || nota.isEmpty) {
    print("Nota inválida, tente novamente.");
    addNota(notas);
  }
  // Aqui você pode adicionar a lógica para salvar a nota em um arquivo ou banco de dados
  notas.add(nota!);
  print("Nota adicionada: $nota");
  return notas;
}

void toListNotas(List<String> notas) {
  for (var i = 0; i < notas.length; i++) {
    print("Nota $i: " + notas[i]);
  }
}

void menu(List<String> notas) {
  String comando = getcomando();

  switch (comando) {
    case "1":
      addNota(notas);
      menu(notas);

    case "2":
      toListNotas(notas);
      menu(notas);

    case "3":
      print("Até Breve");
  }
}
