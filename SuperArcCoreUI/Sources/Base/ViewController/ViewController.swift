//
//  Copyright © 2019 An Tran. All rights reserved.
//

import SuperArcCore
import RxSwift
import UIKit

/// The base class for all UIViewControllers.
open class ViewController: UIViewController, CommonViewControllerProtocol, StateViewDisplayable {


    // MARK: Properties

    // Public

    public var context: ViewControllerContextProtocol!
    public var storedViewModel: ViewModel!

    // IBInspectable

    @IBInspectable open var hasRightCloseButton: Bool = false
    @IBInspectable open var hasLeftCloseButton: Bool = false
    @IBInspectable open var prefersLargeTitles: Bool = false

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

    /// Setup ViewController after loading.
    open func setupViews() {
        commonSetupView()

        if hasLeftCloseButton {
            navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .stop, target: self, action: #selector(self.close))
        }
    }

    open func setupBindings() {}

    open func loadData() {}
}
