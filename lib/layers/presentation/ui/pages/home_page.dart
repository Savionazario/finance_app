import 'package:finance_app/layers/presentation/ui/cubits/authentication/authentication_cubit.dart';
import 'package:finance_app/layers/presentation/ui/cubits/getUserDetails/get_user_details_cubit.dart';
import 'package:finance_app/layers/presentation/ui/cubits/getUserDetails/get_user_details_state.dart';
import 'package:finance_app/layers/presentation/ui/pages/history_page.dart';
import 'package:finance_app/layers/presentation/ui/shimmers/shimmer_home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var ligtherBlue = Color(0xFF4365AA);
  var middleBlue = Color(0xFF234F9D);
  var darkerBlue = Color(0xFF233C65);
  var colorBackGround = Color(0xFFF3F5F9);
  var purple = Color(0xFF2E2273);
  var darkPurple = Color.fromARGB(255, 92, 64, 211);
  var darkPurpleTwo = Color.fromARGB(255, 80, 64, 211);
  var darkPurpleThree = Color.fromARGB(255, 70, 65, 211);
  var blue = Color.fromARGB(255, 14, 58, 170);
  var bluetwo = Color.fromARGB(255, 14, 68, 170);
  var bluethree = Color.fromARGB(255, 14, 78, 170);
  var areia = Color.fromARGB(255, 233, 177, 121);

  double containerWidth = 300.0;
  double containerHeight = 10.0;

  final screens = [
    HomePage(),
    HistoryPage(),
  ];

  int paginaAtual = 0;

  late final AuthenticationCubit _authenticationCubit;
  late final GetUserDetailsCubit _getUserDetailsCubit;

  @override
  void initState() {
    _authenticationCubit = GetIt.I.get<AuthenticationCubit>();
    _getUserDetailsCubit = GetIt.I.get<GetUserDetailsCubit>();
    _getUserDetailsCubit.loadUserDetails();
    super.initState();
  }

  Widget getShimmerListEffect() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Container(
          height: 80,
          width: 360,
          // color: Colors.red,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 14.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 10,
                          width: 260,
                          color: Colors.grey,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 10,
                          width: 200,
                          color: Colors.grey,
                        )
                      ],
                    ),
                  ),
                ],
              ),
              // Column(
              //   children: [
              //     Container(
              //       height: 10,
              //       width: 30,
              //       color: Colors.grey,
              //     ),
              //     const SizedBox(height: 6,),
              //     Container(
              //       height: 10,
              //       width: 30,
              //       color: Colors.grey,
              //     )
              //   ],
              // )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: BlocBuilder<GetUserDetailsCubit, GetUserDetailsState>(
        bloc: _getUserDetailsCubit,
        builder: (context, state) {
          if (state is GetUserDetailsInitialState) {
            return Center(child: Text("Lista Vazia!!"));
          }
          if (state is GetUserDetailsLoadingState) {
            return ShimmerHomePage();
          }

          if (state is GetUserDetailsErrorState) {
            return Center(
                child: Text("Algo deu errado: ${state.errorMessage}"));
          }

          state = state as GetUserDetailsSucessfulState;
          List transactionsList = state.userEntity.transactions!;
          return Scaffold(
            backgroundColor: colorBackGround,
            body: SingleChildScrollView(
              child: Container(
                height: size.height,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 18.0, vertical: 20),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Minhas finanças",
                              style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 50,
                              child: TextButton(
                                style: TextButton.styleFrom(
                                    backgroundColor: Colors.grey[300]),
                                child: Icon(
                                  Icons.logout,
                                  color: Colors.black,
                                ),
                                onPressed: () {
                                  // _authenticationCubit.signOut();
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ShimmerHomePage()));
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        width: size.width / 1.1,
                        height: 100,
                        decoration: BoxDecoration(
                          // color: blue,
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment(0.8, 1),
                            colors: [
                              areia,
                              darkPurple,
                              // darkPurpleTwo,
                              // darkPurpleThree,
                              // bluethree,
                              // bluetwo,
                              blue,
                            ],
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Saldo disponível",
                              style: GoogleFonts.nunitoSans(
                                textStyle: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Text(
                              "${(state.userEntity.income! - state.userEntity.expense!).toStringAsFixed(2)}",
                              style: GoogleFonts.nunitoSans(
                                textStyle: const TextStyle(
                                  fontSize: 26,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: 130,
                              width: 160,
                              child: Card(
                                elevation: 0,
                                shape: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Colors.blueGrey[100]!,
                                  ),
                                ),
                                color: colorBackGround,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Container(
                                        color: Colors.green[100],
                                        height: 34,
                                        width: 34,
                                        child: Icon(
                                          Icons.arrow_downward_rounded,
                                          color: Colors.green,
                                          size: 18,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      "Renda",
                                      style: GoogleFonts.montserrat(
                                          textStyle: const TextStyle(
                                        fontSize: 12,
                                        color: Colors.blueGrey,
                                        fontWeight: FontWeight.w500,
                                      )),
                                    ),
                                    Text(
                                      state.userEntity.income!
                                          .toStringAsFixed(2),
                                      style: GoogleFonts.montserrat(
                                          textStyle: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                      )),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 130,
                              width: 160,
                              child: Card(
                                elevation: 0,
                                shape: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Colors.blueGrey[100]!,
                                  ),
                                ),
                                color: colorBackGround,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Container(
                                        color: Colors.red[100],
                                        height: 34,
                                        width: 34,
                                        child: const Icon(
                                          Icons.arrow_upward_rounded,
                                          color: Colors.red,
                                          size: 18,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      "Despesas",
                                      style: GoogleFonts.montserrat(
                                          textStyle: const TextStyle(
                                        fontSize: 12,
                                        color: Colors.blueGrey,
                                        fontWeight: FontWeight.w500,
                                      )),
                                    ),
                                    Text(
                                      state.userEntity.expense!
                                          .toStringAsFixed(2),
                                      style: GoogleFonts.montserrat(
                                          textStyle: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                      )),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          // height: 500,
                          width: size.width,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(40),
                              topRight: Radius.circular(40),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 16.0),
                                      child: Text(
                                        "Transações",
                                        style: GoogleFonts.montserrat(
                                          textStyle: TextStyle(
                                            fontSize: 18,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 26.0),
                                      child: Text(
                                        "Ver tudo",
                                        style: GoogleFonts.montserrat(
                                          textStyle: TextStyle(
                                            fontSize: 14,
                                            color: Colors.blueGrey[300],
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 26.0),
                                  child: Text(
                                    "Hoje",
                                    style: GoogleFonts.poppins(
                                      textStyle: const TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                                // getShimmerListEffect(),

                                ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: transactionsList.length,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    var transactionType =
                                        transactionsList[index].type;
                                    return Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Container(
                                        width: 200,
                                        height: 80,
                                        decoration: BoxDecoration(
                                          color: colorBackGround,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 16.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    width: 50,
                                                    height: 50,
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              14),
                                                    ),
                                                    child: Icon(
                                                      Icons
                                                          .shopping_bag_outlined,
                                                      color: middleBlue,
                                                      size: 26,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 14.0),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          "${transactionsList[index].category}",
                                                          style: GoogleFonts
                                                              .poppins(
                                                            textStyle:
                                                                TextStyle(
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                          ),
                                                        ),
                                                        Text(
                                                          "${transactionsList[index].description}",
                                                          style: GoogleFonts
                                                              .poppins(
                                                            textStyle:
                                                                TextStyle(
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              color:
                                                                  Colors.grey,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 16.0),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    Text(
                                                        transactionType ==
                                                                "expense"
                                                            ? "- ${transactionsList[index].value.toStringAsFixed(2)}"
                                                            : "+ ${transactionsList[index].value.toStringAsFixed(2)}",
                                                        style:
                                                            GoogleFonts.poppins(
                                                          textStyle: TextStyle(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color:
                                                                transactionType ==
                                                                        "expense"
                                                                    ? Colors.red
                                                                    : Colors
                                                                        .green,
                                                          ),
                                                        )),
                                                    Text(
                                                      "16/04",
                                                      style:
                                                          GoogleFonts.poppins(
                                                        textStyle: TextStyle(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: Colors.grey,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
