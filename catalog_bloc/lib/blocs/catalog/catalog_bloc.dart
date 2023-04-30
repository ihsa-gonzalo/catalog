import 'dart:async';

import '../../model/item_model.dart';
import 'catalog_event.dart';
import 'catalog_state.dart';

class CatalogBloc {
  final CatalogState _catalogState = CatalogState();

  final StreamController<CatalogEvent> _input = StreamController();
  final StreamController<List<ItemModel>> _output = StreamController<List<ItemModel>>.broadcast();

  StreamSink<CatalogEvent> get sendEvent => _input.sink;
  Stream<List<ItemModel>> get catalogStream => _output.stream;

  CatalogBloc() {
    _input.stream.listen(_onEvent);
  }

  void _onEvent(CatalogEvent event) {
    if (event is AddCatalogItemEvent) {
      _catalogState.addToCatalog(event.item);
    } else if (event is RemoveCatalogItemEvent) {
      _catalogState.removeFromCatalog(event.item);
    }

    _output.add(_catalogState.catalog);
  }

  void dispose() {
    _input.close();
    _output.close();
  }
}