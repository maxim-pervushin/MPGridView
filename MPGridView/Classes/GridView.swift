//
//  GridView.swift
//  GridView
//
//  Created by Maxim Pervushin on 05/04/2019.
//

import UIKit

public class GridView: UIView {

    public enum Direction {
        case leftToRight(columnCount: Int, height: CGFloat)
        case rightToLeft(columnCount: Int, height: CGFloat)
        case topToBottom(rowCount: Int, width: CGFloat)
        case bottomToTop(rowCount: Int, width: CGFloat)
    }

    public var direction = Direction.leftToRight(columnCount: 1, height: 100) {
        didSet {
            setNeedsLayout()
        }
    }

    public var spacing = CGFloat(0) {
        didSet {
            setNeedsLayout()
        }
    }

    public var insets = UIEdgeInsets.zero {
        didSet {
            setNeedsLayout()
        }
    }

    override public var intrinsicContentSize: CGSize {
        switch direction {
        case .leftToRight(let columnCount, let itemHeight):
            let totalSpacing = (spacing * CGFloat(columnCount - 1))
            let horizontalInsets = insets.left + insets.right

            var startOffset = insets.left
            var topOffset = insets.top
            for (arrangedSubviewIndex, _) in arrangedSubviews.enumerated() {

                let itemWidth = (bounds.width - horizontalInsets - totalSpacing) / CGFloat(columnCount)

                if startOffset + itemWidth > bounds.width {
                    startOffset = insets.left
                    topOffset += itemHeight + spacing
                }

                startOffset += itemWidth

                if arrangedSubviewIndex + 1 < arrangedSubviews.count {
                    startOffset += spacing
                }
            }

            return CGSize(
                    width: frame.width,
                    height: topOffset + itemHeight + insets.bottom
            )

        case .rightToLeft(let columnCount, let itemHeight):
            let totalSpacing = (spacing * CGFloat(columnCount - 1))
            let horizontalInsets = insets.left + insets.right

            var endOffset = bounds.width - insets.right
            var topOffset = insets.top
            for (arrangedSubviewIndex, _) in arrangedSubviews.enumerated() {

                let itemWidth = (bounds.width - horizontalInsets - totalSpacing) / CGFloat(columnCount)

                if endOffset - itemWidth < insets.left {
                    endOffset = bounds.width - insets.right
                    topOffset += itemHeight + spacing
                }

                endOffset -= itemWidth

                if arrangedSubviewIndex + 1 < arrangedSubviews.count {
                    endOffset -= spacing
                }
            }

            return CGSize(
                    width: frame.width,
                    height: topOffset + itemHeight + insets.bottom
            )

        case .topToBottom(let rowCount, let itemWidth):
            let totalSpacing = (spacing * CGFloat(rowCount - 1))
            let verticalInsets = insets.top + insets.bottom

            var startOffset = insets.left
            var topOffset = insets.top
            for (arrangedSubviewIndex, _) in arrangedSubviews.enumerated() {

                let itemHeight = (bounds.height - verticalInsets - totalSpacing) / CGFloat(rowCount)

                if topOffset + itemHeight > bounds.height {
                    topOffset = insets.top
                    startOffset += itemWidth + spacing
                }

                topOffset += itemHeight

                if arrangedSubviewIndex + 1 < arrangedSubviews.count {
                    topOffset += spacing
                }
            }

            return CGSize(
                    width: startOffset + itemWidth + insets.right,
                    height: frame.height
            )

        case .bottomToTop(let rowCount, let itemWidth):
            let totalSpacing = (spacing * CGFloat(rowCount - 1))
            let verticalInsets = insets.top + insets.bottom

            var startOffset = insets.left
            var bottomOffset = bounds.height - insets.bottom
            for (arrangedSubviewIndex, _) in arrangedSubviews.enumerated() {

                let itemHeight = (bounds.height - verticalInsets - totalSpacing) / CGFloat(rowCount)

                if bottomOffset - itemHeight < insets.top {
                    bottomOffset = bounds.height - insets.bottom
                    startOffset += itemWidth + spacing
                }

                bottomOffset -= itemHeight

                if arrangedSubviewIndex + 1 < arrangedSubviews.count {
                    bottomOffset -= spacing
                }
            }

            return CGSize(
                    width: startOffset + itemWidth + insets.right,
                    height: frame.height
            )
        }
    }

