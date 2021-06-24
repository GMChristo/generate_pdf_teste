import 'dart:typed_data';

import 'package:pdf/pdf.dart';

import 'package:pdf/widgets.dart' as pw;
import 'dart:html' as html;
import 'dart:js' as js;

//documentação package pdf
//https://pub.dev/documentation/pdf/latest/pdf/PdfDocument-class.html

class PdfGenerate {
  //final String nomeArquivo;
  //PdfGenerate(this.nomeArquivo);
  PdfGenerate();

  var jsonTeste = [{
        "setor_solicitante": 22,
        "solicitacoes": 37,
        "sigla": "CASC",
        "nome": "Central de Atendimento de Solicitação do Cidadão"
    },
  ];

  Future<void> getPdf(String nomeArquivo, var pessoa) async {
    print('pdf_generate getPdf');
    final pdf = pw.Document();
    pdf.addPage(
      pw.Page(
        build: (pw.Context context) => pw.Center(
          // child: pw.Text(text),
          child: pw.Table(children: [
            for (var i = 0; i < pessoa.length; i++)
              pw.TableRow(children: [
                // pw.Divider(thickness: 1),
                for (var x = 0; x < pessoa[i].length; x++)
                  pw.Column(
                      // crossAxisAlignment: pw.CrossAxisAlignment.center,
                      // mainAxisAlignment: pw.MainAxisAlignment.center,
                      children: [
                        pw.Text(pessoa[i][x], style: pw.TextStyle(fontSize: 6)),
                        // pw.Divider(thickness: 1)
                      ]),
              ]),
          ], border: pw.TableBorder.all(),
          ),
        ),
      ),
    );
    var array = await pdf.save();
    // print(array);
    final pdfFile = html.Blob(
      <Uint8List>[Uint8List.fromList(array)],
      'application/pdf',
    );
    final pdfUrl = html.Url.createObjectUrl(pdfFile);
    final html.HtmlDocument doc = js.context['document'];
    final link = html.AnchorElement(href: pdfUrl);
    link.download = '$nomeArquivo.pdf';
    doc.body?.append(link);
    link.click();
    link.remove();
  }
}

/*JSON
[
    {
        "setor_solicitante": 22,
        "solicitacoes": 37,
        "sigla": "CASC",
        "nome": "Central de Atendimento de Solicitação do Cidadão"
    },
    {
        "setor_solicitante": 4,
        "solicitacoes": 32,
        "sigla": "DESV",
        "nome": "Desenvolvimento de Sistemas"
    },
    {
        "setor_solicitante": 6,
        "solicitacoes": 1,
        "sigla": "DINF",
        "nome": "Infraestrutura"
    },
    {
        "setor_solicitante": 37,
        "solicitacoes": 1,
        "sigla": "DTEL",
        "nome": "Telefonia"
    },
    {
        "setor_solicitante": 25,
        "solicitacoes": 8,
        "sigla": "ECONOMICIDADE",
        "nome": "Economicidade"
    },
    {
        "setor_solicitante": 12,
        "solicitacoes": 1,
        "sigla": "GETIN",
        "nome": "Gerência de Infraestrutura de Tecnologia da Informação"
    },
    {
        "setor_solicitante": 34,
        "solicitacoes": 1,
        "sigla": "MAXWAL - SEMFAZ",
        "nome": "Maxwal - SEMFAZ/GETIN"
    },
    {
        "setor_solicitante": 35,
        "solicitacoes": 1,
        "sigla": "MICROCIS - SEMFAZ",
        "nome": "Microcis - SEMFAZ/GETIN"
    },
    {
        "setor_solicitante": 0,
        "solicitacoes": 119,
        "sigla": "N/A",
        "nome": "Usuario sem acesso ao ciente"
    },
    {
        "setor_solicitante": 41,
        "solicitacoes": 1,
        "sigla": "WEBTV",
        "nome": "WEBTV"
    }
]*/