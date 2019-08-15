//
//  Copyright © 2019 An Tran. All rights reserved.
//

import SuperArcCoreUI
import SuperArcCore
import RxSwift
import UIKit

class MoreTableViewController: TableViewController<MoreViewModel>, StoryboardInitiable {

    // MAK: Properties

    // Static

    static var storyboardName = "More"

    enum SegueIdentifier: String {
        case showAbout
    }

    enum Section: Int {
        case about
        case reset

        init(from value: Int) {
            guard let section = Section(rawValue: value) else {
                fatalError("invalid section")
            }

            self = section
        }
    }

    // Private

    private let disposeBag = DisposeBag()

    // MARK: Overrides

    override func setupViews() {
        super.setupViews()

        tableView.rowHeight = Constants.UI.defaultRowHeight
        tableView.tableFooterView = UIView(frame: .zero)
    }

    override func setupBindings() {
        super.setupBindings()

        viewModel.notification
            .bind(to: self.rx.notification)
            .disposed(by: disposeBag)

        viewModel.toogleStateView
            .bind(to: self.rx.toogleStateView)
            .disposed(by: disposeBag)
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch Section(from: indexPath.section) {
        case .about:
            performSegue(withIdentifier: SegueIdentifier.showAbout.rawValue, sender: self)
        case .reset:
            viewModel.reset()
        }
    }
}
