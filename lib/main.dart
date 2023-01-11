import 'package:flutter/material.dart';
import 'package:toonflix/widget/button.dart';

class Player {
  String? name = "sleeg";

  Player({required this.name});
}

void main() {
  var sleeg = Player(name: "required");

  runApp(App()); //Widget을 넣어줘야한다 -> 레고 블럭 위젯은 디자인 라이브러리 느낌  -> class느낌
}

class App extends StatelessWidget {
  //위젯으로 만들기 위해서는 flutter SDK에 있는
  //3개의 core 위제중 하나를 extends해야한다

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        // material 위젯 or cupertion 위젯 리턴 필수 --> 각각 구글과 애플의 디자인 시스템
        home: Scaffold(
      //화면 구성 구조물
      backgroundColor: const Color(0xFF181818),
      body: Padding(
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
                      text: 'transfer',
                      bgcColor: Color(0xFFFFC107),
                      textColor: Colors.black),
                  Button(
                      text: 'Request',
                      bgcColor: Color(0xFF1F2123),
                      textColor: Colors.white),
                ],
              )
            ],
          )),
    ));
  }
}
