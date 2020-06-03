import 'dart:io';

import 'package:get_it/get_it.dart';
import 'package:my_event/models/evento_model.dart';
import 'package:my_event/stores/evento_store.dart';
import 'package:my_event/view-models/evento_viewmodel.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:path_provider/path_provider.dart';

class ArquivoDadosRepository {
  final _eventoStore = GetIt.instance<EventoStore>();

  List _arquivo = [];
  Map<String, dynamic> _dados;

  // void savarCodigoArquivo(String codigo) async {
  //   _readData().then((arquive) {
  //     _arquivo = json.decode(arquive);
  //     _dados = _arquivo != null ? _arquivo.length > 0 ? _arquivo[0] : {} : {};

  //     print('arquivo antes >> ${_dados}');

  //     _dados['last_event_code'] = codigo;
  //     _arquivo.add(_dados);

  //     print('arquivo depois >> ${_dados}');

  //     // salva arquivo no celular
  //     _saveData();
  //   });
  // }

  void apagarDadosArquivo() async {
    readData().then((arquive) {
      _arquivo = json.decode(arquive);

      _arquivo.clear();

      // salva arquivo no celular
      saveData();
    });
  }

  // Map<String, dynamic> getDados() {
  //   _readData().then((arquive) {
  //     _arquivo = json.decode(arquive);
  //     return _dados = _arquivo != null ? _arquivo.length > 0 ? _arquivo[0] : {} : {};
  //   });
  // }

  // void verificaCodigoJaExisteNoArquivo() async {
  //   _readData().then((arquive) {
  //     _arquivo = json.decode(arquive);
  //     _dados = _arquivo != null ? _arquivo.length > 0 ? _arquivo[0] : {} : {};

  //     print('arquivo salvo >> ${_dados}');

  //     if (_dados.isEmpty) {
  //       model.busy = false;
  //       setState(() {});
  //     } else {
  //       if (_dados['last_event_code'] != null) {
  //         // tenho os dados salvos e carregados
  //         model.codigo = _dados['last_event_code'];
  //         _controller.buscaEventoPorCodigo(model).then((evento) {
  //           if (evento != null) {
  //             // busca os dias do evento retornado
  //             _controller.setDias(evento).then((value) {
  //               if (value != null) {
  //                 // deu certo. conseguiu buscar a programacao
  //                 _eventoStore.setEvento(value);

  //                 _eventoStore.setArquivoDados(_dados);
  //                 model.busy = false;
  //                 setState(() {});

  //                 // Navega para outra página apagando esta
  //                 Navigator.of(context).pushReplacement(
  //                     MaterialPageRoute(builder: (context) => HomeView()));
  //               } else {
  //                 // erro no momento de carregar programacao
  //                 model.error = true;
  //                 model.msg_erro = 'Erro ao carregar programação';
  //                 model.busy = false;
  //                 setState(() {});
  //               }
  //             });
  //           } else {
  //             model.busy = false;
  //             setState(() {});
  //           }
  //         });
  //       } else {
  //         model.busy = false;
  //         setState(() {});
  //       }
  //     }
  //   });
  // }

  Future<File> _getFile() async {
    final directory = await getApplicationDocumentsDirectory();
    return File("${directory.path}/data.json");
  }

  Future<File> saveData() async {
    String data = json.encode(_arquivo);

    final file = await _getFile();
    return file.writeAsString(data);
  }

  Future<String> readData() async {
    try {
      final file = await _getFile();

      return file.readAsString();
    } catch (e) {
      return null;
    }
  }
}
