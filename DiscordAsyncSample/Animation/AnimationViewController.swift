//
//  AnimationViewController.swift
//  DiscordAsyncSample
//
//  Created by Yamada Shunya on 2019/09/30.
//  Copyright © 2019 Yamada Shunya. All rights reserved.
//

import UIKit

final class AnimationViewController: UIViewController {
    
    // MARK: - IBOutlet
    
    @IBOutlet private weak var animationLabel: UILabel!
    @IBOutlet private weak var blueView: UIView!
    @IBOutlet private weak var greenView: UIView!
    @IBOutlet private weak var yellowView: UIView!
    @IBOutlet private weak var redView: UIView!
    @IBOutlet private weak var segmentedControl: UISegmentedControl!
    
    // MARK: - Properties
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Animation"
        animationLabel.text = "Animation state"
    }
    
    // MARK: - IBAction
    
    @IBAction private func onTapButton(_ sender: Any) {
        var hideView = UIView()
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            hideView = blueView
        case 1:
            hideView = greenView
        case 2:
            hideView = yellowView
        case 3:
            hideView = redView
        default:
            break
        }
        
        animationLabel.text = "Animation Start"
        print("Animation Start")
        
        UIView.animate(withDuration: 1.0,
                       animations: {
                            hideView.isHidden.toggle()},
                       completion: { result in
                        print("Animation End (in completion block)")
                        self.animationLabel.text = "Animation End (in completion block)"})
        
        animationLabel.text = "Animation End?"
        print("Animation End?")
    }
}

// MARK: - Setup UI

extension AnimationViewController {
}
