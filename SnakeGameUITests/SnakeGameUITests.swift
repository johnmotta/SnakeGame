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

        XCTAssertTrue(upButton.exists, "Up button not found")
        XCTAssertTrue(downButton.exists, "Down button not found")
        XCTAssertTrue(leftButton.exists, "Left button not found")
        XCTAssertTrue(rightButton.exists, "Right button not found")
    }
    
    func testSnakeVisible() {
        let snakeHead = app.otherElements["snake.head"]
        XCTAssertTrue(snakeHead.exists, "Snake head is not visible")
    }

    func testFoodVisible() {
        let food = app.otherElements["food"]
        XCTAssertTrue(food.exists, "Food is not visible")
    }
}
