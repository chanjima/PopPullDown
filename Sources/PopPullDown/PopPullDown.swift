import UIKit

class PopPullDown: UIButton {

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        self.setupDegign()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupDegign()
    }

}

// MARK: - Private

extension PopPullDown {

    private func setupDegign() {
        self.backgroundColor = .lightGray.withAlphaComponent(0.5)
        self.setTitleColor(.label, for: .normal)
        self.layer.cornerRadius = 10
        self.layer.borderColor = UIColor.label.cgColor
        self.layer.borderWidth = 1.0
    }
}
