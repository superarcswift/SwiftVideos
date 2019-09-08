//
//  Copyright © 2019 An Tran. All rights reserved.
//

import SuperArcCore
import UIKit

open class TabBarController<VM: ViewModel>: UITabBarController, CommonViewControllerProtocol {

    // MARK: Properties

    // Public

    public var viewControllerContext: ViewControllerContext!
    public var viewModel: VM!

    @IBInspectable public var hasRightCloseButton: Bool = false
    @IBInspectable public var hasLeftCloseButton: Bool = false
    @IBInspectable public var prefersLargeTitles: Bool = false

    // Private

    // MARK: Initialization

    init(viewControllerContext: ViewControllerContext) {
        super.init(nibName: nil, bundle: nil)
        self.viewControllerContext = viewControllerContext
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    // MARK: Lifecycles

    override open func viewDidLoad() {
        super.viewDidLoad()
        commonViewDidLoad()

        for child in children {
            child.setViewControllerContext(viewControllerContext)
        }
    }

    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        commonViewWillAppear()
    }

    @objc open func close() {
        dismiss(animated: true, completion: nil)
    }

    // MARK: Setup

    /// Setup ViewController after loading.
    open func setupViews() {
        commonSetupView()

        if hasLeftCloseButton {
            navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .stop, target: self, action: #selector(self.close))
        }

        if hasRightCloseButton {
            navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .stop, target: self, action: #selector(self.close))
        }
    }

    open func setupBindings() {}

    open func loadData() {}
}
