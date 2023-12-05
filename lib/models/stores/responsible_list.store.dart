import 'package:gereaulas_mobile/controllers/responsible_controller.dart';
import 'package:gereaulas_mobile/models/stores/responsible.store.dart';
import 'package:mobx/mobx.dart';
part 'responsible_list.store.g.dart';

class ResponsibleListStore = _ResponsibleListStore with _$ResponsibleListStore;

abstract class _ResponsibleListStore with Store {
  @observable
  ObservableList<ResponsibleStore> responsibles =
      ObservableList<ResponsibleStore>();

  @action
  Future<void> initResponsibles() async {
    List<ResponsibleStore> responsiblesList =
        await ResponsibleController.findAll();
    responsibles.clear();
    responsibles.addAll(responsiblesList);
  }

  @action
  void addResponsible(ResponsibleStore responsible) {
    ResponsibleController.createResponsible(responsible).then((value) =>
        value != null
            ? responsibles.add(value)
            : print("Erro cadastrar responsavel"));
    return;
  }

  @action
  void removeResponsible(ResponsibleStore responsible) {
    responsibles.remove(responsible);
  }

  @action
  ResponsibleStore findById(String id) {
    ResponsibleStore responsible = responsibles.firstWhere((e) => e.id == id,
        orElse: () => ResponsibleStore());
    return responsible;
  }
}
