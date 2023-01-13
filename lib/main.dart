import 'package:flutter/material.dart';
import 'package:toonflix/home_screen.dart';
import 'package:toonflix/widget/button.dart';
import 'package:toonflix/widget/currency_card.dart';

void main() {
  runApp(App()); //Widget을 넣어줘야한다 -> 레고 블럭 위젯은 디자인 라이브러리 느낌  -> class느낌
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        backgroundColor: const Color(0xFFE7626c),
        textTheme: const TextTheme(
          headline1: TextStyle(
            color: Color(0xFF232B55),
          ),
        ),
        cardColor: const Color(0xFFF4EDDB),
      ),
      home: const HomeScreen(),
    );
  }
}

class App2 extends StatelessWidget {
  //위젯으로 만들기 위해서는 flutter SDK에 있는
  //3개의 core 위제중 하나를 extends해야한다

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        // material 위젯 or cupertion 위젯 리턴 필수 --> 각각 구글과 애플의 디자인 시스템
        home: Scaffold(
      //화면 구성 구조물
      backgroundColor: const Color(0xFF181818),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            //서로를 위 아래에 놓고 싶을
            children: [
              const SizedBox(
                height: 80,
              ),
              Row(
                //서로를 옆에 놓고 싶을 때
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                    const Text('Hey, Selena',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.w800,
                        )),
                    Text("Weclome back",
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.8),
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ))
                  ]),
                ],
              ),
              const SizedBox(
                height: 120,
              ),
              Text("Total Balance",
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white.withOpacity(0.8),
                  )),
              const SizedBox(
                height: 5,
              ),
              Text('\$5 194 382',
                  style: TextStyle(
                    fontSize: 42,
                    color: Colors.white.withOpacity(0.8),
                    fontWeight: FontWeight.w800,
                  )),
              // ignore: prefer_const_constructors
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Button(
                      text: 'Transfer',
                      bgcColor: Color(0xFFFFC107),
                      textColor: Colors.black),
                  Button(
                      text: 'Request',
                      bgcColor: Color(0xFF1F2123),
                      textColor: Colors.white),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Wallets',
                      style: TextStyle(
                        color: const Color(0xFFFFFFFF).withOpacity(0.8),
                        fontSize: 32,
                        fontWeight: FontWeight.w600,
                      )),
                  const Text(
                    'View All',
                    style: TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 155, 153, 153),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const CurrencyCard(
                name: 'Euro',
                code: 'EUR',
                amount: '6 428',
                icon: Icons.euro_rounded,
                bgColor: 0xFF1F2123,
                textColor: 0xFFFFFFFF,
                x: 0,
                y: 0,
              ),
              const CurrencyCard(
                name: 'Bitcoin',
                code: 'BTC',
                amount: '55 622',
                icon: Icons.currency_bitcoin,
                bgColor: 0xFFFFFFFF,
                textColor: 0xFF000000,
                x: 0,
                y: -30,
              ),
              const CurrencyCard(
                name: 'Repee',
                code: 'INR',
                amount: '28 981',
                icon: Icons.currency_rupee_rounded,
                bgColor: 0xFF1F2123,
                textColor: 0xFFFFFFFF,
                x: 0,
                y: -50,
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
