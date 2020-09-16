//
//  TimelinePageViewModel.swift
//  MVVMExample
//
//  Created by tienpm on 9/16/20.
//  Copyright © 2020 Sun*. All rights reserved.
//

import UIKit
import MVVM
import RxCocoa
import RxSwift
import Action

class TimelinePageViewModel: BaseListViewModel {
    
    let alertService: IAlertService = DependencyManager.shared.getService()
    var networkService: NetworkService?
    let rxSearchText = BehaviorRelay<String?>(value: nil)
      
    var tmpBag: DisposeBag?
    var page = 1
    var finishedSearching = false
      
    let rxTille = BehaviorRelay<String>(value: "")
    
    lazy var loadMoreAction: Action<Void, Void> = {
        return Action() { .just(self.loadMore()) }
    }()
    
    override func react() {
        super.react()
        
        guard let model = self.model as? TabbarModel else {
            return
        }
        rxTille.accept(model.title)
        
        
        networkService = DependencyManager.shared.getService()
            
        rxSearchText
            .do(onNext: { text in
                self.tmpBag = nil // stop current load more if any
                self.page = 1 // reset to page 1
                self.finishedSearching = false // reset done state
              
                if !text.isNilOrEmpty {
                    self.rxState.accept(.loadingData)
                }
            }).debounce(.milliseconds(500), scheduler: Scheduler.shared.mainScheduler)
            .subscribe(onNext: { [weak self] text in
                if !text.isNilOrEmpty {
                    self?.getData()
                }
            }) => disposeBag
    }
    
    private func getData() {
        /*
          self.networkService?.search(withKeyword: keyword, page: page)
              .map(prepareSources)
              .subscribe(onSuccess: { [weak self](results) in
                  if isLoadMore {
                      self?.itemsSource.append(results, animated: false)
                  } else {
                      self?.itemsSource.reset([results])
                  }
                  self?.rxState.accept(.normal)
              }, onError: { (error) in
                      
              }) => bag
          */
    }
      
      
      private func loadMore() {
         
      }
      
      private func prepareSources(_ response: FlickrSearchResponse?) -> [FlickrCellViewModel] {
          guard let response = response else {
              return []
          }
          if response.stat == .fail {
              alertService.presentOkayAlert(title: "Error",
                                            message: "\(response.message)\nPlease be sure to provide your own API key from Flickr.")
          }
          
          if response.page >= response.pages {
              finishedSearching = true
          }
          
          return response.photos.toBaseCellViewModels() as [FlickrCellViewModel]
      }
      
}
