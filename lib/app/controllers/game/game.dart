import 'package:flutter/material.dart';

void main(){
  runApp(const Ellias());
}
class Ellias extends StatelessWidget {
  const Ellias({Key? key});
    @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ellias',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 234, 200, 105)),
        useMaterial3: true,
      ),
      home: const ElliasPage(title: 'Ellias'),
    );
  }
}
class ElliasPage extends StatefulWidget {
  const ElliasPage({Key? key, required this.title});

  final String title;

  @override
  State<ElliasPage> createState() => _ElliasPageState();
}
class _ElliasPageState extends State<ElliasPage> {
  bool isTurn = true;
  int aScore = 0;
  int bScore = 0;
  int acount = 0;  // счетчик угаданных слов
  int bcount = 0;  // счетчик угаданных слов

    List<String> endturn = [ // massive will replace here
    '', '', '', '', '', '', '', '', '',
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      //
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Team a',
                            //  style
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            aScore.toString(),
                            //  style
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Team b',
                            // style,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            bScore.toString(),
                            // style,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              GridView.builder( // 10 worlds to win
                shrinkWrap: true,
                itemCount: endturn.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 10,
                ),
                itemBuilder: (BuildContext ctx, int index) {
                  return GestureDetector(
                    onTap: () => _setScore(index), //
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color.fromARGB(255, 10, 1, 1),
                        ),
                      ),
                      child: Center(
                        child: Text(endturn[index]),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _setScore(int index) {
    if (isTurn && endturn[index] == '' ) { // условие если ход  и остались неотгаданные слова и score меньше 10 условия перехода есл таймер вышел
      setState(() {
        acount+=1;
        // тут реакция на две кнопки и разделение на два массива отгаданных и неотгаданных слов

      });
    } else if (!isTurn && endturn[index] == '' ) {
      setState(() {
        bcount += 1;
        // тут реакция на две кнопки и разделение на два массива отгаданных и неотгаданных слов
      });
    }

    if (acount == 10 || bcount == 10) {
      // стоп игра
    } else {
      // второй раунд
    }
    _checkWinner();
  }
  void _checkWinner() {
    if (acount > bcount) {

    } else {

    }
  }
  
}