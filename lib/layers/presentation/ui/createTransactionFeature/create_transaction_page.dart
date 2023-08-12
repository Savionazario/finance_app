import 'package:finance_app/layers/presentation/ui/createTransactionFeature/cubits/selectPaymentMethod/select_payment_method_cubit.dart';
import 'package:finance_app/layers/presentation/ui/createTransactionFeature/cubits/selectTransactionCategory/select_transaction_category_cubit.dart';
import 'package:finance_app/layers/presentation/ui/createTransactionFeature/cubits/selectTransactionCategory/select_transaction_category_state.dart';
import 'package:finance_app/layers/presentation/ui/createTransactionFeature/widgets/categories_list_widget.dart';
import 'package:finance_app/layers/presentation/ui/createTransactionFeature/widgets/payment_method_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import 'cubits/createTransaction/create_transaction_cubit.dart';
import 'cubits/createTransaction/create_transaction_state.dart';
import 'cubits/selectPaymentMethod/select_payment_method_state.dart';

class CreateTransactionPage extends StatefulWidget {
  final String typeTransaction;
  const CreateTransactionPage({Key? key, required this.typeTransaction})
      : super(key: key);

  @override
  _CreateTransactionPageState createState() => _CreateTransactionPageState();
}

class _CreateTransactionPageState extends State<CreateTransactionPage> {
  final SelectTransactionCategoryCubit _selectTransactionCategoryCubit =
      GetIt.I.get<SelectTransactionCategoryCubit>();
  final SelectPaymentMethodCubit _selectPaymentMethodCubit =
      GetIt.I.get<SelectPaymentMethodCubit>();
  final CreateTransactionCubit _createTransactionCubit =
      GetIt.I.get<CreateTransactionCubit>();

  final TextEditingController _decriptionController = TextEditingController();
  final TextEditingController _valueController = TextEditingController();

  List<String> categoriesExpense = [
    "Alimentação",
    "Transporte",
    "Contas",
    "Saúde",
    "Lazer"
  ];
  List<String> categoriesIncome = ["Salário", "Investimentos", "Renda extra"];

  String chosenTypeTransac = "";

  // String date = "Data da transação";

  ValueNotifier<String> date = ValueNotifier<String>("Data da transação");
  DateTime? dateInDateTime;

