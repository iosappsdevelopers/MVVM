//
//  TransitionExamplesPage.swift
//  MVVMExample
//
//  Created by pham.minh.tien on 5/14/20.
//  Copyright © 2020 Sun*. All rights reserved.
//

import UIKit
import MVVM

class TransitionExamplesPage: BasePage {

    @IBOutlet private weak var flipBtn: UIButton!
    @IBOutlet private weak var zoomBtn: UIButton!
    @IBOutlet private weak var clockBtn: UIButton!
    
    @IBOutlet private weak var topPadding: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }

    override func bindViewAndViewModel() {
        super.bindViewAndViewModel()
        guard let viewModel = viewModel as? TransitionExamplesPageViewModel else {
            return
        }
        viewModel.rxPageTitle ~> self.rx.title => disposeBag
        flipBtn.rx.bind(to: viewModel.flipAction, input: ())
        zoomBtn.rx.bind(to: viewModel.zoomAction, input: ())
        clockBtn.rx.bind(to: viewModel.clockAction, input: ())
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
