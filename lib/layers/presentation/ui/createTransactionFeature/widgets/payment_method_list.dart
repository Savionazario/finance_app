import 'package:finance_app/layers/presentation/ui/createTransactionFeature/cubits/selectPaymentMethod/select_payment_method_cubit.dart';
import 'package:finance_app/layers/presentation/ui/createTransactionFeature/cubits/selectPaymentMethod/select_payment_method_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentMethodList extends StatefulWidget {
  const PaymentMethodList({Key? key}) : super(key: key);

  @override
  _PaymentMethodListState createState() => _PaymentMethodListState();
}

class _PaymentMethodListState extends State<PaymentMethodList> {
  final SelectPaymentMethodCubit _selectPaymentMethodCubit =
      GetIt.I.get<SelectPaymentMethodCubit>();
  List<String> paymentMethods = [
    "Cartão de débito",
    "Cartão de crédito",
    "Pix",
  ];
  String initialPaymentMethod = "";
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Material(
      color: Colors.transparent,
      child: BlocBuilder<SelectPaymentMethodCubit, SelectPaymentMethodState>(
        bloc: _selectPaymentMethodCubit,
        builder: (context, state) {
          if (state is SelectPaymentMethodInitialState) {
            initialPaymentMethod = state.paymentMethod;
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
                          itemCount: paymentMethods.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            print("Lenght: ${paymentMethods.length}");
                            return InkWell(
                              onTap: () {
                                _selectPaymentMethodCubit.selectPaymentMethod(
                                  paymentMethod: paymentMethods[index],
                                  paymentMethodIndex: index,
                                );
                                Navigator.pop(context);
                              },
                              child: Container(
                                // color: Colors.red,
                                height: 60,
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
                                            color: Colors.grey,
                                            child: Icon(
                                              Icons.shopping_bag_outlined,
                                              size: 20,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 20.0),
                                          child: Text(
                                            paymentMethods[index],
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
                                          _selectPaymentMethodCubit
                                              .selectPaymentMethod(
                                            paymentMethod:
                                                paymentMethods[index],
                                            paymentMethodIndex: index,
                                          );
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
                                initialPaymentMethod,
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

          state = state as SelectedPaymentMethodState;
          int paymentMethodIndex = state.paymentMethodIndex;
          String paymentMethod = state.paymentMethod;
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
                        itemCount: paymentMethods.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          print("Lenght: ${paymentMethods.length}");
                          return InkWell(
                            onTap: () {
                              _selectPaymentMethodCubit.selectPaymentMethod(
                                paymentMethod: paymentMethods[index],
                                paymentMethodIndex: index,
                              );
                              Navigator.pop(context);
                            },
                            child: Container(
                              // color: Colors.red,
                              height: 60,
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
                                          color: Colors.grey,
                                          child: Icon(
                                            Icons.shopping_bag_outlined,
                                            size: 20,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20.0),
                                        child: Text(
                                          paymentMethods[index],
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
                                      value: paymentMethodIndex == index
                                          ? true
                                          : false,
                                      activeColor: Colors.blue,
                                      shape: CircleBorder(),
                                      onChanged: (value) {
                                        _selectPaymentMethodCubit
                                            .selectPaymentMethod(
                                          paymentMethod: paymentMethods[index],
                                          paymentMethodIndex: index,
                                        );
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
                              paymentMethod,
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
