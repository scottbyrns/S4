public protocol RouteMatcher {
    var routes: [Route] { get }
    init(routes: [Route])
    func match(request: Request) -> Route?
}
