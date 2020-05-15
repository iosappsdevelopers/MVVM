//
//  SectionHeaderViewViewModel.swift
//  MVVMExample
//
//  Created by pham.minh.tien on 5/15/20.
//  Copyright © 2020 Sun*. All rights reserved.
//

import MVVM
import RxSwift
import RxCocoa
import Action

class SectionHeaderViewViewModel: BaseViewModel {
    
    lazy var addAction: Action<Void, SectionHeaderViewViewModel> = {
        return Action() { .just(self) }
    }()
    
    let rxTitle = BehaviorRelay<String?>(value: nil)
    
    override func react() {
        guard let model = model as? SimpleModel else { return }
        rxTitle.accept(model.title)
    }
}