  _showDatePicker() async {
    DateTime? timePicked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );
    if (timePicked != null) {
      // String formattedDate = DateFormat('yyyy-MM-dd').format(timePicked);
      print("data escolhida: $timePicked");
      dateInDateTime = timePicked;
      return timePicked;
    }
    return null;
  }

  @override
  void initState() {
    chosenTypeTransac = widget.typeTransaction;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Container(
                height: size.height,
                width: size.width,
                color: Colors.black,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 8.0),
                      child: Container(
                        // color: Colors.red,
                        width: size.width,
                        height: 120,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              // color: Colors.blue,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Icon(
                                      Icons.arrow_back,
                                      color: Colors.white,
                                      size: 18,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 30.0),
                                    child: Text(
                                      "Nova Transação",
                                      style: GoogleFonts.nunitoSans(
                                        textStyle: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 70,
                              width: size.width,
                              // color: Colors.green,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Valor da transação",
                                    style: GoogleFonts.nunitoSans(
                                      textStyle: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "R\$",
                                        style: GoogleFonts.nunitoSans(
                                          textStyle: TextStyle(
                                            color: Colors.white,
                                            fontSize: 28,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 6.0),
                                        child: Container(
                                          height: 50,
                                          width: 170,
                                          child: TextFormField(
                                            controller: _valueController,
                                            style: GoogleFonts.nunitoSans(
                                              textStyle: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 28,
                                              ),
                                            ),
                                            decoration: InputDecoration(
                                              contentPadding:
                                                  EdgeInsets.only(top: 2.0),
                                              hintText: "0,00",
                                              hintStyle: GoogleFonts.nunitoSans(
                                                textStyle: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 28,
                                                ),
                                              ),

                                              border:
                                                  const UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Colors.transparent,
                                                ),
                                              ),
                                              enabledBorder:
                                                  const UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Colors.transparent,
                                                ),
                                              ),
                                              focusedBorder:
                                                  const UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Colors.transparent,
                                                ),
                                              ),
                                              // prefixIcon: Icon(
                                              //     Icons.description_outlined,
                                              //     weight: 0.01),
                                              // prefixIconColor: Colors.grey[800],
                                            ),
                                            keyboardType:
                                                TextInputType.numberWithOptions(
                                              decimal: true,
                                              signed: false,
                                            ),
                                            inputFormatters: [
                                              FilteringTextInputFormatter.allow(
                                                  RegExp(r'^(\d+)?\.?\d{0,2}')),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(24),
                            topRight: Radius.circular(24),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: SizedBox(
                                  height: 52,
                                  child: TextFormField(
                                    controller: _decriptionController,
                                    decoration: InputDecoration(
                                      hintText: "Descrição",
                                      hintStyle: GoogleFonts.nunitoSans(
                                        textStyle: TextStyle(
                                          color: Colors.grey[800],
                                          fontSize: 14,
                                        ),
                                      ),
                                      border: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.grey[300]!,
                                        ),
                                      ),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.grey[300]!,
                                        ),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.grey[300]!,
                                        ),
                                      ),
                                      prefixIcon: Icon(
                                          Icons.description_outlined,
                                          weight: 0.01),
                                      prefixIconColor: Colors.grey[800],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 0.0),
                                child: chosenTypeTransac == "income"
                                    ? CategoriesListWidget(
                                        categories: categoriesIncome,
                                      )
                                    : CategoriesListWidget(
                                        categories: categoriesExpense),
                              ),
                              Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  onTap: () {},
                                  child: Container(
                                    // color: Colors.red,
                                    width: size.width,
                                    height: 56,
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      border: Border(
                                        bottom: BorderSide(
                                          color: Colors.grey[300]!,
                                        ),
                                      ),
                                    ),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.only(
                                              left: 12.0, right: 20.0),
                                          child: Icon(
                                            Icons.compare_arrows_rounded,
                                            weight: 0.01,
                                          ),
                                        ),
                                        Expanded(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        chosenTypeTransac =
                                                            "income";
                                                      });
                                                      _selectTransactionCategoryCubit
                                                          .selectCategory(
                                                              category:
                                                                  categoriesIncome[
                                                                      0],
                                                              indexCategory: 0);
                                                    },
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        color:
                                                            chosenTypeTransac ==
                                                                    "income"
                                                                ? Colors
                                                                    .green[200]
                                                                : Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                        border: Border.all(
                                                          color: Colors.green,
                                                        ),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 10.0,
                                                                right: 10.0,
                                                                top: 4.0,
                                                                bottom: 4.0),
                                                        child: Row(
                                                          children: [
                                                            Icon(
                                                              Icons
                                                                  .arrow_downward_rounded,
                                                              weight: 0.01,
                                                              size: 18,
                                                              color:
                                                                  Colors.green,
                                                            ),
                                                            Text(
                                                              "Receita",
                                                              style: GoogleFonts
                                                                  .nunitoSans(
                                                                textStyle:
                                                                    TextStyle(
                                                                  color: Colors
                                                                          .grey[
                                                                      800],
                                                                  fontSize: 14,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        chosenTypeTransac =
                                                            "expense";
                                                      });
                                                      _selectTransactionCategoryCubit
                                                          .selectCategory(
                                                              category:
                                                                  categoriesExpense[
                                                                      0],
                                                              indexCategory: 0);
                                                    },
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        color:
                                                            chosenTypeTransac ==
                                                                    "expense"
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                        border: Border.all(
                                                          color: Colors.red,
                                                        ),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 10.0,
                                                                right: 10.0,
                                                                top: 4.0,
                                                                bottom: 4.0),
                                                        child: Row(
                                                          children: [
                                                            const Icon(
                                                              Icons
                                                                  .arrow_upward_rounded,
                                                              weight: 0.01,
                                                              size: 18,
                                                              color: Colors.red,
                                                            ),
                                                            Text(
                                                              "Despesa",
                                                              style: GoogleFonts
                                                                  .nunitoSans(
                                                                textStyle:
                                                                    TextStyle(
                                                                  color: Colors
                                                                          .grey[
                                                                      800],
                                                                  fontSize: 14,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Icon(
                                                Icons.arrow_forward_ios_rounded,
                                                weight: 0.01,
                                                size: 18,
                                                color: Colors.grey[800],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 0.0),
                                child: PaymentMethodList(),
                              ),
                              Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  onTap: () async {
                                    var pickedDate = await _showDatePicker();
                                    if (pickedDate != null) {
                                      date.value = DateFormat('dd-MM-yyyy')
                                          .format(pickedDate);
                                    }
                                  },
                                  child: Container(
                                    // color: Colors.red,
                                    width: size.width,
                                    height: 56,
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          color: Colors.grey[300]!,
                                        ),
                                      ),
                                    ),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.only(
                                              left: 12.0, right: 20.0),
                                          child: Icon(
                                            Icons.calendar_month_outlined,
                                            weight: 0.01,
                                          ),
                                        ),
                                        Container(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 10.0,
                                                right: 10.0,
                                                top: 4.0,
                                                bottom: 4.0),
                                            child: ValueListenableBuilder(
                                              valueListenable: date,
                                              builder: (context, value, child) {
                                                return Text(
                                                  value,
                                                  style: GoogleFonts.nunitoSans(
                                                    textStyle: TextStyle(
                                                      color: Colors.grey[800],
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: Center(
                child: SizedBox(
                  height: 40,
                  width: 190,
                  child: BlocBuilder<CreateTransactionCubit,
                      CreateTransactionState>(
                    bloc: _createTransactionCubit,
                    builder: (context, state) {
                      if (state is CreateTransactionInitialState) {
                        return TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: chosenTypeTransac == "income"
                                ? Colors.green
                                : Colors.red,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: Text(
                            "Cadastrar transação",
                            style: GoogleFonts.nunitoSans(
                              textStyle: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          onPressed: () {
                            String categoryChosen = "";
                            var categoryState =
                                _selectTransactionCategoryCubit.state;

                            if (categoryState
                                is TransactionCategoryInitialState) {
                              categoryChosen = categoryState.category;
                            } else {
                              categoryState = categoryState
                                  as TransactionCategorySelectedState;
                              categoryChosen = categoryState.category;
                            }

                            String paymemtMethodChosen = "";
                            var paymentMethodState =
                                _selectPaymentMethodCubit.state;

                            if (paymentMethodState
                                is SelectPaymentMethodInitialState) {
                              paymemtMethodChosen =
                                  paymentMethodState.paymentMethod;
                            } else {
                              paymentMethodState = paymentMethodState
                                  as SelectedPaymentMethodState;
                              paymemtMethodChosen =
                                  paymentMethodState.paymentMethod;
                            }

                            var dateChosen = date.value;

                            if (dateChosen == "Data da transação" ||
                                dateChosen.isEmpty) {
                              const snackBar = SnackBar(
                                content: Text('Escolha uma data!'),
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            } else {
                              print("Value: ${_valueController.text}");
                              _createTransactionCubit
                                  .createTransactionButtonPressed(
                                      category: categoryChosen,
                                      date: dateInDateTime!,
                                      description: _decriptionController.text,
                                      paymentMethod: paymemtMethodChosen,
                                      type: chosenTypeTransac,
                                      value: _valueController.text);
                            }
                          },
                        );
                      }
                      if (state is CreateTransactionLoadingState) {
                        return TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: chosenTypeTransac == "income"
                                ? Colors.green
                                : Colors.red,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: const Center(
                            child: SizedBox(
                              height: 24,
                              width: 24,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 3,
                              ),
                            ),
                          ),
                          onPressed: () {
                            String categoryChosen = "";
                            var categoryState =
                                _selectTransactionCategoryCubit.state;

                            if (categoryState
                                is TransactionCategoryInitialState) {
                              categoryChosen = categoryState.category;
                            } else {
                              categoryState = categoryState
                                  as TransactionCategorySelectedState;
                              categoryChosen = categoryState.category;
                            }

                            String paymemtMethodChosen = "";
                            var paymentMethodState =
                                _selectPaymentMethodCubit.state;

                            if (paymentMethodState
                                is SelectPaymentMethodInitialState) {
                              paymemtMethodChosen =
                                  paymentMethodState.paymentMethod;
                            } else {
                              paymentMethodState = paymentMethodState
                                  as SelectedPaymentMethodState;
                              paymemtMethodChosen =
                                  paymentMethodState.paymentMethod;
                            }

                            var dateChosen = date.value;

                            if (dateChosen == "Data da transação" ||
                                dateChosen.isEmpty) {
                              const snackBar = SnackBar(
                                content: Text('Escolha uma data!'),
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            } else {
                              print("Value: ${_valueController.text}");
                              _createTransactionCubit
                                  .createTransactionButtonPressed(
                                      category: categoryChosen,
                                      date: dateInDateTime!,
                                      description: _decriptionController.text,
                                      paymentMethod: paymemtMethodChosen,
                                      type: chosenTypeTransac,
                                      value: _valueController.text);
                            }
                          },
                        );
                      }

                      if (state is CreateTransactionErrorState) {
                        String message = state.errorMessage;
                        _onWidgetDidBuild(() {
                          _showErrorDialog(context, message);
                        });

                        return TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: chosenTypeTransac == "income"
                                ? Colors.green
                                : Colors.red,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: Text(
                            "Cadastrar transação",
                            style: GoogleFonts.nunitoSans(
                              textStyle: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          onPressed: () {
                            String categoryChosen = "";
                            var categoryState =
                                _selectTransactionCategoryCubit.state;

                            if (categoryState
                                is TransactionCategoryInitialState) {
                              categoryChosen = categoryState.category;
                            } else {
                              categoryState = categoryState
                                  as TransactionCategorySelectedState;
                              categoryChosen = categoryState.category;
                            }

                            String paymemtMethodChosen = "";
                            var paymentMethodState =
                                _selectPaymentMethodCubit.state;

                            if (paymentMethodState
                                is SelectPaymentMethodInitialState) {
                              paymemtMethodChosen =
                                  paymentMethodState.paymentMethod;
                            } else {
                              paymentMethodState = paymentMethodState
                                  as SelectedPaymentMethodState;
                              paymemtMethodChosen =
                                  paymentMethodState.paymentMethod;
                            }

                            var dateChosen = date.value;

                            if (dateChosen == "Data da transação" ||
                                dateChosen.isEmpty) {
                              const snackBar = SnackBar(
                                content: Text('Escolha uma data!'),
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            } else {
                              print("Value: ${_valueController.text}");
                              _createTransactionCubit
                                  .createTransactionButtonPressed(
                                      category: categoryChosen,
                                      date: dateInDateTime!,
                                      description: _decriptionController.text,
                                      paymentMethod: paymemtMethodChosen,
                                      type: chosenTypeTransac,
                                      value: _valueController.text);
                            }
                          },
                        );
                      }

                      state = state as CreateTransactionSucessfulState;

                      _onWidgetDidBuild(() {
                        _showSucessDialog(context);
                      });
                      return TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: chosenTypeTransac == "income"
                              ? Colors.green
                              : Colors.red,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: Text(
                          "Cadastrar transação",
                          style: GoogleFonts.nunitoSans(
                            textStyle: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        onPressed: () {
                          String categoryChosen = "";
                          var categoryState =
                              _selectTransactionCategoryCubit.state;

                          if (categoryState
                              is TransactionCategoryInitialState) {
                            categoryChosen = categoryState.category;
                          } else {
                            categoryState = categoryState
                                as TransactionCategorySelectedState;
                            categoryChosen = categoryState.category;
                          }

                          String paymemtMethodChosen = "";
                          var paymentMethodState =
                              _selectPaymentMethodCubit.state;

                          if (paymentMethodState
                              is SelectPaymentMethodInitialState) {
                            paymemtMethodChosen =
                                paymentMethodState.paymentMethod;
                          } else {
                            paymentMethodState = paymentMethodState
                                as SelectedPaymentMethodState;
                            paymemtMethodChosen =
                                paymentMethodState.paymentMethod;
                          }

                          var dateChosen = date.value;

                          if (dateChosen == "Data da transação" ||
                              dateChosen.isEmpty) {
                            const snackBar = SnackBar(
                              content: Text('Escolha uma data!'),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          } else {
                            _createTransactionCubit
                                .createTransactionButtonPressed(
                                    category: categoryChosen,
                                    date: dateInDateTime!,
                                    description: _decriptionController.text,
                                    paymentMethod: paymemtMethodChosen,
                                    type: chosenTypeTransac,
                                    value: _valueController.text);
                          }
                        },
                      );
                    },
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

void _onWidgetDidBuild(Function callback) {
  WidgetsBinding.instance.addPostFrameCallback((_) {
    callback();
  });
}

_showSucessDialog(BuildContext context) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          // title: Text("Ops, algo está errado"),
          content: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            height: 150,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Container(
                    width: 100,
                    height: 100,
                    color: Colors.green[100],
                    child: Center(
                      child: Icon(
                        Icons.check,
                        size: 30,
                        color: Colors.green,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: Text(
                    "Transação cadastrada\ncom sucesso",
                    style: GoogleFonts.roboto(
                      textStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                    maxLines: 2,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              child: Text("Fechar"),
              onPressed: () {
                // Navigator.pop(context);
                int count = 0;
                Navigator.of(context).popUntil((_) => count++ >= 2);
              },
            )
          ],
        );
      });
}

_showErrorDialog(BuildContext context, String errorMessage) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          // title: Text("Ops, algo está errado"),
          content: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            height: 150,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Container(
                    width: 100,
                    height: 100,
                    color: Colors.red[100],
                    child: Center(
                      child: Icon(
                        Icons.error_outline_rounded,
                        size: 30,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: Text(
                    errorMessage,
                    style: GoogleFonts.roboto(
                      textStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                    maxLines: 2,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              child: Text("Fechar"),
              onPressed: () {
                // Navigator.pop(context);
                int count = 0;
                Navigator.of(context).popUntil((_) => count++ >= 2);
              },
            )
          ],
        );
      });
}
