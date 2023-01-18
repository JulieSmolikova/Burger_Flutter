import 'package:burger/constants.dart';
import 'package:flutter/material.dart';
import 'package:burger/button.dart';
import 'package:burger/buttons.dart';

enum SML {
  S,
  M,
  L
}

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
                padding: const EdgeInsets.only(left: 20,top: 15,right: 20,bottom: 0),
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
                              height: 50,
                              width: 50,
                              clipBehavior: Clip.hardEdge,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50)
                              ),
                              child: Image.asset('assets/images/avatar.jpg', fit: BoxFit.cover,),
                            ),
                            Container(
                              height: 50,
                              width: 50,
                              child: Image.asset('assets/icons/burger.png'),
                            ),
                          ],
                        ),

                        const SizedBox(height: 42,),

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
                                boxShadow:  [
                                  BoxShadow(
                                    color: Colors.blueGrey.withOpacity(0.6),
                                    blurRadius: 18,
                                    offset: const Offset(2, 2)),
                                  BoxShadow(color: Colors.teal.shade900,
                                      blurRadius: 18,
                                      offset: const Offset(-2, -2))
                                ]
                              ),
                              child: TextField(
                                style: const TextStyle(color: Colors.white70, fontSize: 20),
                                cursorColor: Colors.white70,
                                textAlign: TextAlign.center,
                                textAlignVertical: TextAlignVertical.center,
                                decoration: InputDecoration(
                                  isCollapsed: true,
                                  prefixIcon: const Icon(
                                    Icons.search, color: Colors.white70, size: 30,
                                  ),
                                  hintText: 'Search',
                                  hintStyle: TextStyle(fontSize: 25, fontFamily: 'Literata', color: Colors.white70.withOpacity(0.6), letterSpacing: 7),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.white70.withOpacity(0.6),
                                      width: 2.0),
                                    borderRadius: BorderRadius.circular(20),),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(
                                      color: Colors.white70.withOpacity(0.6),
                                      width: 2.0),)

                                )
                              ),),

                            Container(
                              width: 50,
                              height: 50,
                              child: Image.asset('assets/icons/settings.png'),
                            )
                          ],
                        ),

                        const SizedBox(height: 25,),



                        Container(
                          width: 370,
                          height: 480,
                          color: Colors.transparent,
                            child: //Stack(
                              //children: [
                                PageView.builder(
                                controller: PageController(viewportFraction: 1),
                                scrollDirection: Axis.horizontal,
                                itemCount: burgers.length,
                                itemBuilder: (context, index) {

                                  return Stack (
                                    children: [
                                      Positioned(
                                        top: 45,
                                        child: Container(
                                          width: 250,
                                          height: 250,
                                          child: Image.asset('assets/images/${burgers[index]}.png', fit: BoxFit.contain,))),

                                      Positioned(
                                        left: 20,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Text(names[index], style: TextStyle(fontFamily: 'Lemon', fontSize: 35, color: Colors.white),),
                                            Container(
                                              width: 45,
                                              height: 45,
                                              child: Image.asset('assets/icons/hot.png'),
                                            )],
                                        )),

                                      Positioned( top: 45,
                                        right: -10,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Buttons(
                                                color: selectedButton == SML.S ? KGreenDark.withOpacity(0.7) : KGreenDark.withOpacity(0.9),
                                                onPress: ((){
                                                  setState(() {
                                                    selectedButton = SML.S;
                                                  });
                                                }),
                                                child: const Text('S', style: style4,),),
                                            Buttons(
                                                color: selectedButton == SML.M ? KGreenDark.withOpacity(0.7) : KGreenDark.withOpacity(0.9),
                                                onPress: ((){
                                                  setState(() {
                                                    selectedButton = SML.M;
                                                  });
                                                }),
                                                child: const Text('M', style: style4,),),
                                            Buttons(
                                                color: selectedButton == SML.L ? KGreenDark.withOpacity(0.7) : KGreenDark.withOpacity(0.9),
                                                onPress: ((){
                                                  setState(() {
                                                    selectedButton = SML.L;
                                                  });
                                                }),
                                                child: const Text('L', style: style4,),),
                                          ],
                                        ),
                                      ),

                                      Positioned(
                                        bottom: 150,
                                        left: 10,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              width: 20,
                                              child: Image.asset('assets/icons/fire.png'),),
                                            const SizedBox(width: 2,),
                                            Text(min[index], style: style2),
                                            const SizedBox(width: 45,),
                                            Container(
                                              width: 20,
                                              child: Image.asset('assets/icons/clock.png'),),
                                            const SizedBox(width: 4,),
                                            Text(gram[index], style: style2),
                                            const SizedBox(width: 45,),
                                            Container(
                                              width: 20,
                                              child: Image.asset('assets/icons/scale.png'),),
                                            const SizedBox(width: 3,),
                                            Text(kcal[index], style: style2),


                                          ],
                                        )),

                                      Positioned(
                                          bottom: 0,
                                          left: 2,
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                            Container(
                                              width: 365,
                                              height: 140,
                                              child: Center(
                                                  child: Text(Description[index], style: style3)))
                                            ],),),

                                    ],);}
                                ),

                              //],),

                        ),

                        //Row(),

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
