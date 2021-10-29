import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stock_app/controllers/stockController.dart';
import 'package:intl/intl.dart';
import 'package:stock_app/models/stockModel.dart';

final symbolController = TextEditingController();
final now = new DateTime.now();
String formatter = DateFormat('yMd').format(now);

class Homepage extends StatelessWidget {
  String input;
  final stock = TextEditingController();
  static final DateTime now = DateTime.now();
  static final DateFormat formatter = DateFormat('DD MMM yyyy');
  final String formatted = formatter.format(now);
  StockController stockController = Get.put(StockController());
  StockModel stockModel = Get.put(StockModel());

  @override
  Widget build(BuildContext context) {
    var deviceDimension = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xff160525),
            Color(0xff670741),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text("Rapid Stocks"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                        left: 18,
                        right: 12,
                      ),
                      width: deviceDimension.width * 0.65,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(width: 1, color: Color(0x33ffffff)),
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          stops: [0.1, 1],
                          colors: [
                            Color(0x73ffffff),
                            Color(0x0dffffff),
                          ],
                        ),
                      ),
                      child: Center(
                        child: TextField(
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                          controller: stock,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Search listing name",
                            hintStyle:
                                TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: deviceDimension.width * 0.20,
                      child: Material(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        color: Colors.pink,
                        shadowColor: Colors.pink,
                        child: InkWell(
                          onTap: () {
                            stockController.getData(stock.text);
                          },
                          child: Container(
                            height: 50,
                            child: Center(
                              child: Icon(
                                Icons.search,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Obx(() {
                if (stockController.isLoading.value) {
                  return Container(
                      height: 300,
                      child: Center(child: CircularProgressIndicator()));
                }
                if (stockController.notFound.value) {
                  return Container(
                    height: 300,
                    child: Center(
                      child: Text(
                        "Equity not found",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  );
                }
                if (stockController.isEmpty.value) {
                  return Container(
                    height: 300,
                    child: Center(
                      child: Text(
                        "input field empty",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  );
                }
                return Padding(
                  padding: EdgeInsets.only(
                    left: 20,
                    right: 20,
                  ),
                  child: Container(
                    padding: EdgeInsets.all(20),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(width: 1, color: Color(0x33ffffff)),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        stops: [0.1, 0.9],
                        colors: [
                          Color(0x73ffffff),
                          Color(0x0dffffff),
                        ],
                      ),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          stockController.data.value.globalQuote
                                                  ?.the01Symbol ??
                                              "",
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          formatted,
                                          style: TextStyle(
                                            fontSize: 13,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          stockController.data.value.globalQuote
                                                  ?.the05Price ??
                                              "",
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 3,
                                        ),
                                        Text(
                                          stockController.data.value.globalQuote
                                                  ?.the09Change ??
                                              "",
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Previous close",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color:
                                            Color(0xffffffff).withOpacity(0.6),
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      stockController.data.value.globalQuote
                                              ?.the08PreviousClose ??
                                          "",
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            // Expanded(
                            //   child: Container(
                            //     child: Column(
                            //       crossAxisAlignment: CrossAxisAlignment.start,
                            //       children: [
                            //         Text(
                            //           "Previous close",
                            //           style: TextStyle(
                            //             fontSize: 14,
                            //             color: Color(0xffffffff).withOpacity(0.6),
                            //             fontWeight: FontWeight.w500,
                            //           ),
                            //         ),
                            //         SizedBox(
                            //           height: 5,
                            //         ),
                            //         Text(
                            //           "132.4",
                            //           style: TextStyle(
                            //             fontSize: 18,
                            //             color: Colors.white,
                            //             fontWeight: FontWeight.w700,
                            //           ),
                            //         ),
                            //       ],
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "High",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color:
                                            Color(0xffffffff).withOpacity(0.6),
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      stockController.data.value.globalQuote
                                              ?.the03High ??
                                          "",
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Low",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color:
                                            Color(0xffffffff).withOpacity(0.6),
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      stockController.data.value.globalQuote
                                              ?.the04Low ??
                                          "",
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Last trading day",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color:
                                            Color(0xffffffff).withOpacity(0.6),
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      stockController.data.value.globalQuote
                                              ?.the07LatestTradingDay ??
                                          "",
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Volume",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color:
                                            Color(0xffffffff).withOpacity(0.6),
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      stockController.data.value.globalQuote
                                              ?.the06Volume ??
                                          "",
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 50,
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
