import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../const/app_style.dart';
import '../../const/const.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (() async {
          await Navigator.pushNamed(context, '/new_product_screen');
          // ignore: use_build_context_synchronously
          Navigator.pushReplacementNamed(context, '/main_product_screen');
        }),
        child: const Icon(Icons.add),
      ),
      backgroundColor: Color(0xFFE5E5E5),
      bottomNavigationBar: Container(
        margin: EdgeInsets.all(10),
        width: double.infinity,
        height: 73,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                offset: Offset(8, 8),
                blurRadius: 20,
                spreadRadius: 50,
                color: Color(0xff516E95).withOpacity(0.3))
          ],
          borderRadius: BorderRadius.circular(30),
          color: Color(0xffFCFDFF),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.only(left: 20),
              height: 50,
              width: 51,
              decoration: BoxDecoration(
                  boxShadow: [],
                  color: Color(0xff1479FF),
                  shape: BoxShape.circle),
              child: Image.asset(
                'images/icn.png',
                height: 18.28,
                width: 19,
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 20),
              height: 21,
              width: 21,
              decoration: BoxDecoration(shape: BoxShape.circle),
              child: Image.asset(
                'images/user-profile.png',
                height: 7.77,
                width: 7.48,
                color: Color(0xff516E95),
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 35.75,
                      width: 32,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(0, 5),
                                color: Color(0xff1D3A62),
                                blurRadius: 20)
                          ],
                          color: Color(0xffFFFFFF)),
                      child: Image.asset('images/bck.png'),
                    ),
                    Text("Products",style: kBarlow.copyWith(
                      fontWeight: FontWeight.w700,
                      color: Color(0xff152358),
                      fontSize: 22
                    ),),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          height: 40.42,
                          width: 42,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(

                                color: Color(0xff1479FF).withOpacity(.4),
                                offset: Offset(0,8),
                                blurRadius: 10,
                              )
                            ],
                            shape: BoxShape.circle,
                            color: Color(0xffFFFFFF).withOpacity(0.5),
                          ),
                        ),
                        Container(
                          height: 30.8,
                          width: 32,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xffFFFFFF),
                          ),
                          child: Image.asset(
                            'images/bell-icn.png',
                            width: 15.98,
                            height: 17.32,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: 178,
                      width: 307,
                      decoration: BoxDecoration(
                          color: Color(0xffFFFFFF),
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: Image.asset(
                        'images/sergel-intro 1.png',
                        width: 300,
                        height: 171,
                        fit: BoxFit.cover,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: kPadding20,
                ),
                child: Row(
                  children: [
                    Expanded(
                        child: Container(
                      height: 46,
                      width: 290,
                      child: TextField(
                        decoration: InputDecoration(
                          hintStyle: kRalewaySemibold.copyWith(
                              color: Color(0xff516E95), fontSize: 12),
                          prefixIcon: Image.asset(
                            'images/search-icn.png',
                            color: Color(
                              0xff1479FF,
                            ),
                            height: 16,
                            width: 16,
                          ),
                          suffixIcon: Image.asset(
                            'images/icn (2).png',
                            width: 5.61,
                            height: 5.61,
                          ),
                          hintText: "Search here...",
                          fillColor: Color(0xffFFFFFF),
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.white)),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                      ),
                    )),
                    SizedBox(width: 5),
                    Container(
                      height: 46,
                      width: 46,
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(kBorderRadius10),
                          color: Color(0xff1479FF)),
                      child: Image.asset("images/menu.png"),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                height: 400,
                child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.only(left: 10),
                        margin: EdgeInsets.all(10),
                        height: 109,
                        decoration: BoxDecoration(
                            color: Color(0xffFFFFFF),
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          children: [
                            Container(
                              width: 89,
                              height: 89,
                              decoration: BoxDecoration(
                                color: Color(0xffFEB74B),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Image.asset(
                                'images/Untitled-1 1.png',
                                width: 70,
                                height: 43.84,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "Surgel",
                                    style: kBarlow.copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "Esomeprazole",
                                    style: kBarlow.copyWith(
                                        fontSize: 12, color: Color(0xff5C5F8A)),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Image.asset(
                                        'images/icn1.png',
                                        width: 10,
                                        height: 10,
                                      ),
                                      SizedBox(
                                        width: 2,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "9:00  -  11:00 AM",
                                            style: kBarlow.copyWith(
                                              fontSize: 11,
                                              color: Color(0xff5C5F8A),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 50,
                                          ),
                                          Container(
                                            width: 76,
                                            height: 30,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              color: Color(0xff26D7AC),
                                            ),
                                            child: Center(
                                              child: Text(
                                                'Guideline',
                                                style: kBarlow.copyWith(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.bold,
                                                    color: Color(0xffFFFFFF)),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    }),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
