//

import XCTest

final class SnakeGameUITestsLaunchTests: XCTestCase {

    func testLaunch() throws {
         let app = XCUIApplication()
         app.launch()
         XCTAssertTrue(app.wait(for: .runningForeground, timeout: 5))
     }
}
