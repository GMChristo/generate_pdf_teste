import 'dart:async';
import 'dart:typed_data';

import 'package:angular/angular.dart';
import 'package:angular/security.dart';
import 'package:angular_components/angular_components.dart';

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
  
  String namePdf = '';
  String text = '';
  String testeHtml = '';

  TodoListComponent(this.todoListService, this.sanitizer);

  @override
  Future<Null> ngOnInit() async {
  }

  // Future<void> testePDF() async {
  //   final pdf = pw.Document();
  //   pdf.addPage(
  //     pw.Page(
  //       build: (pw.Context context) => pw.Center(
  //         child: pw.Text(text),
  //       ),
  //     ),
  //   );
  //   var array = await pdf.save();
  //   print(array);
  //  final pdfFile = html.Blob(
  //     <Uint8List>[Uint8List.fromList(array)],
  //     'application/pdf',
  //   );
  //   final pdfUrl = html.Url.createObjectUrl(pdfFile);
  //   final html.HtmlDocument doc = js.context['document'];
  //   final link = html.AnchorElement(href: pdfUrl);
  //   link.download = '$namePdf.pdf';
  //   doc.body?.append(link);
  //   link.click();
  //   link.remove();
  // }

  Future<void> testePDF() async {
    //Usando script js para salvar o arquivo, script adicionado no index e
    //criado js_interop.dar para fazer a ligação com o script
    setText('$text', 10, 10);
    savePdf('$namePdf.pdf');

  }
}
