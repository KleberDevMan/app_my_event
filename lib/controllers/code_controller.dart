import 'package:my_event/models/evento_model.dart';
import 'package:my_event/repositories/evento_repository.dart';
import 'package:my_event/view-models/evento_viewmodel.dart';
import 'package:package_info/package_info.dart';

class CodeController {
  EventoRepository repository;

  CodeController() {
    repository = new EventoRepository();
  }

  Future<EventoModel> buscaEventoPorCodigo(EventoViewModel model) async {
    var evento = await repository.buscaEventoPorCodigo(model);
    evento == null ? model.error = true : model.error = false;
    return evento;
  }

  Future<EventoModel> setDias(EventoModel model) async {
    var evento = await repository.setDias(model);
    if (evento == null) {
      return null;
    }
    return evento;
  }

  Future<String> version() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.version;
  }

  // Future<String> getCodigoPreferences() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   print('${prefs.getString('codigo')}');
  //   return prefs.getString('codigo') ?? '';
  // }

  // savarCodigoSharedPreferences(String codigo) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   await prefs.setString('codigo', codigo);
  // }

}
