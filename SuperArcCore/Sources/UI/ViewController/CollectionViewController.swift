//
//  Copyright © 2019 An Tran. All rights reserved.
//

import UIKit

open class CollectionViewController: UICollectionViewController, CommonViewControllerProtocol {

    public var context: ViewControllerContext!
    public var storedViewModel: ViewModel?

    // MARK: Lifecycles

    open override func viewDidLoad() {
        super.viewDidLoad()
        commonViewDidLoad()
    }

    // MARK: Setup

    open func setupViewModel() -> ViewModel! {
        return nil
    }

    open func setupViews() {}

    open func setupBindings() {}

    open func loadData() {}
    
}
