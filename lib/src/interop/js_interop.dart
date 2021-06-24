library jspdf;

import 'package:js/js.dart';

@JS('hello')
external void hello();

@JS('doc.text')
external void setText(var texto, int x, int y);

@JS('doc.save')
external void savePdf(String nome);

@JS('doc.table')
external void createTable();