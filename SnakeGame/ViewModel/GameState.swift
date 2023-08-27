//

import SwiftUI

class GameState: ObservableObject {
    @Published private(set) var snake: Snake
    @Published private(set) var food: Food
    @Published var animateEat = false
    
    static let gridWidth = 10
    static let gridHeight = 10
    
    init() {
        snake = Snake(head: Position(x: 5, y: 5), body: [], direction: .right)
        food = Food(position: GameState.randomPosition())
    }

    
    private func updateSnakePosition() {
        let newPosition: Position
        switch snake.direction {
        case .up:
            newPosition = Position(x: snake.head.x, y: snake.head.y - 1)
        case .down:
            newPosition = Position(x: snake.head.x, y: snake.head.y + 1)
        case .left:
            newPosition = Position(x: snake.head.x - 1, y: snake.head.y)
        case .right:
            newPosition = Position(x: snake.head.x + 1, y: snake.head.y)
        }
        
        if isCollision(newPosition) {
            snake = Snake(head: Position(x: 5, y: 5), body: [], direction: .right)
            return
        }
        snake.body.insert(snake.head, at: 0)
        
        if newPosition == food.position {
            food = Food(position: GameState.randomPosition())
            withAnimation(.easeInOut(duration: 0.5)) {
                animateEat = true
            }
        } else {
            snake.body.removeLast()
        }
        
        snake.head = newPosition
    }
    
    private func isCollision(_ position: Position) -> Bool {
        return position.x < 0 || position.x >= 10 || position.y < 0 || position.y >= 10 || snake.body.contains(position)
    }
    
    private static func randomPosition() -> Position {
        return Position(x: Int.random(in: 0..<GameState.gridWidth), y: Int.random(in: 0..<GameState.gridHeight))
    }
    
    func tick() {
        updateSnakePosition()
    }
    
    func updateDirection(_ newDirection: Direction) {
        switch (snake.direction, newDirection) {
        case (.up, .down), (.down, .up), (.left, .right), (.right, .left):
            break
        default:
            snake.direction = newDirection
        }
    }
    
    func updateFoodPosition(_ newPosition: Position) {
        food = Food(position: newPosition)
    }

}
