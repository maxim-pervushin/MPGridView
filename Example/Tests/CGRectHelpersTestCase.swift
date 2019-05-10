//
// Created by Maxim Pervushin on 2019-05-01.
//

import XCTest
@testable import MPGridView

class CGRectHelpersTestCase: XCTestCase {

    func test_initXEndY() {
        let rect = CGRect(x: 10, endY: 60, width: 50, height: 50)

        XCTAssertEqual(10, rect.origin.x)
        XCTAssertEqual(10, rect.origin.y)
        XCTAssertEqual(50, rect.width)
        XCTAssertEqual(50, rect.height)
    }

    func test_initEndXY() {
        let rect = CGRect(endX: 60, y: 10, width: 50, height: 50)

        XCTAssertEqual(10.0, rect.origin.x)
        XCTAssertEqual(10.0, rect.origin.y)
        XCTAssertEqual(50.0, rect.width)
        XCTAssertEqual(50.0, rect.height)
    }

    func test_initEndXEndY() {
        let rect = CGRect(endX: 60, endY: 60, width: 50, height: 50)

        XCTAssertEqual(10.0, rect.origin.x)
        XCTAssertEqual(10.0, rect.origin.y)
        XCTAssertEqual(50.0, rect.width)
        XCTAssertEqual(50.0, rect.height)
    }
}
