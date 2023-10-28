//
//  Splash.swift
//  GameApp
//
//  Created by muhammed fatih elçi on 23.10.2023.
//

import UIKit
import Alamofire
import SnapKit

class Connect {
    class func isConnected() -> Bool {
        return NetworkReachabilityManager()!.isReachable
    }
}

class SplashVC: UIViewController {
    
    private lazy var logoImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "logo")
        image.alpha = 0.9
        return image
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        animation()
        navigationItem.hidesBackButton = true
    }
    
    func animation() {
        UIView.animate(withDuration: 2, animations: {
            self.logoImage.alpha = 1
        }, completion: { _ in
            self.isNetwork()
        })
    }
    
    func isNetwork() {
        if Connect.isConnected() {
            let viewController = GameTabBarController()
            viewController.modalPresentationStyle = .fullScreen
            self.show(viewController, sender: nil)
        }else{
            print("splash screen hata")
        }
    }
    
    func configure() {
        view.backgroundColor = .white
        view.addSubview(logoImage)
        makeLogo()
    }
}

extension SplashVC {
    func makeLogo() {
        logoImage.snp.makeConstraints { make in
            make
                .centerX
                .equalTo(view.snp.centerX)
            make
                .top
                .equalTo(view.frame.height / 2.5)
            make
                .height
                .equalTo(100)
        }
    }
}
