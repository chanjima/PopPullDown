//
//  PopView.swift
//  
//
//  Created by chanjima on 2022/12/18.
//

import UIKit

class PopView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.nibInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.nibInit()
    }
}

extension PopView {
    
    private func nibInit() {
        let nib = UINib(nibName: "PopView", bundle: nil)
        guard let view = nib.instantiate(withOwner: self, options: nil).first as? UIView else { return }
        
        view.frame = self.bounds
        self.addSubview(view)
    }
}
