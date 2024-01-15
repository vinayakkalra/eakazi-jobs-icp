import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:agent_dart/agent_dart.dart';
import 'dart:async';
import '../../../../../integrations.dart'; // Assuming FieldsMethod is defined here

import 'package:uni_links/uni_links.dart';

final authProvider = StateNotifierProvider<AuthStateNotifier, AuthState>(
  (ref) => AuthStateNotifier(),
);

class AuthState {
  bool isLoggedIn = false;
  Principal? principalIdentity;
  String? error;
  CanisterActor? actor;
}

class AuthStateNotifier extends StateNotifier<AuthState> {
  AuthStateNotifier() : super(AuthState());

  StreamSubscription? _sub;
  Ed25519KeyIdentity? newIdentity;

 
Future<void> newDelegation(decodedDelegation) async {
        DelegationChain _delegationChain =
            DelegationChain.fromJSON(jsonDecode(decodedDelegation));
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

          // Create Canister Actor
          final actor = CanisterActor(
            ActorConfig(
              canisterId: Principal.fromText('a4tbr-q4aaa-aaaaa-qaafq-cai'),
              agent: newAgent,
            ),
            FieldsMethod.idl,
          );



    }}
  

  // @override
  // void dispose() {
  //   _sub?.cancel();
  //   super.dispose();
  // }
