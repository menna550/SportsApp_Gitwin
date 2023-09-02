import 'package:flutter/material.dart';

class Lega extends StatelessWidget {
  const Lega({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          Container(
              height: MediaQuery.of(context).size.height,
              child: Image.asset(
                'assets/Soccer.jpg',
                fit: BoxFit.fill,
              )),
          ListView(
            children: [
              for (int i = 0; i < 30; i++)
                Container(
                  color: Color.fromARGB(179, 199, 197, 196),
                  height: 1000,
                  child: InkWell(
                    onTap: () {},
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/Soccer 06.jpg',
                          height: MediaQuery.of(context).size.height * 0.12,
                        ),

                        //SizedBox(height: 8,),
                        const Text('Lega',
                            style: TextStyle(color: Colors.white)),
                        // SizedBox(height: 8,),
                      ],
                    ),
                  ),
                ),
              const SizedBox(
                width: 8,
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
