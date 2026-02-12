import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Map<String, dynamic> data = {
    "BOX1": "",
    "BOX2": "",
    "BOX3": "",
    "BOX4": "",
    "BOX5": "",
    "BOX6": "",
    "BOX7": "",
    "BOX8": "",
    "BOX9": "",
  };
  final List<List<String>> winningPatterns = [
    ["BOX1", "BOX2", "BOX3"],
    ["BOX4", "BOX5", "BOX6"],
    ["BOX7", "BOX8", "BOX9"],

    ["BOX1", "BOX4", "BOX7"],
    ["BOX2", "BOX5", "BOX8"],
    ["BOX3", "BOX6", "BOX9"],

    ["BOX1", "BOX5", "BOX9"],
    ["BOX3", "BOX5", "BOX7"],
  ];
  String winner = "";
  String player = "Player 1";

  String currentOption = "X";
  void _handleTap(String boxKey) {
    setState(() {
      if (data[boxKey] == "" && winner == "") {
        data[boxKey] = currentOption;
        player = currentOption == "X" ? "Player 2" : "Player 1";
        _isCheckWinner();
        currentOption = currentOption == "X" ? "O" : "X";
      }
    });
  }

  void _isCheckWinner() {
    for (var pattern in winningPatterns) {
      String first = data[pattern[0]];
      String second = data[pattern[1]];
      String third = data[pattern[2]];
      if (first != "" && first == second && second == third) {
        setState(() {
          currentOption = "X";
          winner = first == "X" ? "Player 1" : "Player 2";
        });
        return;
      }
    }
  }

  void _resetBoxes() {
    setState(
      () => {
        currentOption = "X",
        player = "Player 1",
        winner = "",
        data.updateAll((key, value) => ""),
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80.0,
        elevation: 10.0,
        leading: const Icon(Icons.gamepad, size: 40.0, color: Colors.white),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30.0),
            bottomRight: Radius.circular(30.0),
          ),
        ),
        title: const Text(
          "TIC TAC TOE",
          style: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue, Colors.green],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30.0),
              bottomRight: Radius.circular(30.0),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 180.0),
              child: Column(
                children: [
                  Text(
                    "Start Game",
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 30.0),
                  Text(
                    "Current Player: $player",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 30.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _Cell(data: data, boxKey: "BOX1", handleTap: _handleTap),
                      _Cell(data: data, boxKey: "BOX2", handleTap: _handleTap),
                      _Cell(data: data, boxKey: "BOX3", handleTap: _handleTap),
                    ],
                  ),
                  SizedBox(
                    width: 300.0,
                    child: Divider(color: Colors.black, thickness: 1),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _Cell(data: data, boxKey: "BOX4", handleTap: _handleTap),
                      _Cell(data: data, boxKey: "BOX5", handleTap: _handleTap),
                      _Cell(data: data, boxKey: "BOX6", handleTap: _handleTap),
                    ],
                  ),
                  SizedBox(
                    width: 300.0,
                    child: Divider(color: Colors.black, thickness: 1),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _Cell(data: data, boxKey: "BOX7", handleTap: _handleTap),
                      _Cell(data: data, boxKey: "BOX8", handleTap: _handleTap),
                      _Cell(data: data, boxKey: "BOX9", handleTap: _handleTap),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 50.0),
            SizedBox(
              width: 300.0,
              child: Text(
                winner != "" ? "Winner is $winner" : "",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              width: 300.0,
              height: 60.0,
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  SizedBox(
                    width: 100.0,
                    child: ElevatedButton(
                      onPressed: () => _resetBoxes(),
                      child: Text("Reset"),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Cell extends StatelessWidget {
  const _Cell({
    required this.boxKey,
    required this.handleTap,
    required this.data,
    Key? key,
  }) : super(key: key);

  final String boxKey;
  final Function(String)? handleTap;
  final Map<String, dynamic> data;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      color: Colors.white,
      child: InkWell(
        onTap: () {
          handleTap?.call(boxKey);
        },
        child: SizedBox(
          width: 60,
          height: 60,
          child: Center(
            child: Text(data[boxKey], style: const TextStyle(fontSize: 24)),
          ),
        ),
      ),
    );
  }
}
