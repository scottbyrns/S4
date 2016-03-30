public protocol RequestSerializer {
    func serialize(request: Request, @noescape send: Data throws -> Void) throws
}
