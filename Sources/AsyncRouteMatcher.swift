public protocol AsyncRouteMatcher {
    var routes: [AsyncRoute] { get }
    init(routes: [AsyncRoute])
    func match(request: Request) -> AsyncRoute?
}
