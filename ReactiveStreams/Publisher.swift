// ref: https://github.com/reactive-streams/reactive-streams-jvm/blob/master/api/src/main/java/org/reactivestreams/Publisher.java

/// A Publisher is a provider of a potentially unbounded number of sequenced elements, publishing them according to
/// the demand received from its Subscriber(s).
/// A Publisher can serve multiple Subscribers subscribed #subscribe(Subscriber) dynamically
/// at various points in time.
///
/// - assosiatedtype <T> the type of element signaled.
protocol Publisher {

    associatedtype T

    /// Request Publisher to start streaming data.
    ///
    /// This is a "factory method" and can be called multiple times, each time starting a new Subscription.
    /// Each Subscription will work for only a single Subscriber.
    /// A Subscriber should only subscribe once to a single Publisher.
    /// If the Publisher rejects the subscription attempt or otherwise fails it will
    /// signal the error via link Subscriber#onError.
    ///
    /// - parameter s: s the link Subscriber that will consume signals from this Publisher
    func subscribe<S: Subscriber>(s: S) where S.T == T

}
