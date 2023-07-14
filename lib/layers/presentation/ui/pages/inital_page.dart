import 'package:finance_app/layers/presentation/ui/pages/history_page.dart';
import 'package:finance_app/layers/presentation/ui/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InitalPage extends StatefulWidget {
  const InitalPage({Key? key}) : super(key: key);

  @override
  _InitalPageState createState() => _InitalPageState();
}

class _InitalPageState extends State<InitalPage> {
  var ligtherBlue = Color(0xFF4365AA);
  var middleBlue = Color(0xFF234F9D);
  var darkerBlue = Color(0xFF233C65);
  var colorBackGround = Color(0xFFF3F5F9);
  var blue = Color(0xFF0E3AAA);

  int paginaAtual = 0;

  final screens = [
    HomePage(),
    HistoryPage(),
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: colorBackGround,
        // bottomNavigationBar: BottomNavigationBar(
        //   type: BottomNavigationBarType.fixed,
        //   selectedLabelStyle: GoogleFonts.poppins(
        //     textStyle: const TextStyle(
        //       fontSize: 12,
        //       fontWeight: FontWeight.w600,
        //     ),
        //   ),
        //   unselectedLabelStyle: GoogleFonts.poppins(
        //     textStyle: TextStyle(
        //       color: ligtherBlue,
        //       fontSize: 12,
        //       fontWeight: FontWeight.w500,
        //     ),
        //   ),
        //   unselectedItemColor: Colors.blueGrey,
        //   selectedItemColor: darkerBlue,
        //   showSelectedLabels: true,
        //   showUnselectedLabels: true,
        //   items: [
        //     const BottomNavigationBarItem(
        //       label: "Home",
        //       icon: Icon(
        //         Icons.home,
        //         size: 26,
        //       ),
        //     ),

        //     // BottomNavigationBarItem(
        //     //   label: "Adicionar",
        //     //   icon: Container(
        //     //     height: 30,
        //     //     width: 36,
        //     //     decoration: BoxDecoration(
        //     //       color: darkerBlue,
        //     //       borderRadius: const BorderRadius.all(
        //     //         Radius.circular(12),
        //     //       ),
        //     //       // boxShadow: [
        //     //       //   BoxShadow(
        //     //       //     color: Colors.blueGrey[200]!.withOpacity(0.36),
        //     //       //     spreadRadius: 5,
        //     //       //     blurRadius: 7,
        //     //       //     offset: const Offset(0, 7),
        //     //       //   ),
        //     //       // ],
        //     //     ),
        //     //     child: Icon(
        //     //       Icons.add,
        //     //       color: colorBackGround,
        //     //       size: 18,
        //     //     ),
        //     //   ),
        //     // ),
        //     BottomNavigationBarItem(
        //       label: "Histórico",
        //       icon: Image.asset(
        //         "assets/cash_icon.jpg",
        //         height: 28,
        //         width: 28,
        //         color: paginaAtual == 1 ? darkerBlue : Colors.blueGrey,
        //       ),
        //     ),
        //     // const BottomNavigationBarItem(
        //     //     label: "Cartões",
        //     //     icon: Icon(
        //     //       Icons.wallet,
        //     //       size: 26,
        //     //     )),

        //     // const BottomNavigationBarItem(
        //     //   label: "Perfil",
        //     //   icon: Icon(
        //     //     Icons.person_outline,
        //     //     size: 26,
        //     //   ),
        //     // ),
        //   ],
        //   currentIndex: paginaAtual,
        //   onTap: (index) {
        //     setState(() {
        //       paginaAtual = index;
        //     });
        //   },
        // ),

        // bottomNavigationBar: Row(
        //   children: [
        //     Expanded(
        //       child: Container(
        //         height: 50,
        //         width: 40,
        //         color: Colors.red,
        //       ),
        //     ),
        //     Expanded(
        //       child: Container(
        //         height: 50,
        //         width: 40,
        //         color: Colors.green,
        //       ),
        //     ),
        //     Expanded(
        //       child: Container(
        //         height: 50,
        //         width: 40,
        //         color: Colors.blue,
        //       ),
        //     ),
        //     Expanded(
        //       child: Container(
        //         height: 50,
        //         width: 40,
        //         color: Colors.yellow,
        //       ),
        //     ),
        //     Expanded(
        //       child: Container(
        //         height: 50,
        //         width: 40,
        //         color: Colors.brown,
        //       ),
        //     ),

        //   ],
        // ),

        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          child: Padding(
            padding: const EdgeInsets.only(top: 6.0, bottom: 6.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              children: [
                InkWell(
                  child: SizedBox(
                    // color: Colors.red,
                    width: 100,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.home,
                          size: 26,
                          color: paginaAtual == 0 ? darkerBlue : Colors.grey,
                        ),
                        Text(
                          "Home",
                          style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                              color: paginaAtual == 0 ? darkerBlue : Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      paginaAtual = 0;
                    });
                  },
                ),
                InkWell(
                  child: SizedBox(
                    width: 100,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          "assets/cash_icon.jpg",
                          height: 28,
                          width: 28,
                          color: paginaAtual == 1 ? darkerBlue : Colors.blueGrey,
                        ),
                        // Icon(Icons.cash_)
                        Text(
                          "Histórico",
                          style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                              color: paginaAtual == 1 ? darkerBlue : Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      paginaAtual = 1;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: SizedBox(
          height: 50,
          width: 50,
          child: FloatingActionButton(
            backgroundColor: blue,
            onPressed: () {},
            child: Icon(Icons.add),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: IndexedStack(
          index: paginaAtual,
          children: screens,
        ),
      ),
    );
  }
}
