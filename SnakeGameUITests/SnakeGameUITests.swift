//

import XCTest

final class SnakeGameUITests: XCTestCase {

    var app: XCUIApplication!

       override func setUp() {
           super.setUp()
           app = XCUIApplication()
           app.launch()
       }

    func testGameUI() {
        let upButton = app.buttons["arrow.up"]
        let downButton = app.buttons["arrow.down"]
        let leftButton = app.buttons["arrow.left"]
        let rightButton = app.buttons["arrow.right"]

        XCTAssertTrue(upButton.exists, "Botão para cima não encontrado")
        XCTAssertTrue(downButton.exists, "Botão para baixo não encontrado")
        XCTAssertTrue(leftButton.exists, "Botão para esquerda não encontrado")
        XCTAssertTrue(rightButton.exists, "Botão para direita não encontrado")
    }
    
    func testSnakeVisible() {
        let snakeHead = app.otherElements["snake.head"]
        XCTAssertTrue(snakeHead.exists, "A cabeça da cobra não está visível")
    }

    func testFoodVisible() {
        let food = app.otherElements["food"]
        XCTAssertTrue(food.exists, "A comida não está visível")
    }
}
