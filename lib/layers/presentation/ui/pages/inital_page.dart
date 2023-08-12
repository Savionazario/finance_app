import 'package:finance_app/layers/presentation/ui/createTransactionFeature/create_transaction_page.dart';
import 'package:finance_app/layers/presentation/ui/pages/transaction_history_page.dart';
import 'package:finance_app/layers/presentation/ui/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InitalPage extends StatefulWidget {
  const InitalPage({Key? key}) : super(key: key);

  @override
  _InitalPageState createState() => _InitalPageState();
}

class _InitalPageState extends State<InitalPage> {
  var blue = Color(0xFF0E3AAA);

  int paginaAtual = 0;

  final screens = [
    HomePage(),
    TransactionHistoryPage(),
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        // backgroundColor: colorBackGround,
        resizeToAvoidBottomInset: false,

        // bottomNavigationBar: Padding(
        //   padding: const EdgeInsets.only(bottom: 10, right: 40, left: 40),
        //   child: ClipRRect(
        //     borderRadius: BorderRadius.circular(50),
        //     child: BottomAppBar(
        //       notchMargin: 1,
        //       // shape: CircularNotchedRectangle(),
        //       // shape: AutomaticNotchedShape(),
        //       height: 54,
        //       color: Colors.grey[900],
        //       // margin: EdgeInsets.only(bottom: 10, left: 40, right: 40),
        //       // decoration: BoxDecoration(
        //       //   color: Colors.grey[900],
        //       //   borderRadius: BorderRadius.circular(50)
        //       // ),
        //       child: Row(
        //         mainAxisAlignment: MainAxisAlignment.spaceAround,
        //         mainAxisSize: MainAxisSize.max,
        //         children: [
        //           InkWell(
        //             borderRadius: BorderRadius.circular(20),
        //             child: SizedBox(
        //               height: 40,
        //               width: 100,
        //               child: Column(
        //                 // mainAxisSize: MainAxisSize.min,
        //                 mainAxisAlignment: MainAxisAlignment.center,
        //                 children: [
        //                   Icon(
        //                     Icons.home,
        //                     size: 26,
        //                     color: paginaAtual == 0 ? blue : Colors.grey[100],
        //                   ),
        //                   // Text(
        //                   //   "Home",
        //                   //   style: GoogleFonts.nunitoSans(
        //                   //     textStyle: TextStyle(
        //                   //       color:
        //                   //           paginaAtual == 0 ? darkerBlue : Colors.grey,
        //                   //     ),
        //                   //   ),
        //                   // ),
        //                 ],
        //               ),
        //             ),
        //             onTap: () {
        //               setState(() {
        //                 paginaAtual = 0;
        //               });
        //               FocusScopeNode currentFocus = FocusScope.of(context);

        //               if (!currentFocus.hasPrimaryFocus) {
        //                 currentFocus.unfocus();
        //               }
        //             },
        //           ),
        //           SizedBox(
        //             height: 40,
        //             width: 40,
        //             child: FloatingActionButton(
        //               backgroundColor: blue,
        //               onPressed: () {
        //                 // showMenu(
        //                 //   context: context,
        //                 //   position: RelativeRect.fromLTRB(
        //                 //       0, 30, 0, 0), // Posição do menu em relação ao botão.
        //                 //   items: [
        //                 //     PopupMenuItem(
        //                 //       child: Text("Tipo 1"),
        //                 //       value: "Tipo 1",
        //                 //     ),
        //                 //     PopupMenuItem(
        //                 //       child: Text("Tipo 2"),
        //                 //       value: "Tipo 2",
        //                 //     ),
        //                 //   ],
        //                 // );
        //                 // PopupMenuButton(
        //                 //   itemBuilder: (context) => [
        //                 //     PopupMenuItem(
        //                 //       child: Text("Tipo 1"),
        //                 //       value: "Tipo 1",
        //                 //     ),
        //                 //     PopupMenuItem(
        //                 //       child: Text("Tipo 2"),
        //                 //       value: "Tipo 2",
        //                 //     ),
        //                 //   ],
        //                 // );
        //                 FocusScopeNode currentFocus = FocusScope.of(context);

        //                 if (!currentFocus.hasPrimaryFocus) {
        //                   currentFocus.unfocus();
        //                 }

        //                 showModalBottomSheet(
        //                   context: context,
        //                   backgroundColor: Colors.transparent,
        //                   isScrollControlled: true,
        //                   shape: const RoundedRectangleBorder(
        //                     borderRadius: BorderRadius.vertical(
        //                       top: Radius.circular(20),
        //                     ),
        //                   ),
        //                   builder: (context) {
        //                     return Container(
        //                       height: 180,
        //                       width: 200,
        //                       child: Row(
        //                         mainAxisAlignment: MainAxisAlignment.center,
        //                         // crossAxisAlignment: CrossAxisAlignment.center,
        //                         children: [
        //                           Padding(
        //                             padding: const EdgeInsets.only(right: 25.0),
        //                             child: Column(
        //                               children: [
        //                                 ClipRRect(
        //                                   borderRadius:
        //                                       BorderRadius.circular(50),
        //                                   child: SizedBox(
        //                                     height: 46,
        //                                     width: 46,
        //                                     child: TextButton(
        //                                       style: TextButton.styleFrom(
        //                                         backgroundColor:
        //                                             Colors.grey[800],
        //                                       ),
        //                                       child: const Icon(
        //                                         Icons.arrow_downward_rounded,
        //                                         color: Colors.green,
        //                                         size: 20,
        //                                       ),
        //                                       onPressed: () {
        //                                         Navigator.pop(context);
        //                                         Navigator.push(
        //                                           context,
        //                                           MaterialPageRoute(
        //                                             builder: (context) =>
        //                                                 CreateTransactionPage(typeTransaction: "income"),
        //                                           ),
        //                                         );
        //                                       },
        //                                     ),
        //                                   ),
        //                                 ),
        //                                 Padding(
        //                                   padding:
        //                                       const EdgeInsets.only(top: 10.0),
        //                                   child: Text(
        //                                     "Receita",
        //                                     style: GoogleFonts.roboto(
        //                                       textStyle: const TextStyle(
        //                                         color: Colors.white,
        //                                         fontSize: 12,
        //                                       ),
        //                                     ),
        //                                   ),
        //                                 ),
        //                               ],
        //                             ),
        //                           ),
        //                           Padding(
        //                             padding: const EdgeInsets.only(left: 25.0),
        //                             child: Column(
        //                               children: [
        //                                 ClipRRect(
        //                                   borderRadius:
        //                                       BorderRadius.circular(50),
        //                                   child: SizedBox(
        //                                     height: 46,
        //                                     width: 46,
        //                                     child: TextButton(
        //                                       style: TextButton.styleFrom(
        //                                         backgroundColor:
        //                                             Colors.grey[800],
        //                                       ),
        //                                       child: const Icon(
        //                                         Icons.arrow_upward_rounded,
        //                                         color: Colors.red,
        //                                         size: 20,
        //                                       ),
        //                                       onPressed: () {
        //                                         Navigator.pop(context);
        //                                         Navigator.push(
        //                                           context,
        //                                           MaterialPageRoute(
        //                                             builder: (context) =>
        //                                                 CreateTransactionPage(typeTransaction: "expense"),
        //                                           ),
        //                                         );
        //                                       },
        //                                     ),
        //                                   ),
        //                                 ),
        //                                 Padding(
        //                                   padding:
        //                                       const EdgeInsets.only(top: 10.0),
        //                                   child: Text(
        //                                     "Despesa",
        //                                     style: GoogleFonts.roboto(
        //                                       textStyle: const TextStyle(
        //                                         color: Colors.white,
        //                                         fontSize: 12,
        //                                       ),
        //                                     ),
        //                                   ),
        //                                 )
        //                               ],
        //                             ),
        //                           ),
        //                         ],
        //                       ),
        //                     );
        //                   },
        //                 );
        //               },
        //               child: Icon(Icons.add),
        //             ),
        //           ),
        //           InkWell(
        //             borderRadius: BorderRadius.circular(20),
        //             child: SizedBox(
        //               height: 40,
        //               width: 100,
        //               child: Column(
        //                 mainAxisAlignment: MainAxisAlignment.center,
        //                 children: [
        //                   // Image.asset(
        //                   //   "assets/cash_icon.jpg",
        //                   //   height: 28,
        //                   //   width: 28,
        //                   //   color:
        //                   //       paginaAtual == 1 ? darkerBlue : Colors.blueGrey,
        //                   // ),
        //                   Icon(
        //                     Icons.format_list_bulleted_rounded,
        //                     color: paginaAtual == 1 ? blue : Colors.grey[300],
        //                   ),
        //                   // Text(
        //                   //   "Histórico",
        //                   //   style: GoogleFonts.nunitoSans(
        //                   //     textStyle: TextStyle(
        //                   //       color:
        //                   //           paginaAtual == 1 ? darkerBlue : Colors.grey,
        //                   //     ),
        //                   //   ),
        //                   // ),
        //                 ],
        //               ),
        //             ),
        //             onTap: () {
        //               setState(() {
        //                 paginaAtual = 1;
        //               });
        //               FocusScopeNode currentFocus = FocusScope.of(context);

        //               if (!currentFocus.hasPrimaryFocus) {
        //                 currentFocus.unfocus();
        //               }
        //             },
        //           ),
        //         ],
        //       ),
        //     ),
        //   ),
        // ),

        // floatingActionButton: SizedBox(
        //   height: 50,
        //   width: 50,
        //   child: Builder(builder: (context) {
        //     return FloatingActionButton(
        //       backgroundColor: blue,
        //       onPressed: () {
        //         // showMenu(
        //         //   context: context,
        //         //   position: RelativeRect.fromLTRB(
        //         //       0, 30, 0, 0), // Posição do menu em relação ao botão.
        //         //   items: [
        //         //     PopupMenuItem(
        //         //       child: Text("Tipo 1"),
        //         //       value: "Tipo 1",
        //         //     ),
        //         //     PopupMenuItem(
        //         //       child: Text("Tipo 2"),
        //         //       value: "Tipo 2",
        //         //     ),
        //         //   ],
        //         // );
        //         // PopupMenuButton(
        //         //   itemBuilder: (context) => [
        //         //     PopupMenuItem(
        //         //       child: Text("Tipo 1"),
        //         //       value: "Tipo 1",
        //         //     ),
        //         //     PopupMenuItem(
        //         //       child: Text("Tipo 2"),
        //         //       value: "Tipo 2",
        //         //     ),
        //         //   ],
        //         // );

        //         showModalBottomSheet(
        //           context: context,
        //           backgroundColor: Colors.transparent,
        //           isScrollControlled: true,
        //           shape: const RoundedRectangleBorder(
        //             borderRadius: BorderRadius.vertical(
        //               top: Radius.circular(20),
        //             ),
        //           ),
        //           builder: (context) {
        //             return Container(
        //               height: 180,
        //               width: 200,
        //               child: Row(
        //                 mainAxisAlignment: MainAxisAlignment.center,
        //                 // crossAxisAlignment: CrossAxisAlignment.center,
        //                 children: [
        //                   Padding(
        //                     padding: const EdgeInsets.only(right: 25.0),
        //                     child: Column(
        //                       children: [
        //                         ClipRRect(
        //                           borderRadius: BorderRadius.circular(50),
        //                           child: SizedBox(
        //                             height: 46,
        //                             width: 46,
        //                             child: TextButton(
        //                               style: TextButton.styleFrom(
        //                                 backgroundColor: Colors.grey[800],
        //                               ),
        //                               child: const Icon(
        //                                 Icons.arrow_upward_rounded,
        //                                 color: Colors.green,
        //                                 size: 20,
        //                               ),
        //                               onPressed: () {
        //                                 // Navigator.pop(context);
        //                                 Navigator.push(
        //                                   context,
        //                                   MaterialPageRoute(
        //                                     builder: (context) =>
        //                                         CreateTransactionPage(),
        //                                   ),
        //                                 );
        //                               },
        //                             ),
        //                           ),
        //                         ),
        //                         Padding(
        //                           padding: const EdgeInsets.only(top: 10.0),
        //                           child: Text(
        //                             "Receita",
        //                             style: GoogleFonts.roboto(
        //                               textStyle: const TextStyle(
        //                                 color: Colors.white,
        //                                 fontSize: 12,
        //                               ),
        //                             ),
        //                           ),
        //                         ),
        //                       ],
        //                     ),
        //                   ),
        //                   Padding(
        //                     padding: const EdgeInsets.only(left: 25.0),
        //                     child: Column(
        //                       children: [
        //                         ClipRRect(
        //                           borderRadius: BorderRadius.circular(50),
        //                           child: SizedBox(
        //                             height: 46,
        //                             width: 46,
        //                             child: TextButton(
        //                               style: TextButton.styleFrom(
        //                                 backgroundColor: Colors.grey[800],
        //                               ),
        //                               child: const Icon(
        //                                 Icons.arrow_downward_rounded,
        //                                 color: Colors.red,
        //                                 size: 20,
        //                               ),
        //                               onPressed: () {
        //                                 Navigator.pop(context);
        //                               },
        //                             ),
        //                           ),
        //                         ),
        //                         Padding(
        //                           padding: const EdgeInsets.only(top: 10.0),
        //                           child: Text(
        //                             "Despesa",
        //                             style: GoogleFonts.roboto(
        //                               textStyle: const TextStyle(
        //                                 color: Colors.white,
        //                                 fontSize: 12,
        //                               ),
        //                             ),
        //                           ),
        //                         )
        //                       ],
        //                     ),
        //                   ),
        //                 ],
        //               ),
        //             );
        //           },
        //         );
        //       },
        //       child: Icon(Icons.add),
        //     );
        //   }),
        // ),
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: Stack(
          children: [
            IndexedStack(
              index: paginaAtual,
              children: screens,
            ),
            Positioned(
              bottom: 8,
              left: (size.width - (size.width* 0.7)) / 2,
              // right: 0,
              width: size.width* 0.7,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Container(
                  // shape: CircularNotchedRectangle(),
                  // shape: AutomaticNotchedShape(),
                  height: 54,
                  // width: 300,
                  
                  color: Colors.grey[900],
                  // margin: EdgeInsets.only(bottom: 10, left: 40, right: 40),
                  // decoration: BoxDecoration(
                  //   color: Colors.grey[900],
                  //   borderRadius: BorderRadius.circular(50)
                  // ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      InkWell(
                        borderRadius: BorderRadius.circular(20),
                        child: SizedBox(
                          height: 40,
                          width: 100,
                          child: Column(
                            // mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.home,
                                size: 26,
                                color:
                                    paginaAtual == 0 ? blue : Colors.grey[100],
                              ),
                              // Text(
                              //   "Home",
                              //   style: GoogleFonts.nunitoSans(
                              //     textStyle: TextStyle(
                              //       color:
                              //           paginaAtual == 0 ? darkerBlue : Colors.grey,
                              //     ),
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            paginaAtual = 0;
                          });
                          FocusScopeNode currentFocus = FocusScope.of(context);
            
                          if (!currentFocus.hasPrimaryFocus) {
                            currentFocus.unfocus();
                          }
                        },
                      ),
                      SizedBox(
                        height: 40,
                        width: 40,
                        child: FloatingActionButton(
                          backgroundColor: blue,
                          onPressed: () {
                            // showMenu(
                            //   context: context,
                            //   position: RelativeRect.fromLTRB(
                            //       0, 30, 0, 0), // Posição do menu em relação ao botão.
                            //   items: [
                            //     PopupMenuItem(
                            //       child: Text("Tipo 1"),
                            //       value: "Tipo 1",
                            //     ),
                            //     PopupMenuItem(
                            //       child: Text("Tipo 2"),
                            //       value: "Tipo 2",
                            //     ),
                            //   ],
                            // );
                            // PopupMenuButton(
                            //   itemBuilder: (context) => [
                            //     PopupMenuItem(
                            //       child: Text("Tipo 1"),
                            //       value: "Tipo 1",
                            //     ),
                            //     PopupMenuItem(
                            //       child: Text("Tipo 2"),
                            //       value: "Tipo 2",
                            //     ),
                            //   ],
                            // );
                            FocusScopeNode currentFocus =
                                FocusScope.of(context);
            
                            if (!currentFocus.hasPrimaryFocus) {
                              currentFocus.unfocus();
                            }
            
                            showModalBottomSheet(
                              context: context,
                              backgroundColor: Colors.transparent,
                              isScrollControlled: true,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(20),
                                ),
                              ),
                              builder: (context) {
                                return Container(
                                  height: 180,
                                  width: 200,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    // crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 25.0),
                                        child: Column(
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              child: SizedBox(
                                                height: 46,
                                                width: 46,
                                                child: TextButton(
                                                  style: TextButton.styleFrom(
                                                    backgroundColor:
                                                        Colors.grey[800],
                                                  ),
                                                  child: const Icon(
                                                    Icons
                                                        .arrow_downward_rounded,
                                                    color: Colors.green,
                                                    size: 20,
                                                  ),
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            CreateTransactionPage(
                                                                typeTransaction:
                                                                    "income"),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 10.0),
                                              child: Text(
                                                "Receita",
                                                style: GoogleFonts.roboto(
                                                  textStyle: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 12,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 25.0),
                                        child: Column(
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              child: SizedBox(
                                                height: 46,
                                                width: 46,
                                                child: TextButton(
                                                  style: TextButton.styleFrom(
                                                    backgroundColor:
                                                        Colors.grey[800],
                                                  ),
                                                  child: const Icon(
                                                    Icons.arrow_upward_rounded,
                                                    color: Colors.red,
                                                    size: 20,
                                                  ),
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            CreateTransactionPage(
                                                                typeTransaction:
                                                                    "expense"),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 10.0),
                                              child: Text(
                                                "Despesa",
                                                style: GoogleFonts.roboto(
                                                  textStyle: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 12,
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                          child: Icon(Icons.add),
                        ),
                      ),
                      InkWell(
                        borderRadius: BorderRadius.circular(20),
                        child: SizedBox(
                          height: 40,
                          width: 100,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Image.asset(
                              //   "assets/cash_icon.jpg",
                              //   height: 28,
                              //   width: 28,
                              //   color:
                              //       paginaAtual == 1 ? darkerBlue : Colors.blueGrey,
                              // ),
                              Icon(
                                Icons.format_list_bulleted_rounded,
                                color:
                                    paginaAtual == 1 ? blue : Colors.grey[300],
                              ),
                              // Text(
                              //   "Histórico",
                              //   style: GoogleFonts.nunitoSans(
                              //     textStyle: TextStyle(
                              //       color:
                              //           paginaAtual == 1 ? darkerBlue : Colors.grey,
                              //     ),
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            paginaAtual = 1;
                          });
                          FocusScopeNode currentFocus = FocusScope.of(context);
            
                          if (!currentFocus.hasPrimaryFocus) {
                            currentFocus.unfocus();
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
