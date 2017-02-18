
protocol Subscriber {

    associatedtype T

    func onSubscribe(s: Subscription)

    func onNext(t: T)

    func onError(e: Error)

    func onComplete()

}
