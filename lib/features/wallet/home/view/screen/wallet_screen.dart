import 'package:flutter/material.dart';
class WalletHomeScreen extends StatelessWidget {
  const WalletHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Wallet"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 300, left: 14, right: 14),
          // add a text in the middle of the screen
          child: Center(
            child: Text(
              'Coming soon...',
              style: TextStyle(fontSize: 30, color: Colors.black),
            ),
          ),
          // child: Column(
          //   children: [
          //     const CurrentBalanceHomeWalletContainer(
          //       subText: "Current balance",
          //       text: "N20,600",
          //     ),
          //     const SizedBox(
          //       height: 15,
          //     ),
          //     Row(
          //       children: [
          //         const Expanded(
          //           child: const CurrentBalanceHomeWalletContainer(
          //             subText: "NEAR balance",
          //             text: "2.6 NEAR",
          //           ),
          //         ),
          //         const SizedBox(
          //           width: 17,
          //         ),
          //         const Expanded(
          //           child: CurrentBalanceHomeWalletContainer(
          //             subText: "NGN balance",
          //             text: "2.6 NGN",
          //           ),
          //         ),
          //       ],
          //     ),
          //     const SizedBox(
          //       height: 12,
          //     ),
          //     Padding(
          //       padding: const EdgeInsets.only(left: 6),
          //       child: SizedBox(
          //         height: 120,
          //         child: ListView(
          //           scrollDirection: Axis.horizontal,
          //           children: [
          //             DepoWalletCont(
          //               icon: IconsAssets.depoWallet,
          //               text: "Deposit",
          //               onTap: () {
          //                 Get.toNamed(Routes.deposite);
          //               },
          //             ),
          //             const SizedBox(
          //               width: 37,
          //             ),
          //             DepoWalletCont(
          //               onTap: () {
          //                 Get.toNamed(Routes.withdrwal);
          //               },
          //               icon: IconsAssets.withdrwal,
          //               text: "Withdraw",
          //             ),
          //             const SizedBox(
          //               width: 37,
          //             ),
          //             DepoWalletCont(
          //               onTap: () {
          //                 Get.toNamed(Routes.exchange);
          //               },
          //               icon: IconsAssets.exchange2,
          //               text: "Exchange",
          //             ),
          //             const SizedBox(
          //               width: 37,
          //             ),
          //             DepoWalletCont(
          //               onTap: () {
          //                 Get.toNamed(Routes.send);
          //               },
          //               icon: IconsAssets.send,
          //               text: "Send",
          //             )
          //           ],
          //         ),
          //       ),
          //     ),
          //     const SizedBox(
          //       height: 20,
          //     ),
          //     ...List.generate(
          //         6,
          //         (index) => const Padding(
          //               padding: EdgeInsets.only(bottom: 10),
          //               child: WalletTileContainer(
          //                 subText: "Recieved",
          //                 text: "Employer 1",
          //               ),
          //             ))
          //   ],
          // ),
        ),
      ),
    );
  }
}
