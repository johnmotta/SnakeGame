

@testable import SnakeGame
import XCTest

class SnakeGameTests: XCTestCase {

    func testInitialState() {
        let gameState = GameState()
        // Testa se a cobra começa com tamanho 0
        XCTAssertEqual(gameState.snake.body.count, 0)
        // Testa se a comida é gerada em uma posição válida
        XCTAssertTrue(gameState.food.position.x >= 0 && gameState.food.position.x < GameState.gridWidth)
        XCTAssertTrue(gameState.food.position.y >= 0 && gameState.food.position.y < GameState.gridHeight)
    }

    func testSnakeMovement() {
        let gameState = GameState()

        let initialPosition = gameState.snake.head
        gameState.updateDirection(.right)
        gameState.tick()

        // Testa se a cobra se moveu para a direita
        XCTAssertEqual(gameState.snake.head, Position(x: initialPosition.x + 1, y: initialPosition.y))
    }


    func testSnakeGrow() {
        let gameState = GameState()

        // Coloca a comida diretamente na frente da cobra
        let initialPosition = gameState.snake.head
        gameState.updateFoodPosition(Position(x: initialPosition.x + 1, y: initialPosition.y))

        let initialLength = gameState.snake.body.count
        gameState.updateDirection(.right)
        gameState.tick()

        XCTAssertEqual(gameState.snake.body.count, initialLength + 1)
    }
    
    func testCollisionWithBorder() {
        let gameState = GameState()

        // Move a cobra até a borda
        for _ in 0..<GameState.gridWidth - 1 {
            gameState.updateDirection(.right)
            gameState.tick()
        }

        let initialLength = gameState.snake.body.count

        // Tenta mover a cobra além da borda
        gameState.updateDirection(.right)
        gameState.tick()

        // Verifica se a cobra foi reiniciada
        XCTAssertEqual(gameState.snake.head, Position(x: 5, y: 5))
        XCTAssertEqual(gameState.snake.body.count, initialLength)
    }

    func testCollisionWithBorders() {
        let gameState = GameState()

        // Mova a cobra para a borda direita
        while gameState.snake.head.x < GameState.gridWidth - 1 {
            gameState.updateDirection(.right)
            gameState.tick()
        }

        let initialHeadPosition = gameState.snake.head

        // Mova a cobra mais um passo para a direita para forçar a colisão com a borda
        gameState.updateDirection(.right)
        gameState.tick()

        // Verifica se a cobra colidiu com a borda e foi reiniciada
        XCTAssertNotEqual(gameState.snake.head, initialHeadPosition, "A cobra não foi reiniciada após colidir com a borda")
        XCTAssertEqual(gameState.snake.body.count, 0, "A cobra deve ter o tamanho inicial após reiniciar")
    }
}
