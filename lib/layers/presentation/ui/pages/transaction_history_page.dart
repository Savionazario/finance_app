import 'package:finance_app/layers/presentation/ui/cubits/transactionsList/transactions_list_cubit.dart';
import 'package:finance_app/layers/presentation/ui/cubits/transactionsList/transactions_list_state.dart';
import 'package:finance_app/layers/presentation/ui/widgets/categories_pie_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../constants/constants.dart';
import '../shimmers/shimmer_home_page.dart';

class TransactionHistoryPage extends StatefulWidget {
  const TransactionHistoryPage({Key? key}) : super(key: key);

  @override
  _TransactionHistoryPageState createState() => _TransactionHistoryPageState();
}

class _TransactionHistoryPageState extends State<TransactionHistoryPage> {
  late final TransactionListCubit _userTransactionsCubit;

  IconData icon = Icons.food_bank_outlined;
  Color categoryColor = Colors.yellow;

  getFormattedDate(DateTime date) {
    String formattedDate = DateFormat("dd/MM").format(date);
    return formattedDate;
  }

  @override
  void initState() {
    _userTransactionsCubit = GetIt.I.get<TransactionListCubit>();
    _userTransactionsCubit.loadUserWithFilteredTransactions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: BlocBuilder<TransactionListCubit, TransactionListState>(
        bloc: _userTransactionsCubit,
        builder: (context, state) {
          if (state is TransactionListInitialState) {
            return Center(child: Text("Lista Vazia!!"));
          }
          if (state is TransactionListLoadingState) {
            return ShimmerHomePage();
          }

          if (state is TransactionListErrorState) {
            return Center(
                child: Text("Algo deu errado: ${state.errorMessage}"));
          }

          state = state as TransactionListLoadedState;
          List transactionsList = state.userEntity.transactions!;
          return Scaffold(
            // resizeToAvoidBottomInset: false,
            body: RefreshIndicator(
              onRefresh: () async {
                _userTransactionsCubit.loadUserWithFilteredTransactions(searchText: "");
              },
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Histórico",
                        style: GoogleFonts.openSans(
                          textStyle: const TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: Container(
                          height: size.height * 0.32,
                          width: size.width,
                          decoration: BoxDecoration(
                            color: Colors.grey[900],
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: CategoriesPieChart(user: state.userEntity),
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
                          ? Padding(
                            padding: EdgeInsets.only(bottom: size.height * 0.08),
                            child: ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: transactionsList.length,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  switch (transactionsList[index].category) {
                                    case "Alimentação":
                                      icon = Icons.food_bank_outlined;
                                      categoryColor = Colors.yellow;
                                      break;
                                    case "Transporte":
                                      icon = Icons.car_repair;
                                      categoryColor = Colors.blue;
                                      break;
                                    case "Contas":
                                      icon = Icons.account_balance;
                                      categoryColor = Colors.orange[800]!;
                                      break;
                                    case "Saúde":
                                      icon = Icons.health_and_safety_outlined;
                                      categoryColor = Colors.red;
                                      break;
                                    case "Lazer":
                                      icon = Icons.pool_rounded;
                                      categoryColor = Colors.green;
                                      break;
                                    case "Compras":
                                      icon = Icons.shopping_bag_outlined;
                                      categoryColor = Colors.purple;
                                      break;
                                    case "Salário":
                                      icon = Icons.wallet_outlined;
                                      categoryColor = Colors.green[800]!;
                                      break;
                                    case "Renda extra":
                                      icon = Icons.attach_money_rounded;
                                      categoryColor = Colors.green[300]!;
                                      break;
                                    case "Investimentos":
                                      icon = Icons.call_missed_outgoing_sharp;
                                      categoryColor = Color(0xFFE9B454);
                                      break;
                                    default:
                                  }
                                  var transactionType =
                                      transactionsList[index].type;
                                  return Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Container(
                                      width: 200,
                                      height: 70,
                                      decoration: BoxDecoration(
                                        color: colorBackGround,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0),
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
                                                  width: 46,
                                                  height: 46,
                                                  decoration: BoxDecoration(
                                                    color: categoryColor,
                                                    borderRadius:
                                                        BorderRadius.circular(30),
                                                  ),
                                                  child: Icon(
                                                    icon,
                                                    color: Colors.white,
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
                                                        style: GoogleFonts.poppins(
                                                          textStyle: TextStyle(
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        width: size.width * 0.3,
                          
                                                        // color: Colors.red,
                                                        child: Text(
                                                          "${transactionsList[index].paymentMethod}",
                                                          style:
                                                              GoogleFonts.poppins(
                                                            textStyle: TextStyle(
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight.w600,
                                                              color: Colors.grey,
                                                            ),
                                                          ),
                                                          softWrap: false,
                                                          overflow:
                                                              TextOverflow.ellipsis,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.only(left: 16.0),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  Text(
                                                      transactionType == "expense"
                                                          ? "R\$ - ${transactionsList[index].value.toStringAsFixed(2)}"
                                                          : "R\$ + ${transactionsList[index].value.toStringAsFixed(2)}",
                                                      style: GoogleFonts.poppins(
                                                        textStyle: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: transactionType ==
                                                                  "expense"
                                                              ? Colors.red
                                                              : Colors.green,
                                                        ),
                                                      )),
                                                  Text(
                                                    getFormattedDate(
                                                        transactionsList[index]
                                                            .date),
                                                    style: GoogleFonts.poppins(
                                                      textStyle: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight: FontWeight.w600,
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
                          )
                          : Align(
                              alignment: Alignment.center,
                              child: Padding(
                                padding: EdgeInsets.only(top: size.height * 0.04),
                                child: Container(
                                  child: Text(
                                    "Nenhum resultado encontrado.",
                                    style: GoogleFonts.openSans(
                                      textStyle: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        // color: Colors.grey,
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
