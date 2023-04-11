//
//  ViewController.swift
//  Timofey's Challenge
//
//  Created by nikita on 10.04.2023.
//

import UIKit

class ViewController: UIViewController {
    
    var redView: UIView!
    var yellowView: UIView!
    var greenView: UIView!
    
    var headingOffset = 0.0
    
    let scenes = UIApplication.shared.connectedScenes
    
    /*  switch windowScene?.interfaceOrientation {
     case .portrait:
     headingOffset = 0.0
     print("Reporting orientation as portrait")
     case .portraitUpsideDown:
     headingOffset = 180.0
     print("Reporting orientation as portraitUpsideDown")
     case .landscapeLeft:
     headingOffset = -90.0
     print("Reporting orientation as landscapeLeft")
     case .landscapeRight:
     headingOffset = 90.0
     print("Reporting orientation as landscapeRight")
     default:
     headingOffset = 0.0
     print("Reporting orientation as default")
     }
     */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        redView = UIView()
        redView.backgroundColor = .red
        view.addSubview(redView)
        
        yellowView = UIView()
        yellowView.backgroundColor = .yellow
        view.addSubview(yellowView)
        
        greenView = UIView()
        greenView.backgroundColor = .green
        view.addSubview(greenView)
        
        redView.translatesAutoresizingMaskIntoConstraints = false
        yellowView.translatesAutoresizingMaskIntoConstraints = false
        greenView.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            
            redView.topAnchor.constraint(equalTo: view.topAnchor, constant: 180),
            redView.widthAnchor.constraint(equalToConstant: 180),
            redView.heightAnchor.constraint(equalToConstant: 180),
            redView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            yellowView.topAnchor.constraint(equalTo: redView.bottomAnchor, constant: 25),
            yellowView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            yellowView.widthAnchor.constraint(equalTo: redView.widthAnchor),
            yellowView.heightAnchor.constraint(equalTo: redView.heightAnchor),
            
            greenView.topAnchor.constraint(equalTo: yellowView.bottomAnchor, constant: 25),
            greenView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            greenView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -80),
            greenView.widthAnchor.constraint(equalTo: redView.widthAnchor),
            greenView.heightAnchor.constraint(equalTo: redView.heightAnchor)
            
        ])
        
    }
    
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        let windowScene = scenes.first as? UIWindowScene
        
        
        switch windowScene?.interfaceOrientation {
        case .portrait:
            deleteConstraints(width: 180)
        case .landscapeLeft:
            deleteConstraints(width: 600)
        case .landscapeRight:
            deleteConstraints(width: 50)
        default:
            deleteConstraints(width: 180)
        }
        
    }
    
    
    func deleteConstraints(width: CGFloat) {
        redView.removeConstraints(redView.constraints)
        yellowView.removeConstraints(yellowView.constraints)
        greenView.removeConstraints(greenView.constraints)
        NSLayoutConstraint.activate([
        redView.topAnchor.constraint(equalTo: view.topAnchor, constant: 180),
        redView.widthAnchor.constraint(equalToConstant: width),
        redView.heightAnchor.constraint(equalToConstant: 180),
        redView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        
        yellowView.topAnchor.constraint(equalTo: redView.bottomAnchor, constant: 25),
        yellowView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        yellowView.widthAnchor.constraint(equalTo: redView.widthAnchor),
        yellowView.heightAnchor.constraint(equalTo: redView.heightAnchor),
        
        greenView.topAnchor.constraint(equalTo: yellowView.bottomAnchor, constant: 25),
        greenView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        greenView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -80),
        greenView.widthAnchor.constraint(equalTo: redView.widthAnchor),
        greenView.heightAnchor.constraint(equalTo: redView.heightAnchor)
        ])
    }
}


