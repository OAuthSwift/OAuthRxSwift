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

extension OAuthSwift {
    public typealias ObservableElement = (credential: OAuthSwiftCredential, response: URLResponse?, parameters: Parameters) // see OAuthSwift.TokenSuccessHandler TODO replace with OAuthSwift.TokenSuccess
}

extension OAuth1Swift {

    open func rx_authorize(withCallbackURL callbackURL: URL) -> Observable<ObservableElement> {
        return Observable<ObservableElement>.create{ (observer: AnyObserver<ObservableElement>) -> Disposable in
            let handle = self.authorize(
                withCallbackURL: callbackURL,
                success: { credential, response, parameters in
                    observer.onNext((credential, response, parameters))
                    observer.onCompleted()
                },
                failure: { error in
                    observer.onError(error)
                }
            )
            // else an error has been thrown
            return Disposables.create {
                handle?.cancel()
            }
            }.share()
    }
    
    @nonobjc open func rx_authorize(withCallbackURL callbackURL: String) -> Observable<ObservableElement> {
        return Observable<ObservableElement>.create{ (observer: AnyObserver<ObservableElement>) -> Disposable in
            let handle = self.authorize(
                withCallbackURL: callbackURL,
                success: { credential, response, parameters in
                    observer.onNext((credential, response, parameters))
                    observer.onCompleted()
                },
                failure: { error in
                    observer.onError(error)
                }
            )
            // else an error has been thrown
            return Disposables.create {
                handle?.cancel()
            }
            }.share()
    }

}

extension OAuth2Swift {
    
    open func rx_authorize(withCallbackURL callbackURL: URL, scope: String, state: String, parameters: Parameters = [:], headers: Headers? = nil) -> Observable<ObservableElement> {
        
        return Observable<ObservableElement>.create{ (observer: AnyObserver<ObservableElement>) -> Disposable in
            let handle = self.authorize(
                withCallbackURL: callbackURL,
                scope: scope, state: state, parameters: parameters, headers: headers,
                success: { credential, response, parameters in
                    observer.onNext((credential, response, parameters))
                    observer.onCompleted()
                },
                failure: { error in
                    observer.onError(error)
                }
            )
            // else an error has been thrown
            return Disposables.create {
                handle?.cancel()
            }
            }.share()
    }

    @nonobjc open func rx_authorize(withCallbackURL callbackURL: String, scope: String, state: String, parameters: Parameters = [:], headers: Headers? = nil) -> Observable<ObservableElement> {
        
        return Observable<ObservableElement>.create{ (observer: AnyObserver<ObservableElement>) -> Disposable in
            let handle = self.authorize(
                withCallbackURL: callbackURL,
                scope: scope, state: state, parameters: parameters, headers: headers,
                success: { credential, response, parameters in
                    observer.onNext((credential, response, parameters))
                    observer.onCompleted()
                },
                failure: { error in
                    observer.onError(error)
                }
            )
            // else an error has been thrown
            return Disposables.create {
                handle?.cancel()
            }
            }.share()
    }

}
