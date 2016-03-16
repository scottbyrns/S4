public protocol HTTPRequestSerializer {
    func serialize(request: HTTPRequest, @noescape send: Data throws -> Void) throws
}