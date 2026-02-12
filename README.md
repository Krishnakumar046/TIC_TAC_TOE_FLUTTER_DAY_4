🕹️ Flutter Day 4 – Tic Tac Toe Application
📌 Task Overview

On Flutter Day 4, the task was to design and develop a Tic Tac Toe game using Flutter.
The goal of this task was to understand state management, widget composition, and game logic in Flutter by implementing a classic two-player game.

🎯 Objectives

Build a 3×3 Tic Tac Toe board

Implement Player 1 (X) and Player 2 (O)

Alternate turns between players

Detect winning conditions

Prevent overwriting already selected cells

Display the winner once a match is completed

🧩 Features Implemented
🎮 Game Board

A 3×3 grid created using Row, Column, and reusable _Cell widgets

Each cell is tappable and updates dynamically using setState

👥 Players

Player 1 uses X

Player 2 uses O

Turns automatically switch after every valid move

🏆 Winner Detection

All 8 winning combinations are checked:

3 horizontal rows

3 vertical columns

2 diagonals

Once a winning pattern is matched:

The game stops

The winner is displayed on the screen

🔒 Game Rules

A cell can only be selected once

No moves are allowed after a winner is declared

🛠️ Technical Concepts Used

StatefulWidget for managing game state

Map<String, String> to store board values

List<List<String>> to define winning patterns

InkWell for tap detection

Conditional rendering for showing player turns and winner

Clean separation of UI and logic

🧠 Learning Outcomes

By completing this task, we learned:

How Flutter handles state updates

How to pass data and callbacks between widgets

How to implement game logic in Flutter

Proper usage of const, final, and runtime widgets

Building interactive UI components

✅ Result

A fully functional Tic Tac Toe game where:

Two players can play turn by turn

The game correctly detects the winner

The UI updates smoothly with every move

<img width="1933" height="1080" alt="image" src="https://github.com/user-attachments/assets/b8d116a2-a481-4327-85ab-fc3220ee77f7" />

