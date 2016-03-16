public protocol HTTPResponder {
    func respond(request: HTTPRequest) throws -> HTTPResponse
}