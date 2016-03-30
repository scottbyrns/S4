public protocol ResponseSerializer {
    func serialize(response: Response, @noescape send: Data throws -> Void) throws
}
