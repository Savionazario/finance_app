import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';

import '../cubits/selectTransactionCategory/select_transaction_category_cubit.dart';
import '../cubits/selectTransactionCategory/select_transaction_category_state.dart';

class CategoriesListWidget extends StatefulWidget {
  final List categories;
  const CategoriesListWidget({Key? key, required this.categories}) : super(key: key);

  @override
  _CategoriesListWidgetState createState() => _CategoriesListWidgetState();
}

class _CategoriesListWidgetState extends State<CategoriesListWidget> {
  final SelectTransactionCategoryCubit _selectTransactionCategoryCubit =
      GetIt.I.get<SelectTransactionCategoryCubit>();
  
  String initialCategory = "";
  IconData icon = Icons.food_bank_outlined;
  Color categoryColor = Colors.yellow;

  @override
  Widget build(BuildContext context) {
    List categories = widget.categories;
    initialCategory = categories[0];
    Size size = MediaQuery.of(context).size;
    
    return Material(
      color: Colors.transparent,
      child: BlocBuilder<SelectTransactionCategoryCubit,
          SelectTransactionCategoryState>(
        bloc: _selectTransactionCategoryCubit,
        builder: (context, state) {
          if (state is TransactionCategoryInitialState) {
            
            icon = Icons.food_bank_outlined;
            categoryColor = Colors.yellow;

            return InkWell(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  backgroundColor: Colors.white,
                  isScrollControlled: true,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                  ),
                  builder: (context) {
                    return Container(
                      height: 500,
                      width: 200,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: categories.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            switch (categories[index]) {
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
                                categoryColor = Colors.orange;
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
                            print("Lenght: ${categories.length}");
                            return InkWell(
                              onTap: () {
                                _selectTransactionCategoryCubit.selectCategory(
                                    category: categories[index],
                                    indexCategory: index);
                                Navigator.pop(context);
                              },
                              child: Container(
                                // color: Colors.red,
                                height: 70,
                                width: size.width,
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: Colors.grey[300]!,
                                    ),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          child: Container(
                                            height: 38,
                                            width: 38,
                                            color: categoryColor,
                                            child: Icon(
                                              icon,
                                              size: 20,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 20.0),
                                          child: Text(
                                            categories[index],
                                            style: GoogleFonts.nunitoSans(
                                              textStyle: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 40,
                                      width: 40,
                                      child: Checkbox(
                                        value: index == 0 ? true : false,
                                        activeColor: Colors.blue,
                                        shape: CircleBorder(),
                                        onChanged: (value) {
                                          _selectTransactionCategoryCubit
                                              .selectCategory(
                                                  category: categories[index],
                                                  indexCategory: index);
                                          Navigator.pop(context);
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  },
                );
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 12.0, right: 20.0),
                      child: Icon(
                        Icons.category_outlined,
                        weight: 0.01,
                        color: Colors.grey[800]!,
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: Colors.blue,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 10.0,
                                  right: 10.0,
                                  top: 4.0,
                                  bottom: 4.0),
                              child: Text(
                                initialCategory,
                                style: GoogleFonts.nunitoSans(
                                  textStyle: TextStyle(
                                    color: Colors.grey[800],
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),
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
            );
          }

          state = state as TransactionCategorySelectedState;
          int categoryIndex = state.indexCategory;
          String category = state.category;

          return InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                backgroundColor: Colors.white,
                isScrollControlled: true,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                ),
                builder: (context) {
                  return Container(
                    height: 500,
                    width: 200,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: categories.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          switch (categories[index]) {
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
                          print("Lenght: ${categories.length}");
                          return InkWell(
                            onTap: () {
                              _selectTransactionCategoryCubit.selectCategory(
                                category: categories[index],
                                indexCategory: index,
                              );
                              Navigator.pop(context);
                            },
                            child: Container(
                              // color: Colors.red,
                              height: 70,
                              width: size.width,
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Colors.grey[300]!,
                                  ),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(25),
                                        child: Container(
                                          height: 38,
                                          width: 38,
                                          color: categoryColor,
                                          child: Icon(
                                            icon,
                                            size: 22,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20.0),
                                        child: Text(
                                          categories[index],
                                          style: GoogleFonts.nunitoSans(
                                            textStyle: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 40,
                                    width: 40,
                                    child: Checkbox(
                                      value:
                                          categoryIndex == index ? true : false,
                                      activeColor: Colors.blue,
                                      shape: CircleBorder(),
                                      onChanged: (value) {
                                        _selectTransactionCategoryCubit
                                            .selectCategory(
                                                category: categories[index],
                                                indexCategory: index);
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  );
                },
              );
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 12.0, right: 20.0),
                    child: Icon(
                      Icons.category_outlined,
                      weight: 0.01,
                      color: Colors.grey[800]!,
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: Colors.blue,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 10.0, right: 10.0, top: 4.0, bottom: 4.0),
                            child: Text(
                              category,
                              style: GoogleFonts.nunitoSans(
                                textStyle: TextStyle(
                                  color: Colors.grey[800],
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
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
          );
        },
      ),
    );
  }
}
