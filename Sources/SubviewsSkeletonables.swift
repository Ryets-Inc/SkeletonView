//  Copyright © 2018 SkeletonView. All rights reserved.

import UIKit

extension UIView {
    @objc var subviewsSkeletonables: [UIView] {
        subviewsToSkeleton.filter { $0.isSkeletonable }
    }

    @objc var subviewsToSkeleton: [UIView] {
        subviews
    }
}

extension UITableView {
    override var subviewsToSkeleton: [UIView] {
		// on `UIViewController'S onViewDidLoad`, the window is still nil.
		// Some developer trying to call `view.showAnimatedSkeleton()`
		// when the request or data is loading which sometimes happens before the ViewDidAppear
		guard window != nil else { return [] }
		return visibleCells + visibleSectionHeaders + visibleSectionFooters
    }
}

extension UITableViewCell {
    override var subviewsToSkeleton: [UIView] {
        contentView.allSubviews.filter { $0.isSkeletonable }
    }
}

extension UITableViewHeaderFooterView {
    override var subviewsToSkeleton: [UIView] {
        contentView.subviews
    }
}

extension UICollectionView {
    override var subviewsToSkeleton: [UIView] {
        subviews.filter { $0.isSkeletonable }
    }
}

extension UICollectionViewCell {
    override var subviewsToSkeleton: [UIView] {
        contentView.allSubviews.filter { $0.isSkeletonable }
    }
}

extension UIStackView {
    override var subviewsToSkeleton: [UIView] {
        arrangedSubviews
    }
}

extension UIView {
    var allSubviews: [UIView] {
        return self.subviews.flatMap { [$0] + $0.allSubviews }
    }
}
