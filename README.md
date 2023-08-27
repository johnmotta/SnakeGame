# SnakeGame
This project is a simple implementation of the classic Snake game, developed using Apple's SwiftUI framework.

## Test-Driven Development (TDD)
<img src="https://media.giphy.com/media/v1.Y2lkPTc5MGI3NjExMzg2MmE5YjkyMzliZWNjMTMwMzFjMTEyZWUxNjY4ZmZmM2JiNzljZSZlcD12MV9pbnRlcm5hbF9naWZzX2dpZklkJmN0PWc/143iYnbXmqIko5rfMY/giphy.gif" width="300" height="600" align="right">This project employs the TDD approach for both logic and user interface tests. TDD (Test-Driven Development) is a software development technique that focuses on writing tests before writing the actual code. This ensures that all app features are adequately tested. It makes the development process more efficient and reliable by allowing early identification of issues and reducing the possibility of bugs in the final code.

## Features
The game consists of a 10x10 cell board where the player controls a snake. The objective is to eat apples to grow and gain points. The snake moves continuously in a direction set by the player and cannot collide with the edges of the board or itself.

## Usage
Upon launching the game, the snake starts moving automatically to the right. Use the arrow keys or swipe your finger on the screen to change the snake's direction. Eating an apple increases the snake's length, and the player earns 1 point. The game ends when the snake collides with the wall or itself.

## Installation
To run the Snake Game, follow these steps:
1. Clone this repository to your local machine.
2. Open `SnakeGame.xcodeproj` in Xcode.
3. Press the "Play" button in the upper-left corner of the Xcode window to compile and run the app on the iOS simulator.