    private(set) var arrangedSubviews = [UIView]() {
        didSet {
            self.setNeedsLayout()
        }
    }

    public func addArrangedSubview(_ view: UIView) {
        addSubview(view)
        arrangedSubviews.append(view)
    }

    public func removeArrangedSubview(_ view: UIView) {
        if view.superview == self {
            arrangedSubviews.removeAll(where: { $0 == view })
            view.removeFromSuperview()
        }
    }

    override public func layoutSubviews() {
        super.layoutSubviews()

        switch direction {
        case .leftToRight(let columnCount, let height):
            layoutSubviewsInColumnsLeftToRight(columnCount: columnCount, itemHeight: height)
        case .rightToLeft(let columnCount, let height):
            layoutSubviewsInColumnsRightToLeft(columnCount: columnCount, itemHeight: height)
        case .topToBottom(let rowCount, let width):
            layoutSubviewsInRowsTopToBottom(rowCount: rowCount, itemWidth: width)
        case .bottomToTop(let rowCount, let width):
            layoutSubviewsInRowsBottomToTop(rowCount: rowCount, itemWidth: width)
        }
        invalidateIntrinsicContentSize()
    }

    private func layoutSubviewsInColumnsLeftToRight(columnCount: Int, itemHeight: CGFloat) {

        let totalSpacing = (spacing * CGFloat(columnCount - 1))
        let horizontalInsets = insets.left + insets.right

        var startOffset = insets.left
        var topOffset = insets.top
        for arrangedSubview in arrangedSubviews {

            let itemWidth = (bounds.width - horizontalInsets - totalSpacing) / CGFloat(columnCount)

            if startOffset + itemWidth > bounds.width {
                startOffset = insets.left
                topOffset += itemHeight + spacing
            }

            arrangedSubview.frame = CGRect(
                    x: startOffset,
                    y: topOffset,
                    width: itemWidth,
                    height: itemHeight
            )

            startOffset += itemWidth + spacing
        }
    }

    private func layoutSubviewsInColumnsRightToLeft(columnCount: Int, itemHeight: CGFloat) {
        let totalSpacing = (spacing * CGFloat(columnCount - 1))
        let horizontalInsets = insets.left + insets.right
        let itemWidth = (bounds.width - horizontalInsets - totalSpacing) / CGFloat(columnCount)

        var endOffset = bounds.width - insets.right
        var topOffset = insets.top
        for arrangedSubview in arrangedSubviews {


            if endOffset - itemWidth < insets.left {
                endOffset = bounds.width - insets.right
                topOffset += itemHeight + spacing
            }

            arrangedSubview.frame = CGRect(
                    endX: endOffset,
                    y: topOffset,
                    width: itemWidth,
                    height: itemHeight
            )

            endOffset -= itemWidth + spacing
        }
    }

    private func layoutSubviewsInRowsTopToBottom(rowCount: Int, itemWidth: CGFloat) {

        let totalSpacing = (spacing * CGFloat(rowCount - 1))
        let verticalInsets = insets.top + insets.bottom

        var startOffset = insets.left
        var topOffset = insets.top
        for arrangedSubview in arrangedSubviews {

            let itemHeight = (bounds.height - verticalInsets - totalSpacing) / CGFloat(rowCount)

            if topOffset + itemHeight > bounds.height {
                topOffset = insets.top
                startOffset += itemWidth + spacing
            }

            arrangedSubview.frame = CGRect(
                    x: startOffset,
                    y: topOffset,
                    width: itemWidth,
                    height: itemHeight
            )

            topOffset += itemHeight + spacing
        }
    }

    private func layoutSubviewsInRowsBottomToTop(rowCount: Int, itemWidth: CGFloat) {

        let totalSpacing = (spacing * CGFloat(rowCount - 1))
        let verticalInsets = insets.top + insets.bottom

        var startOffset = insets.left
        var bottomOffset = bounds.height - insets.bottom
        for arrangedSubview in arrangedSubviews {

            let itemHeight = (bounds.height - verticalInsets - totalSpacing) / CGFloat(rowCount)

            if bottomOffset - itemHeight < insets.top {
                bottomOffset = bounds.height - insets.bottom
                startOffset += itemWidth + spacing
            }

            arrangedSubview.frame = CGRect(
                    x: startOffset,
                    endY: bottomOffset,
                    width: itemWidth,
                    height: itemHeight
            )

            bottomOffset -= itemHeight + spacing
        }
    }
}
