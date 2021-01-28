//
//  OAuthRxSwift.swift
//  OAuthRxSwift
//
//  Created by phimage on 16/10/16.
//  Copyright © 2016 phimage. All rights reserved.
//

import Foundation
import OAuthSwift
import RxSwift


extension Reactive where Base == OAuth1Swift {
  public func authorize(withCallbackURL url: URLConvertible, headers: OAuthSwift.Headers? = nil) -> Observable<OAuthSwift.TokenSuccess> {
    Observable.create { (observer: AnyObserver<OAuthSwift.TokenSuccess>) in
      let requestHandle = self.base.authorize(withCallbackURL: url, headers: headers) { result in
        observer.on(result.asEvent)
        observer.on(.completed)
      }
      return Disposables.create {
        requestHandle?.cancel()
      }
    }
  }
}

extension Reactive where Base == OAuth2Swift {
  public func authorize(withCallbackURL callbackURL: URLConvertible?, scope: String, state: String, parameters: OAuth2Swift.Parameters = [:], headers: OAuthSwift.Headers? = nil) -> Observable<OAuthSwift.TokenSuccess> {
    Observable.create { (observer: AnyObserver<OAuthSwift.TokenSuccess>) in
      let requestHandle = self.base.authorize(withCallbackURL: callbackURL, scope: scope, state: state, parameters: parameters, headers: headers) { result in
        observer.on(result.asEvent)
        observer.on(.completed)
      }
      return Disposables.create {
        requestHandle?.cancel()
      }
    }
  }
}

extension Result {
  var asEvent: Event<Success> {
    switch self {
      case let .success(element):
        return .next(element)
      case let .failure(error):
        return .error(error)
    }
  }
}
