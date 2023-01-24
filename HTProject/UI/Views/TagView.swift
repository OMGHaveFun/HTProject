//
//  TagView.swift
//  HTProject
//
//  Created by Aliaksandr Yalchyk on 24/01/2023.
//

import UIKit

final class TagView: UIView {
    private enum Constants {
        static let marginY: CGFloat = 4.0
        static let marginX: CGFloat = 4.0
    }

    var model: Model? {
        didSet {
            setupAppearance()
        }
    }

    var tagWasTapped: (() -> Void)?

    private var tagViews: [TagViewItem] = []
    private var tagBackgroundViews: [UIView] = []
    private var rowViews: [UIView] = []
    private var tagViewHeight: CGFloat = 0
    private var rows = 0 {
        didSet {
            invalidateIntrinsicContentSize()
        }
    }

    override func layoutSubviews() {
        defer { rearrangeViews() }
        super.layoutSubviews()
    }

    private func rearrangeViews() {
        let views = tagViews as [UIView] + tagBackgroundViews + rowViews
        views.forEach {
            $0.removeFromSuperview()
        }
        rowViews.removeAll(keepingCapacity: true)

        var currentRow = 0
        var currentRowView: UIView!
        var currentRowTagCount = 0
        var currentRowWidth: CGFloat = 0
        for (index, tagView) in tagViews.enumerated() {
            tagView.frame.size = tagView.intrinsicContentSize
            tagViewHeight = tagView.frame.height

            if currentRowTagCount == 0 || currentRowWidth + tagView.frame.width > frame.width {
                currentRow += 1
                currentRowWidth = 0
                currentRowTagCount = 0
                currentRowView = UIView()
                currentRowView.frame.origin.y = CGFloat(currentRow - 1) * (tagViewHeight + Constants.marginY)

                rowViews.append(currentRowView)
                addSubview(currentRowView)

                tagView.frame.size.width = min(tagView.frame.size.width, frame.width)
            }

            let tagBackgroundView = tagBackgroundViews[index]
            tagBackgroundView.frame.origin = CGPoint(x: currentRowWidth, y: 0)
            tagBackgroundView.frame.size = tagView.bounds.size
            tagBackgroundView.addSubview(tagView)
            currentRowView.addSubview(tagBackgroundView)

            currentRowTagCount += 1
            currentRowWidth += tagView.frame.width + Constants.marginX

            currentRowView.frame.origin.x = 0

            currentRowView.frame.size.width = currentRowWidth
            currentRowView.frame.size.height = max(tagViewHeight, currentRowView.frame.height)
        }
        rows = currentRow

        invalidateIntrinsicContentSize()
    }

    // MARK: - Manage tags
    override var intrinsicContentSize: CGSize {
        var height = CGFloat(rows) * (tagViewHeight + Constants.marginY)
        if rows > 0 {
            height -= Constants.marginY
        }
        return CGSize(width: frame.width, height: height)
    }

    private func createNewTagView(_ title: String) -> TagViewItem {
        let model = TagViewItem.Model(title: title)
        let tagViewItem = TagViewItem()
        tagViewItem.model = model
        return tagViewItem
    }

    @discardableResult
    public func addTags(_ titles: [String]) -> [TagViewItem] {
        var tagViewItems: [TagViewItem] = []

        for title in titles {
            let item = createNewTagView(title)
            tagViewItems.append(item)
        }

        return addTagViews(tagViewItems)
    }

    @discardableResult
    private func addTagView(_ tagViewItem: TagViewItem) -> TagViewItem {
        defer { rearrangeViews() }
        tagViews.append(tagViewItem)
        tagBackgroundViews.append(UIView(frame: tagViewItem.bounds))

        return tagViewItem
    }

    private func addTagViews(_ tagViews: [TagViewItem]) -> [TagViewItem] {
        tagViews.forEach {
            addTagView($0)
        }

        return tagViews
    }

    private func removeAllTags() {
        defer {
            tagViews = []
            tagBackgroundViews = []
            rearrangeViews()
        }

        let views: [UIView] = tagViews + tagBackgroundViews
        views.forEach { $0.removeFromSuperview() }
    }

    private func setupAppearance() {
        guard let model = model else { return }

        removeAllTags()
        addTags(model.titles)
    }
}
