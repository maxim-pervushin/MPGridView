//
// Created by Maxim Pervushin on 2019-05-01.
//

import UIKit

extension CGRect {

    public init(x: CGFloat, endY: CGFloat, width: CGFloat, height: CGFloat) {
        self.init(x: x, y: endY - height, width: width, height: height)
    }

    public init(endX: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat) {
        self.init(x: endX - width, y: y, width: width, height: height)
    }

    public init(endX: CGFloat, endY: CGFloat, width: CGFloat, height: CGFloat) {
        self.init(x: endX - width, y: endY - height, width: width, height: height)
    }

    var endX: CGFloat {
        return origin.x + width
    }

    var endY: CGFloat {
        return origin.y + height
    }
}