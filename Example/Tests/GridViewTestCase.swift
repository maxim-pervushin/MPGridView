//
// Created by Maxim Pervushin on 2019-05-01.
//

import XCTest
@testable import MPGridView

class GridViewTestCase: XCTestCase {

    func test_leftToRight() {

        let gridView = GridView()
        gridView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        gridView.direction = .leftToRight(columnCount: 2, height: 50)
        gridView.spacing = 5
        gridView.insets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)

        gridView.addArrangedSubview(UIView())
        gridView.addArrangedSubview(UIView())
        gridView.addArrangedSubview(UIView())
        gridView.addArrangedSubview(UIView())

        gridView.layoutIfNeeded()

        XCTAssertEqual(CGRect(x: 10, y: 10, width: 87.5, height: 50), gridView.arrangedSubviews[0].frame)
        XCTAssertEqual(CGRect(x: 102.5, y: 10, width: 87.5, height: 50), gridView.arrangedSubviews[1].frame)
        XCTAssertEqual(CGRect(x: 10, y: 65, width: 87.5, height: 50), gridView.arrangedSubviews[2].frame)
        XCTAssertEqual(CGRect(x: 102.5, y: 65, width: 87.5, height: 50), gridView.arrangedSubviews[3].frame)

        XCTAssertEqual(CGSize(width: 200, height: 125), gridView.intrinsicContentSize)
    }

    func test_leftToRight_zeroSpacingAndInsets() {

        let gridView = GridView()
        gridView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        gridView.direction = .leftToRight(columnCount: 2, height: 50)
        gridView.spacing = 0
        gridView.insets = UIEdgeInsets.zero

        gridView.addArrangedSubview(UIView())
        gridView.addArrangedSubview(UIView())
        gridView.addArrangedSubview(UIView())
        gridView.addArrangedSubview(UIView())

        gridView.layoutIfNeeded()

        XCTAssertEqual(CGRect(x: 0, y: 0, width: 100, height: 50), gridView.arrangedSubviews[0].frame)
        XCTAssertEqual(CGRect(x: 100, y: 0, width: 100, height: 50), gridView.arrangedSubviews[1].frame)
        XCTAssertEqual(CGRect(x: 0, y: 50, width: 100, height: 50), gridView.arrangedSubviews[2].frame)
        XCTAssertEqual(CGRect(x: 100, y: 50, width: 100, height: 50), gridView.arrangedSubviews[3].frame)

        XCTAssertEqual(CGSize(width: 200, height: 100), gridView.intrinsicContentSize)
    }

    func test_rightToLeft() {

        let gridView = GridView()
        gridView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        gridView.direction = .rightToLeft(columnCount: 2, height: 50)
        gridView.spacing = 5
        gridView.insets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)

        gridView.addArrangedSubview(UIView())
        gridView.addArrangedSubview(UIView())
        gridView.addArrangedSubview(UIView())
        gridView.addArrangedSubview(UIView())

        gridView.layoutIfNeeded()

        XCTAssertEqual(CGRect(x: 102.5, y: 10, width: 87.5, height: 50), gridView.arrangedSubviews[0].frame)
        XCTAssertEqual(CGRect(x: 10, y: 10, width: 87.5, height: 50), gridView.arrangedSubviews[1].frame)
        XCTAssertEqual(CGRect(x: 102.5, y: 65, width: 87.5, height: 50), gridView.arrangedSubviews[2].frame)
        XCTAssertEqual(CGRect(x: 10, y: 65, width: 87.5, height: 50), gridView.arrangedSubviews[3].frame)

        XCTAssertEqual(CGSize(width: 200, height: 125), gridView.intrinsicContentSize)
    }

    func test_rightToLeft_zeroSpacingAndInsets() {

        let gridView = GridView()
        gridView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        gridView.direction = .rightToLeft(columnCount: 2, height: 50)
        gridView.spacing = 0
        gridView.insets = UIEdgeInsets.zero

        gridView.addArrangedSubview(UIView())
        gridView.addArrangedSubview(UIView())
        gridView.addArrangedSubview(UIView())
        gridView.addArrangedSubview(UIView())

        gridView.layoutIfNeeded()

        XCTAssertEqual(CGRect(x: 100, y: 0, width: 100, height: 50), gridView.arrangedSubviews[0].frame)
        XCTAssertEqual(CGRect(x: 0, y: 0, width: 100, height: 50), gridView.arrangedSubviews[1].frame)
        XCTAssertEqual(CGRect(x: 100, y: 50, width: 100, height: 50), gridView.arrangedSubviews[2].frame)
        XCTAssertEqual(CGRect(x: 0, y: 50, width: 100, height: 50), gridView.arrangedSubviews[3].frame)

        XCTAssertEqual(CGSize(width: 200, height: 100), gridView.intrinsicContentSize)
    }

    // TODO: Fix this test case
