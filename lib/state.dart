import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:agent_dart/agent_dart.dart';
import 'dart:async';
import '../../../../../integrations.dart';


import 'package:uni_links/uni_links.dart';


final authProvider = Provider<AuthState>((ref) {
  return AuthState();
});

class AuthState {
  StreamSubscription? _sub;
  Ed25519KeyIdentity? newIdentity;
  CanisterActor? newActor;
  String _decodedDelegation = '';
  CanisterActor? get actor => newActor;


  Future<void> initUniLinks() async {
    _sub = uriLinkStream.listen((Uri? uri) async {
      if (uri != null && uri.scheme == 'auth' && uri.host == 'callback') {
        var queryParams = uri.queryParameters;

        String delegationString = queryParams['del'].toString();
        printWrapped("DelegationString: $delegationString");

       _decodedDelegation = Uri.decodeComponent(delegationString);
        printWrapped("Decoded DelegationString: $_decodedDelegation");

        DelegationChain _delegationChain =
            DelegationChain.fromJSON(jsonDecode(_decodedDelegation));

        DelegationIdentity _delegationIdentity =
            DelegationIdentity(newIdentity!, _delegationChain);

        HttpAgent newAgent = HttpAgent(
          options: HttpAgentOptions(
            identity: _delegationIdentity,
          ),
          defaultHost: 'localhost',
          defaultPort: 4943,
          defaultProtocol: 'http',
        );

        // Creating Canister Actor -----------------------
        newActor = CanisterActor(
            ActorConfig(
              canisterId: Principal.fromText('a4tbr-q4aaa-aaaaa-qaafq-cai'),
              agent: newAgent,
            ),
            FieldsMethod.idl);
      }
    });
  }

  

  void dispose() {
    _sub?.cancel();
  }
}

  void printWrapped(String text) {
    final pattern = new RegExp('.{1,800}'); // 800 is the size of each chunk
    pattern.allMatches(text).forEach((match) => print(match.group(0)));
  }
