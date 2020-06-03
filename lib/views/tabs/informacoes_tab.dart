import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:my_event/repositories/evento_repository.dart';
import 'package:my_event/repositories/inscricao_repository.dart';
import 'package:my_event/repositories/user_repository.dart';
import 'package:my_event/stores/evento_store.dart';
import 'package:my_event/views/custom_widgets/custom_background_gradient.dart';
import 'package:my_event/views/login_view.dart';
import 'package:scoped_model/scoped_model.dart';

class InformacoesTab extends StatelessWidget {
  final _eventoStore = GetIt.instance<EventoStore>();
  final GlobalKey<ScaffoldState> scaffoldKey;

  InformacoesTab(this.scaffoldKey);

  _cardPatrocinadores(String parceiroTitle, String parceiroTipo) {
    return Container(
      padding: EdgeInsets.only(top: 10, right: 10, left: 10),
      // height: MediaQuery.of(context).size.height,
      // width: MediaQuery.of(context).size.width,
      child: Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(parceiroTitle,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                )),
            GridView.extent(
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                maxCrossAxisExtent: 200,
                mainAxisSpacing: 5,
                crossAxisSpacing: 5,
                padding: const EdgeInsets.all(5),
                children: _buildGridTiles(parceiroTipo))
          ],
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        elevation: 5,
        margin: EdgeInsets.only(top: 5),
      ),
    );
  }

  List<Widget> _buildGridTiles(String tipo_parceiro) {
    switch (tipo_parceiro) {
      case 'patrocinador':
        List<Widget> containers = List<Container>.generate(
            _eventoStore.evento.patrocinadores.length, (int index) {
          return Container(
              child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.network(
              EventoRepository.url_production +
                  _eventoStore.evento.patrocinadores[index].imgLink,
              fit: BoxFit.fill,
            ),
          ));
        });
        return containers;
      case 'apoiador':
        List<Widget> containers = List<Container>.generate(
            // _eventoStore.evento.apoiadores.length, (int index) {
            _eventoStore.evento.apoiadores.length, (int index) {
          return Container(
              child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.network(
              EventoRepository.url_production +
                  _eventoStore.evento.apoiadores[index].imgLink,
              fit: BoxFit.fill,
            ),
          ));
        });
        return containers;
      default: //organizadores
        List<Widget> containers = List<Container>.generate(
            // _eventoStore.evento.organizadores.length, (int index) {
            _eventoStore.evento.organizadores.length, (int index) {
          return Container(
              child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.network(
              EventoRepository.url_production +
                  _eventoStore.evento.organizadores[index].imgLink,
              fit: BoxFit.fill,
            ),
          ));
        });
        return containers;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        CustomBackgroundGradient(),
        SingleChildScrollView(
          padding: EdgeInsets.all(5.0),
          child: Column(children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 10, right: 10, left: 10),
              height: 500,
              width: MediaQuery.of(context).size.width,
              child: Card(
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Image.network(
                      EventoRepository.url_production +
                          _eventoStore.evento.imgLink,
                      fit: BoxFit.fill,
                    ),
                    Text(_eventoStore.evento.titulo,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        )),
                    SizedBox(
                      height: 5,
                    ),
                    Row(children: <Widget>[
                      Column(
                        children: <Widget>[
                          Row(children: <Widget>[
                            Icon(
                              Icons.calendar_today,
                              color: Colors.blue,
                              size: 20.0,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(_eventoStore.evento.dataInicioS,
                                  style: TextStyle(fontSize: 18)),
                            )
                          ]),
                          SizedBox(
                            height: 5,
                          ),
                          Row(children: <Widget>[
                            Icon(
                              Icons.location_on,
                              color: Colors.blue,
                              size: 20.0,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(_eventoStore.evento.local,
                                  style: TextStyle(fontSize: 18)),
                            )
                          ]),
                        ],
                      ),

                      // Column(children: <Widget>[
                      Expanded(
                        child: Observer(builder: (context) {
                          return Padding(
                            padding: EdgeInsets.only(left: 30, right: 10),

                            child:

                                // ScopedModelDescendant<InscricaoRepository>(
                                //     builder: (context, child, model) {

                                _eventoStore.desejaInscreverSe
                                    ? Center(
                                        child: CircularProgressIndicator(),
                                      )
                                    : RaisedButton(
                                        child: Row(
                                          children: <Widget>[
                                            Icon(
                                              UserRepository.of(context)
                                                      .isLoggedIn()
                                                  ? _eventoStore
                                                          .inscritoNoEventoAtual(
                                                              UserRepository.of(
                                                                      context)
                                                                  .firebaseUser
                                                                  .uid)
                                                      ? Icons.delete
                                                      : Icons.add
                                                  : Icons.add,
                                              color: Colors.white,
                                              size: 20.0,
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              UserRepository.of(context)
                                                      .isLoggedIn()
                                                  ? _eventoStore
                                                          .inscritoNoEventoAtual(
                                                              UserRepository.of(
                                                                      context)
                                                                  .firebaseUser
                                                                  .uid)
                                                      ? 'Desinscrever-se'
                                                      : 'Inscrever-se'
                                                  : 'Inscrever-se',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                        color: UserRepository.of(context)
                                                .isLoggedIn()
                                            ? _eventoStore
                                                    .inscritoNoEventoAtual(
                                                        UserRepository.of(
                                                                context)
                                                            .firebaseUser
                                                            .uid)
                                                ? Colors.redAccent
                                                : Colors.green[800]
                                            : Colors.green[800],
                                        onPressed: () {
                                          if (UserRepository.of(context)
                                              .isLoggedIn()) {
                                            
                                            if (_eventoStore
                                                .inscritoNoEventoAtual(
                                                    UserRepository.of(context)
                                                        .firebaseUser
                                                        .uid)) {
                                              print('removendo inscrição....');
                                            }

                                            print('fazendo inscrição no evento...');

                                          } else {
                                            // Seta que ele esta logando porque deseja se increver
                                            _eventoStore
                                                .setDesejaInscreverSe(true);

                                            // Entre para se inscrever
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        LoginView()));
                                          }
                                        },
                                      ),

                            // }),
                          );
                        }),
                      )

                      // ]),
                    ]),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      _eventoStore.evento.descricao,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontFamily: 'Roboto',
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                elevation: 5,
                margin: EdgeInsets.only(top: 5),
              ),
            ),
            if (_eventoStore.evento.patrocinadores.length > 0)
              _cardPatrocinadores('Patrocínio', 'patrocinador'),
            if (_eventoStore.evento.apoiadores.length > 0)
              _cardPatrocinadores('Apoio', 'apoiador'),
            if (_eventoStore.evento.organizadores.length > 0)
              _cardPatrocinadores('Organização', 'orgaonizador'),
          ]),
        ),
      ],
    );
  }

  // void _onSuccess() {
  //   scaffoldKey.currentState.showSnackBar(SnackBar(
  //     content: Text('Inscrição no evento realizada sucesso!'),
  //     backgroundColor: Colors.green[500],
  //     duration: Duration(seconds: 2),
  //   ));
  // }

  // void _onFail() {
  //   scaffoldKey.currentState.showSnackBar(SnackBar(
  //     content: Text('Falha ao realizar inscrição no evento!'),
  //     backgroundColor: Colors.redAccent,
  //     duration: Duration(seconds: 2),
  //   ));
  // }
}
