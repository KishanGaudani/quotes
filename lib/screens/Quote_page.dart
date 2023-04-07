import 'dart:async';
import 'dart:math';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quotes_app/screens/editing_page.dart';
import 'package:quotes_app/screens/nextpage.dart';

import '../helpers/like_helper.dart';
import '../helpers/quote_api.dart';
import '../models/lines_data.dart';

class Quote_page extends StatefulWidget {
  Quote_page({Key? key, required this.category}) : super(key: key);
  String category;

  @override
  State<Quote_page> createState() => _Quote_pageState();
}

class _Quote_pageState extends State<Quote_page> {
  late Image i1;
  late Image i2;
  late Image i3;
  late Image i4;
  late Image i5;
  late Image i6;
  late Image i7;
  late Image i8;
  late Image i9;
  late Image i10;

  int randomNum = Random().nextInt(8);

  @override
  void initState() {
    super.initState();

    i1 = Image.asset(
      "assets/images/7.jpg",
      fit: BoxFit.cover,
      width: 400,
      height: 385,
    );
    i2 = Image.asset(
      "assets/images/8.jpg",
      fit: BoxFit.cover,
      width: 400,
      height: 385,
    );
    i3 = Image.asset(
      "assets/images/9.jpg",
      fit: BoxFit.cover,
      width: 400,
      height: 385,
    );
    i4 = Image.asset(
      "assets/images/10.png",
      fit: BoxFit.cover,
      width: 400,
      height: 385,
    );
    i5 = Image.asset(
      "assets/images/11.jpg",
      fit: BoxFit.cover,
      width: 400,
      height: 385,
    );
    i6 = Image.asset(
      "assets/images/12.jpg",
      fit: BoxFit.cover,
      width: 400,
      height: 385,
    );
    i7 = Image.asset(
      "assets/images/13.jpg",
      fit: BoxFit.cover,
      width: 400,
      height: 385,
    );
    i8 = Image.asset(
      "assets/images/14.jpg",
      fit: BoxFit.cover,
      width: 400,
      height: 385,
    );
    i9 = Image.asset(
      "assets/images/15.jpg",
      fit: BoxFit.cover,
      width: 400,
      height: 385,
    );
    i10 = Image.asset(
      "assets/images/16.jpg",
      fit: BoxFit.cover,
      width: 400,
      height: 385,
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    precacheImage(i1.image, context);
    precacheImage(i2.image, context);
    precacheImage(i3.image, context);
    precacheImage(i4.image, context);
    precacheImage(i5.image, context);
    precacheImage(i6.image, context);
    precacheImage(i7.image, context);
    precacheImage(i8.image, context);
    precacheImage(i9.image, context);
    precacheImage(i10.image, context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade200,
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.menu,
              color: Colors.black,
              size: 30,
            )),
        title: Text(
          widget.category,
          style:
              const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: CustomScrollView(
          slivers: List.generate(
        20,
        (i) => SliverList(
          delegate: SliverChildListDelegate([
            FutureBuilder(
                future: QuoteAPIHelper.quoteAPIHelper
                    .fetchingUserData(name: "happiness"),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  } else if (snapshot.hasData) {
                    List<QuoteData>? data = snapshot.data as List<QuoteData>?;
                    return ListView.builder(
                      physics: const ScrollPhysics(
                          parent: NeverScrollableScrollPhysics()),
                      shrinkWrap: true,
                      itemCount: data!.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(10),
                          child: Container(
                            width: 400,
                            height: 445,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.withOpacity(0.35),
                                      offset: const Offset(0, 5),
                                      spreadRadius: 3,
                                      blurRadius: 8)
                                ]),
                            child: Column(
                              children: [
                                Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    ClipRRect(
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          topRight: Radius.circular(20),
                                        ),
                                        child: InkWell(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      editing_page(
                                                          quote:
                                                              data[index].quote,
                                                          image: BGProvider(
                                                              number: index)),
                                                ));
                                          },
                                          child: Material(
                                            color: Colors.black,
                                            child: Opacity(
                                                opacity: 0.5,
                                                child:
                                                    BGProvider(number: index)),
                                          ),
                                        )),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15),
                                      child: Text(
                                        data[index].quote,
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.poppins(
                                            textStyle: const TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 16,
                                                color: Colors.white)),
                                      ),
                                    )
                                  ],
                                ),
                                ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Expanded(
                                        child: Material(
                                          color: Colors.transparent,
                                          child: InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        editing_page(
                                                            quote: data[index]
                                                                .quote,
                                                            image: BGProvider(
                                                                number: index)),
                                                  ));
                                            },
                                            highlightColor:
                                                Colors.amber.withOpacity(0.4),
                                            child: Container(
                                              height: 60,
                                              child: const Icon(
                                                Icons.photo_library,
                                                color: Colors.green,
                                                size: 35,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Material(
                                          color: Colors.transparent,
                                          child: InkWell(
                                            onTap: () async {
                                              await FlutterClipboard.copy(
                                                      data[index].quote)
                                                  .then((value) =>
                                                      print('copied'));

                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(const SnackBar(
                                                content: Text("Quote copied.."),
                                                backgroundColor: Colors.green,
                                              ));
                                            },
                                            highlightColor:
                                                Colors.amber.withOpacity(0.4),
                                            child: Container(
                                              height: 60,
                                              child: const Icon(
                                                Icons.file_copy_sharp,
                                                color: Colors.blue,
                                                size: 30,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Material(
                                          color: Colors.transparent,
                                          child: InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        nextpage(
                                                            quote: data[index]
                                                                .quote,
                                                            image: BGProvider(
                                                                number: index)),
                                                  ));
                                            },
                                            highlightColor:
                                                Colors.amber.withOpacity(0.4),
                                            child: Container(
                                              height: 60,
                                              child: const Icon(
                                                Icons.share,
                                                color: Colors.red,
                                                size: 32,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Material(
                                          color: Colors.transparent,
                                          child: InkWell(
                                            onTap: () async {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        nextpage(
                                                            quote: data[index]
                                                                .quote,
                                                            image: BGProvider(
                                                                number: index)),
                                                  ));
                                            },
                                            highlightColor:
                                                Colors.amber.withOpacity(0.4),
                                            child: Container(
                                              height: 60,
                                              child: const Icon(
                                                Icons.download_for_offline,
                                                color: Colors.blue,
                                                size: 38,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Material(
                                          color: Colors.transparent,
                                          child: InkWell(
                                            onTap: () {
                                              LikeDBHelper.likeDBHelper
                                                  .insertData(
                                                      quote: data[index].quote,
                                                      BGImage: index);

                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(const SnackBar(
                                                content:
                                                    Text("Added into Like.."),
                                                backgroundColor: Colors.green,
                                              ));
                                            },
                                            highlightColor:
                                                Colors.amber.withOpacity(0.4),
                                            child: Container(
                                              height: 60,
                                              child: const Icon(
                                                Icons
                                                    .star_border_purple500_sharp,
                                                color: Colors.green,
                                                size: 33,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }
                  if (i == 19) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return Container();
                })
          ]),
        ),
      )),
    );
  }

  Widget BGProvider({required int number}) {
    if (number == 0) {
      return i1;
    } else if (number == 1) {
      return i2;
    } else if (number == 2) {
      return i3;
    } else if (number == 3) {
      return i4;
    } else if (number == 4) {
      return i5;
    } else if (number == 5) {
      return i6;
    } else if (number == 6) {
      return i7;
    } else if (number == 7) {
      return i8;
    } else if (number == 8) {
      return i9;
    }
    return i10;
  }
}
