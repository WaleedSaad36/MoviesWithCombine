//
//  ProgressDisplayer.swift
//  MarvelTask
//
//  Created by Waleed Saad on 21/10/2022.
//

import UIKit
import Combine
protocol LoadingDisplayerProtocol {
    func showProgress(backgroundColor: UIColor, spinnerColor: UIColor)
    func hideProgress()
}

extension LoadingDisplayerProtocol where Self: BaseViewController {
    
    
    func showProgress(
        backgroundColor: UIColor = UIColor.clear,
        spinnerColor: UIColor = UIColor.yellow
    ) {
        ProgressHUD.colorAnimation = spinnerColor
        ProgressHUD.animationType = .multipleCirclePulse
        ProgressHUD.show()
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.view.isUserInteractionEnabled = false
            self.navigationController?.view.isUserInteractionEnabled = false
        }
    }
    
    func hideProgress() {
        ProgressHUD.dismiss()
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.view.isUserInteractionEnabled = true
            self.navigationController?.view.isUserInteractionEnabled = true
        }
    }
}
