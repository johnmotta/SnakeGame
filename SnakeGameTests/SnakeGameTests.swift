

@testable import SnakeGame
import XCTest

class SnakeGameTests: XCTestCase {

    func testInitialState() {
        let gameState = GameState()
        // Tests if the snake starts with size 0
        XCTAssertEqual(gameState.snake.body.count, 0)
        // Tests if the food is generated in a valid position
        XCTAssertTrue(gameState.food.position.x >= 0 && gameState.food.position.x < GameState.gridWidth)
        XCTAssertTrue(gameState.food.position.y >= 0 && gameState.food.position.y < GameState.gridHeight)
    }

    func testSnakeMovement() {
        let gameState = GameState()

        let initialPosition = gameState.snake.head
        gameState.updateDirection(.right)
        gameState.tick()

        // Tests if the snake moved to the right
        XCTAssertEqual(gameState.snake.head, Position(x: initialPosition.x + 1, y: initialPosition.y))
    }

    func testSnakeGrow() {
        let gameState = GameState()

        // Places the food directly in front of the snake
        let initialPosition = gameState.snake.head
        gameState.updateFoodPosition(Position(x: initialPosition.x + 1, y: initialPosition.y))

        let initialLength = gameState.snake.body.count
        gameState.updateDirection(.right)
        gameState.tick()

        // Tests if the snake grew
        XCTAssertEqual(gameState.snake.body.count, initialLength + 1)
    }
    
    func testCollisionWithBorder() {
        let gameState = GameState()

        // Moves the snake to the edge
        for _ in 0..<GameState.gridWidth - 1 {
            gameState.updateDirection(.right)
            gameState.tick()
        }

        let initialLength = gameState.snake.body.count

        // Tries to move the snake beyond the edge
        gameState.updateDirection(.right)
        gameState.tick()

        // Checks if the snake was reset
        XCTAssertEqual(gameState.snake.head, Position(x: 5, y: 5))
        XCTAssertEqual(gameState.snake.body.count, initialLength)
    }

    func testCollisionWithBorders() {
        let gameState = GameState()

        // Moves the snake to the right edge
        while gameState.snake.head.x < GameState.gridWidth - 1 {
            gameState.updateDirection(.right)
            gameState.tick()
        }

        let initialHeadPosition = gameState.snake.head

        // Moves the snake one more step to the right to force a collision with the edge
        gameState.updateDirection(.right)
        gameState.tick()

        // Checks if the snake collided with the edge and was reset
        XCTAssertNotEqual(gameState.snake.head, initialHeadPosition, "The snake was not reset after colliding with the edge")
        XCTAssertEqual(gameState.snake.body.count, 0, "The snake should have the initial size after resetting")
    }
}
