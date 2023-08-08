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

class CreateTransactionPage extends StatefulWidget {
  const CreateTransactionPage({Key? key}) : super(key: key);

  @override
  _CreateTransactionPageState createState() => _CreateTransactionPageState();
}

class _CreateTransactionPageState extends State<CreateTransactionPage> {
  final SelectTransactionCategoryCubit _selectTransactionCategoryCubit =
      GetIt.I.get<SelectTransactionCategoryCubit>();
  List<String> categories = [
    "Alimentação",
    "Transporte",
    "Contas",
    "Saúde",
    "Lazer"
  ];
  int chosenTypeTransac = 0;
  String chosenCategory = "Alimentação";
  // String date = "Data da transação";

  ValueNotifier<String> date = ValueNotifier<String>("Data da transação");

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
      return timePicked;
    }
    return null;
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
                                child: CategoriesListWidget(),
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
                                                        chosenTypeTransac = 0;
                                                      });
                                                    },
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        color:
                                                            chosenTypeTransac ==
                                                                    0
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
                                                        chosenTypeTransac = 1;
                                                      });
                                                    },
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        color:
                                                            chosenTypeTransac ==
                                                                    1
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
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor:
                          chosenTypeTransac == 0 ? Colors.green : Colors.red,
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
                      var categoryState = _selectTransactionCategoryCubit.state;
                      if (categoryState is TransactionCategoryInitialState) {
                        print("Categoria 1: ${categoryState.category}");
                      } else {
                        categoryState =
                            categoryState as TransactionCategorySelectedState;
                        print("Categoria 2: ${categoryState.category}");
                      }
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