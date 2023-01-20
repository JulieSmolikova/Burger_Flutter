import 'package:burger/buttonBuy.dart';
import 'package:burger/constants.dart';
import 'package:flutter/material.dart';
import 'package:burger/buttons.dart';
import 'package:burger/add_remove.dart';

enum SML { S, M, L }

class BurgerPage extends StatefulWidget {
  const BurgerPage({Key? key}) : super(key: key);

  @override
  State<BurgerPage> createState() => _BurgerPageState();
}

class _BurgerPageState extends State<BurgerPage> {
  bool isLiked = true;
  dynamic selectedButton;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          resizeToAvoidBottomInset: true,
          body: Center(
            child: Container(
              width: double.maxFinite,
              height: double.maxFinite,
              padding:
                  const EdgeInsets.only(left: 20, top: 0, right: 0, bottom: 0),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      Colors.black,
                      const Color(0xff1f534d),
                      Colors.greenAccent.shade100,
                    ],
                    begin: Alignment.bottomRight,
                    end: Alignment.topLeft,
                    stops: const [0.0, 0.6, 1]),
              ),
              child: SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 52,
                            height: 52,
                            decoration: BoxDecoration(boxShadow: [
                              BoxShadow(
                                  color: Colors.teal.shade800,
                                  blurRadius: 20,
                                  offset: const Offset(1, 1)),
                              BoxShadow(
                                  color: Colors.teal.shade800,
                                  blurRadius: 20,
                                  offset: const Offset(-1, -1))
                            ]),
                            child: ClipOval(
                              child: Container(
                                width: 52,
                                height: 52,
                                color: KGreenDark,
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: SizedBox(
                                      width: 52,
                                      height: 52,
                                      child: ClipOval(
                                          child: Image.asset(
                                              'assets/images/avatar.jpg',
                                              fit: BoxFit.cover)),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            child: Buttons(
                                color: Colors.transparent,
                                onPress: (() {
                                  setState(() {
                                    Navigator.of(context)
                                        .pushNamed('/start_page');
                                  });
                                }),
                                child: Image.asset(
                                  'assets/icons/burger.png',
                                  height: 38,
                                )),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 250,
                            height: 50,
                            decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.blueGrey.withOpacity(0.6),
                                      blurRadius: 18,
                                      offset: const Offset(2, 2)),
                                  BoxShadow(
                                      color: Colors.teal.shade900,
                                      blurRadius: 18,
                                      offset: const Offset(-2, -2))
                                ]),
                            child: TextField(
                                style: const TextStyle(
                                    color: Colors.white70, fontSize: 20),
                                cursorColor: Colors.white70,
                                textAlign: TextAlign.center,
                                textAlignVertical: TextAlignVertical.center,
                                decoration: InputDecoration(
                                    isCollapsed: true,
                                    prefixIcon: const Icon(
                                      Icons.search,
                                      color: Colors.white70,
                                      size: 30,
                                    ),
                                    hintText: 'Search',
                                    hintStyle: TextStyle(
                                        fontSize: 25,
                                        fontFamily: 'Literata',
                                        color: Colors.white70.withOpacity(0.6),
                                        letterSpacing: 7),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color:
                                              Colors.white70.withOpacity(0.6),
                                          width: 2.0),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: BorderSide(
                                          color:
                                              Colors.white70.withOpacity(0.6),
                                          width: 2.0),
                                    ))),
                          ),
                          Container(
                            child: Buttons(
                                color: Colors.transparent,
                                onPress: (() {
                                  setState(() {
                                    isLiked = !isLiked;
                                  });
                                }),
                                child: Image.asset(
                                  'assets/icons/settings.png',
                                  height: 35,
                                )),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: double.maxFinite,
                        height: 480,
                        color: Colors.transparent,
                        child: Stack(
                          children: [
                            PageView.builder(
                                controller: PageController(viewportFraction: 1),
                                scrollDirection: Axis.horizontal,
                                itemCount: burgers.length,
                                itemBuilder: (context, index) {
                                  return Stack(
                                    children: [
                                      Positioned(
                                          top: 45,
                                          child: Container(
                                              width: 250,
                                              height: 250,
                                              child: Image.asset(
                                                'assets/images/${burgers[index]}.png',
                                                fit: BoxFit.contain,
                                              ))),
                                      Positioned(
                                          left: 20,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                names[index],
                                                style: const TextStyle(
                                                    fontFamily: 'Lemon',
                                                    fontSize: 35,
                                                    color: Colors.white),
                                              ),
                                              Container(
                                                width: 45,
                                                height: 45,
                                                child: names[index] ==
                                                            'New York' ||
                                                        names[index] ==
                                                            'Egg Morning'
                                                    ? Image.asset(
                                                        'assets/icons/hot.png')
                                                    : null,
                                                //child: Image.asset('assets/icons/hot.png'),
                                              )
                                            ],
                                          )),
                                      Positioned(
                                          bottom: 150,
                                          left: 10,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                width: 20,
                                                child: Image.asset(
                                                    'assets/icons/fire.png'),
                                              ),
                                              const SizedBox(
                                                width: 2,
                                              ),
                                              Text(min[index], style: style2),
                                              const SizedBox(
                                                width: 50,
                                              ),
                                              Container(
                                                width: 20,
                                                child: Image.asset(
                                                    'assets/icons/clock.png'),
                                              ),
                                              const SizedBox(
                                                width: 4,
                                              ),
                                              Text(gram[index], style: style2),
                                              const SizedBox(
                                                width: 50,
                                              ),
                                              Container(
                                                width: 20,
                                                child: Image.asset(
                                                    'assets/icons/scale.png'),
                                              ),
                                              const SizedBox(
                                                width: 3,
                                              ),
                                              Text(kcal[index], style: style2),
                                            ],
                                          )),
                                      Positioned(
                                        bottom: 0,
                                        left: 2,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                                width: 365,
                                                height: 140,
                                                child: Center(
                                                    child: Text(
                                                        Description[index],
                                                        style: style3)))
                                          ],
                                        ),
                                      ),
                                    ],
                                  );
                                }),
                            Positioned(
                              top: 45,
                              right: 0,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Buttons(
                                    color: selectedButton == SML.S
                                        ? KGreenDark.withOpacity(0.5)
                                        : KGreenDark,
                                    onPress: (() {
                                      setState(() {
                                        selectedButton = SML.S;
                                      });
                                    }),
                                    child: const Text(
                                      'S',
                                      style: style4,
                                    ),
                                  ),
                                  Buttons(
                                    color: selectedButton == SML.M
                                        ? KGreenDark.withOpacity(0.5)
                                        : KGreenDark,
                                    onPress: (() {
                                      setState(() {
                                        selectedButton = SML.M;
                                      });
                                    }),
                                    child: const Text(
                                      'M',
                                      style: style4,
                                    ),
                                  ),
                                  Buttons(
                                    color: selectedButton == SML.L
                                        ? KGreenDark.withOpacity(0.5)
                                        : KGreenDark,
                                    onPress: (() {
                                      setState(() {
                                        selectedButton = SML.L;
                                      });
                                    }),
                                    child: const Text(
                                      'L',
                                      style: style4,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 40),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: const [
                            QuantityButtons(),
                            ButtonBuy(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
