import 'package:my_event/models/evento_model.dart';
import 'package:my_event/repositories/evento_repository.dart';
import 'package:my_event/view-models/evento_viewmodel.dart';

class CodeEventController {
  EventoRepository repository;

  CodeEventController(){
    repository = new EventoRepository();
  }

  Future<EventoModel> buscaEventoPorCodigo(EventoViewModel model) async {
    model.busy = true;
    var evento = await repository.buscaEventoPorCodigo(model);
    model.busy = false;
    evento == null? model.error = true : model.error = false;
    return evento;
  }
}