//    func test_rightToLeft_custom1() {
//
//        let gridView = GridView()
//        gridView.frame = CGRect(x: 0, y: 0, width: 296, height: 200)
//        gridView.direction = .rightToLeft(columnCount: 5, height: 50)
//        gridView.spacing = 5
//        gridView.insets = UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2)
//
//        gridView.addArrangedSubview(UIView())
//        gridView.addArrangedSubview(UIView())
//        gridView.addArrangedSubview(UIView())
//        gridView.addArrangedSubview(UIView())
//        gridView.addArrangedSubview(UIView())
//        gridView.addArrangedSubview(UIView())
//
//        gridView.layoutIfNeeded()
//
//        let itemWidth = CGFloat((gridView.frame.size.width - 4 - 20) / 5)
//
//        XCTAssertEqual(CGRect(x: gridView.frame.size.width - 2 - itemWidth, y: 2, width: itemWidth, height: 50), gridView.arrangedSubviews[0].frame)
//    }

    func test_topToBottom() {

        let gridView = GridView()
        gridView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        gridView.direction = .topToBottom(rowCount: 2, width: 50)
        gridView.spacing = 5
        gridView.insets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)

        gridView.addArrangedSubview(UIView())
        gridView.addArrangedSubview(UIView())
        gridView.addArrangedSubview(UIView())
        gridView.addArrangedSubview(UIView())

        gridView.layoutIfNeeded()

        XCTAssertEqual(CGRect(x: 10, y: 10, width: 50, height: 87.5), gridView.arrangedSubviews[0].frame)
        XCTAssertEqual(CGRect(x: 10, y: 102.5, width: 50, height: 87.5), gridView.arrangedSubviews[1].frame)
        XCTAssertEqual(CGRect(x: 65, y: 10, width: 50, height: 87.5), gridView.arrangedSubviews[2].frame)
        XCTAssertEqual(CGRect(x: 65, y: 102.5, width: 50, height: 87.5), gridView.arrangedSubviews[3].frame)

        XCTAssertEqual(CGSize(width: 125, height: 200), gridView.intrinsicContentSize)
    }

    func test_topToBottom_zeroSpacingAndInsets() {

        let gridView = GridView()
        gridView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        gridView.direction = .topToBottom(rowCount: 2, width: 50)
        gridView.spacing = 0
        gridView.insets = UIEdgeInsets.zero

        gridView.addArrangedSubview(UIView())
        gridView.addArrangedSubview(UIView())
        gridView.addArrangedSubview(UIView())
        gridView.addArrangedSubview(UIView())

        gridView.layoutIfNeeded()

        XCTAssertEqual(CGRect(x: 0, y: 0, width: 50, height: 100), gridView.arrangedSubviews[0].frame)
        XCTAssertEqual(CGRect(x: 0, y: 100, width: 50, height: 100), gridView.arrangedSubviews[1].frame)
        XCTAssertEqual(CGRect(x: 50, y: 0, width: 50, height: 100), gridView.arrangedSubviews[2].frame)
        XCTAssertEqual(CGRect(x: 50, y: 100, width: 50, height: 100), gridView.arrangedSubviews[3].frame)

        XCTAssertEqual(CGSize(width: 100, height: 200), gridView.intrinsicContentSize)
    }

    func test_bottomToTop() {

        let gridView = GridView()
        gridView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        gridView.direction = .bottomToTop(rowCount: 2, width: 50)
        gridView.spacing = 5
        gridView.insets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)

        gridView.addArrangedSubview(UIView())
        gridView.addArrangedSubview(UIView())
        gridView.addArrangedSubview(UIView())
        gridView.addArrangedSubview(UIView())

        gridView.layoutIfNeeded()

        XCTAssertEqual(CGRect(x: 10, y: 102.5, width: 50, height: 87.5), gridView.arrangedSubviews[0].frame)
        XCTAssertEqual(CGRect(x: 10, y: 10, width: 50, height: 87.5), gridView.arrangedSubviews[1].frame)
        XCTAssertEqual(CGRect(x: 65, y: 102.5, width: 50, height: 87.5), gridView.arrangedSubviews[2].frame)
        XCTAssertEqual(CGRect(x: 65, y: 10, width: 50, height: 87.5), gridView.arrangedSubviews[3].frame)

        XCTAssertEqual(CGSize(width: 125, height: 200), gridView.intrinsicContentSize)
    }

    func test_bottomToTop_zeroSpacingAndInsets() {

        let gridView = GridView()
        gridView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        gridView.direction = .bottomToTop(rowCount: 2, width: 50)
        gridView.spacing = 0
        gridView.insets = UIEdgeInsets.zero

        gridView.addArrangedSubview(UIView())
        gridView.addArrangedSubview(UIView())
        gridView.addArrangedSubview(UIView())
        gridView.addArrangedSubview(UIView())

        gridView.layoutIfNeeded()

        XCTAssertEqual(CGRect(x: 0, y: 100, width: 50, height: 100), gridView.arrangedSubviews[0].frame)
        XCTAssertEqual(CGRect(x: 0, y: 0, width: 50, height: 100), gridView.arrangedSubviews[1].frame)
        XCTAssertEqual(CGRect(x: 50, y: 100, width: 50, height: 100), gridView.arrangedSubviews[2].frame)
        XCTAssertEqual(CGRect(x: 50, y: 0, width: 50, height: 100), gridView.arrangedSubviews[3].frame)

        XCTAssertEqual(CGSize(width: 100, height: 200), gridView.intrinsicContentSize)
    }
}
