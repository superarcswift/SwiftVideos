//
//  Copyright © 2019 An Tran. All rights reserved.
//

import SuperArcCore
import RxSwift
import UIKit

open class TableViewController: UITableViewController, CommonViewControllerProtocol {

    // MARK: Properties

    // Public

    public var context: ViewControllerContextProtocol!
    public var storedViewModel: ViewModel!

    // IBInspectable

    @IBInspectable public var hasRightCloseButton = false
    @IBInspectable public var hasLeftCloseButton = false
    @IBInspectable public var prefersLargeTitles = false
    
    // Private

    private let disposeBag = DisposeBag()

    // MARK: Lifecycles

    open override func viewDidLoad() {
        super.viewDidLoad()
        commonViewDidLoad()
    }

    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        commonViewWillAppear()
    }

    @objc open func close() {
        dismiss(animated: true, completion: nil)
    }

    // MARK: Setup

    open func setupViewModel() -> ViewModel! {
        return nil
    }

    open func setupViews() {}

    open func setupBindings() {}

    open func loadData() {}
}
