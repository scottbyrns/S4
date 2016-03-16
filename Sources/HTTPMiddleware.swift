public protocol HTTPMiddleware {
    func respond(request: HTTPRequest, chain: HTTPResponder) throws -> HTTPResponse
}