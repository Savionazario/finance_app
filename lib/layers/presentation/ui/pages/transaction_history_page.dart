import 'package:finance_app/layers/presentation/ui/cubits/userTransactions/user_transactions_cubit.dart';
import 'package:finance_app/layers/presentation/ui/cubits/userTransactions/user_transactions_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/constants.dart';
import '../shimmers/shimmer_home_page.dart';

class TransactionHistoryPage extends StatefulWidget {
  const TransactionHistoryPage({Key? key}) : super(key: key);

  @override
  _TransactionHistoryPageState createState() => _TransactionHistoryPageState();
}

class _TransactionHistoryPageState extends State<TransactionHistoryPage> {
  late final UserTransactionsCubit _userTransactionsCubit;

  @override
  void initState() {
    _userTransactionsCubit = GetIt.I.get<UserTransactionsCubit>();
    _userTransactionsCubit.loadUserWithFilteredTransactions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: BlocBuilder<UserTransactionsCubit, UserTransactionsState>(
        bloc: _userTransactionsCubit,
        builder: (context, state) {
          if (state is UserTransactionsInitialState) {
            return Center(child: Text("Lista Vazia!!"));
          }
          if (state is UserTransactionsLoadingState) {
            return ShimmerHomePage();
          }

          if (state is UserTransactionsErrorState) {
            return Center(
                child: Text("Algo deu errado: ${state.errorMessage}"));
          }

          state = state as UserTransactionsLoadedState;
          List transactionsList = state.userEntity.transactions!;
          return Scaffold(
            // resizeToAvoidBottomInset: false,
            body: SingleChildScrollView(
              child: Container(
                height: size.height,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Histórico",
                        style: GoogleFonts.montserrat(
                          textStyle: const TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0, bottom: 10.0),
                        child: SizedBox(
                          height: 46,
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: "Digite o que quer buscar",
                              hintStyle: const TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25),
                                borderSide: BorderSide(
                                  color: Colors.grey[300]!,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25),
                                borderSide: BorderSide(
                                  color: Colors.grey[300]!,
                                ),
                              ),
                              prefixIcon: Icon(Icons.search_rounded),
                              prefixIconColor: Colors.grey,
                            ),
                            onChanged: (searchText) {
                              _userTransactionsCubit
                                  .loadUserWithFilteredTransactions(
                                      searchText: searchText);
                            },
                          ),
                        ),
                      ),
                      transactionsList.isNotEmpty
                          ? ListView.builder(
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
                                      borderRadius: BorderRadius.circular(10),
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
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                width: 50,
                                                height: 50,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(14),
                                                ),
                                                child: Icon(
                                                  Icons.shopping_bag_outlined,
                                                  color: middleBlue,
                                                  size: 26,
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 14.0),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "${transactionsList[index].category}",
                                                      style:
                                                          GoogleFonts.poppins(
                                                        textStyle: TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                    ),
                                                    Text(
                                                      "${transactionsList[index].description}",
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
                                                    transactionType == "expense"
                                                        ? "- ${transactionsList[index].value.toStringAsFixed(2)}"
                                                        : "+ ${transactionsList[index].value.toStringAsFixed(2)}",
                                                    style: GoogleFonts.poppins(
                                                      textStyle: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color:
                                                            transactionType ==
                                                                    "expense"
                                                                ? Colors.red
                                                                : Colors.green,
                                                      ),
                                                    )),
                                                Text(
                                                  "16/04",
                                                  style: GoogleFonts.poppins(
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
                            )
                          : Expanded(
                            child: Align(
                              alignment: Alignment.center,
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 160.0),
                                child: Container(
                                  child: Text(
                                    "Nenhum resultado encontrado.",
                                    style: GoogleFonts.montserrat(
                                      textStyle: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        // color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                      // Expanded(
                      //   child: Container(
                      //     // height: 100,
                      //     color: Colors.blue,
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
