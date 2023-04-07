import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:clipboard/clipboard.dart';
import 'package:quotes_app/screens/nextpage.dart';

class editing_page extends StatefulWidget {
  editing_page({Key? key, required this.quote, required this.image})
      : super(key: key);
  String quote;
  Widget image;

  @override
  State<editing_page> createState() => _editing_pageState();
}

class _editing_pageState extends State<editing_page> {
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
  Widget? BG;

  @override
  void initState() {
    super.initState();

    BG = widget.image;

    i1 = Image.asset(
      "assets/images/7.jpg",
      fit: BoxFit.cover,
      width: 400,
      height: 500,
    );
    i2 = Image.asset(
      "assets/images/8.jpg",
      fit: BoxFit.cover,
      width: 400,
      height: 500,
    );
    i3 = Image.asset(
      "assets/images/9.jpg",
      fit: BoxFit.cover,
      width: 400,
      height: 500,
    );
    i4 = Image.asset(
      "assets/images/10.png",
      fit: BoxFit.cover,
      width: 400,
      height: 500,
    );
    i5 = Image.asset(
      "assets/images/11.jpg",
      fit: BoxFit.cover,
      width: 400,
      height: 500,
    );
    i6 = Image.asset(
      "assets/images/12.jpg",
      fit: BoxFit.cover,
      width: 400,
      height: 500,
    );
    i7 = Image.asset(
      "assets/images/13.jpg",
      fit: BoxFit.cover,
      width: 400,
      height: 500,
    );
    i8 = Image.asset(
      "assets/images/14.jpg",
      fit: BoxFit.cover,
      width: 400,
      height: 500,
    );
    i9 = Image.asset(
      "assets/images/15.jpg",
      fit: BoxFit.cover,
      width: 400,
      height: 500,
    );
    i10 = Image.asset(
      "assets/images/16.jpg",
      fit: BoxFit.cover,
      width: 400,
      height: 500,
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
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.menu,
              color: Colors.black,
              size: 30,
            )),
        title: const Text(
          "Edit",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(children: [
        const SizedBox(
          height: 20,
        ),
        Stack(
          alignment: Alignment.center,
          children: [
            Material(
              color: Colors.black,
              child: Opacity(
                opacity: 0.5,
                child: BG,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                widget.quote,
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
        const SizedBox(
          height: 20,
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 60,
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.35),
                      offset: const Offset(0, 5),
                      spreadRadius: 3,
                      blurRadius: 8)
                ]),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            List.generate(
                                10,
                                (index) => BG =
                                    BGProvider(number: Random().nextInt(10)));
                          });
                        },
                        highlightColor: Colors.amber.withOpacity(0.4),
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
                        onTap: () {},
                        highlightColor: Colors.amber.withOpacity(0.4),
                        child: Container(
                          height: 60,
                          child: const Icon(
                            Icons.text_format,
                            color: Colors.blue,
                            size: 34,
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
                          await FlutterClipboard.copy(widget.quote)
                              .then((value) => print('copied'));

                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text("Quote copied.."),
                            backgroundColor: Colors.green,
                          ));
                        },
                        highlightColor: Colors.amber.withOpacity(0.4),
                        child: Container(
                          height: 60,
                          child: const Icon(
                            Icons.file_copy,
                            color: Colors.red,
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
                                builder: (context) => nextpage(
                                    quote: widget.quote, image: widget.image),
                              ));
                        },
                        highlightColor: Colors.amber.withOpacity(0.4),
                        child: Container(
                          height: 60,
                          child: const Icon(
                            Icons.share,
                            color: Colors.blue,
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
                                builder: (context) => nextpage(
                                    quote: widget.quote, image: widget.image),
                              ));
                        },
                        highlightColor: Colors.amber.withOpacity(0.4),
                        child: Container(
                          height: 60,
                          child: const Icon(
                            Icons.download_rounded,
                            color: Colors.green,
                            size: 38,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ]),
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
