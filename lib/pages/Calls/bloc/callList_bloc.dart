import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:comunica_mobile/models/call.dart';
import './bloc.dart';

class CallListBloc extends Bloc<CallListEvent, CallListState> {
  @override
  CallListState get initialState => CallListLoading();

  @override
  Stream<CallListState> mapEventToState(
    CallListEvent event,
  ) async* {
    final currentState = state;
    if (event is FetchCalls) {
      if (currentState is CallListLoading) {
        final calls = await _fetchCalls();
        yield CallListSuccess(calls: calls);
      }
    } else if (event is DeleteCall) {
      if (currentState is CallListSuccess) {
        currentState.calls.removeWhere((element) => element.id == event.call.id);
        final calls = currentState.calls;
        yield CallListSuccess(calls: calls);
      }
    } else if (event is HideCall) {
      if (currentState is CallListSuccess) {
        currentState.calls.removeWhere((element) => element.id == event.call.id);
        final calls = currentState.calls;
        yield CallListSuccess(calls: calls);
      }
    }
  }
}

Future<List<Call>> _fetchCalls() async {
  //Simula a resposta do servidor.
  var response = <Call>[
    Call(id: 1, liked: 12, disliked: 1, name: 'Fulano da Silva', date: '12 de ago', message: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam viverra vel magna eget dignissim. Donec facilisis, nunc eget posuere iaculis, ipsum dui ultricies nisi, quis scelerisque justo orci vulputate mauris. Ut fringilla velit in gravida dapibus. Morbi non consequat nulla. Aliquam erat volutpat. Mauris finibus vestibulum lorem. Cras vitae feugiat augue. Duis nulla libero, blandit eget nunc eget, fermentum dictum quam. Fusce quis velit consectetur, fringilla turpis at, blandit orci. Donec condimentum tristique leo, non sodales quam fringilla vel. Proin euismod ornare odio, ac tincidunt ipsum feugiat sit amet. Pellentesque dictum at ante non porta. Maecenas vel vehicula velit, ut blandit arcu.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam viverra vel magna eget dignissim. Donec facilisis, nunc eget posuere iaculis, ipsum dui ultricies nisi, quis scelerisque justo orci vulputate mauris. Ut fringilla velit in gravida dapibus. Morbi non consequat nulla. Aliquam erat volutpat. Mauris finibus vestibulum lorem. Cras vitae feugiat augue. Duis nulla libero, blandit eget nunc eget, fermentum dictum quam. Fusce quis velit consectetur, fringilla turpis at, blandit orci. Donec condimentum tristique leo, non sodales quam fringilla vel. Proin euismod ornare odio, ac tincidunt ipsum feugiat sit amet. Pellentesque dictum at ante non porta. Maecenas vel vehicula velit, ut blandit arcu. 1'),
    Call(id: 2, liked: 45, disliked: 10, name: 'Roberto da Silva', date: '08 de dez', message: 'Problema 2'),
    Call(id: 3, liked: 86, disliked: 21, name: 'Julio da Silva', date: '12 de jan', message: 'Problema 3'),
    Call(id: 4, liked: 2, disliked: 11, name: 'Julia da Silva', date: '28 de out', message: 'Problema 4'),
    Call(id: 5, liked: 88, disliked: 10, name: 'Roberta da Silva', date: '02 de ago', message: 'Problema 5'),
    Call(id: 6, liked: 40, disliked: 12, name: 'Fulana da Silva', date: '18 de nov', message: 'Problema 6'),
  ];

  await Future.delayed(Duration(seconds: 2)); //simula latência
  return response;
}
