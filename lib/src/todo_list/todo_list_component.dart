import 'dart:async';
import 'dart:typed_data';

import 'package:angular/angular.dart';
import 'package:angular/security.dart';
import 'package:angular_components/angular_components.dart';
import 'package:angular_components/utils/color/material.dart';
import 'package:generate_pdf_teste/src/shared/utils/pdf_generate.dart';

import 'todo_list_service.dart';

import 'package:pdf/pdf.dart';

import 'package:pdf/widgets.dart' as pw;
import 'dart:html' as html;
import 'dart:js' as js;

// import para uso do metodo com js
import '../interop/js_interop.dart';

@Component(
  selector: 'todo-list',
  styleUrls: ['todo_list_component.css'],
  templateUrl: 'todo_list_component.html',
  directives: [
    MaterialCheckboxComponent,
    MaterialFabComponent,
    MaterialIconComponent,
    materialInputDirectives,
    NgFor,
    NgIf,
  ],
  providers: [ClassProvider(TodoListService)],
)
class TodoListComponent implements OnInit {
  final TodoListService todoListService;
  final DomSanitizationService sanitizer;
  PdfGenerate pdfGenerate = PdfGenerate();

  String namePdf = '';
  String text = '';
  String testeHtml = '';

  TodoListComponent(this.todoListService, this.sanitizer);

  @override
  Future<Null> ngOnInit() async {}

  var pessoa = [
    ['Jill', 'Smith', '50', 'F', 'a'],
    ['Gabriel', 'Christo', '31', 'M', 'f'],
    ['Eve', 'Jackson', '94', 'F', 'n']
  ];
  
  Future<void> testePDF() async {
    await pdfGenerate.getPdf(namePdf, pessoa);
  }

  // * Usando script js para salvar o arquivo, script adicionado no index e
  // * criado js_interop.dar para fazer a ligação com o script
  
  //Future<void> testePDF() async {
  //
  // var tabela = namePdf;
  // print(tabela);
  //setText('$text', 10, 10);
  //setText('$tabela', 10, 10);
  //savePdf('$namePdf.pdf');
  // }
}
