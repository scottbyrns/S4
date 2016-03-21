public struct Request: Message {
    public var method: Method
    public var uri: URI
    public var version: Version
    public var headers: Headers
    public var body: Body
    public var storage: Storage

    public init(method: Method, uri: URI, version: Version, headers: Headers, body: Body, storage: Storage) {
        self.method = method
        self.uri = uri
        self.version = version
        self.headers = headers
        self.body = body
        self.storage = storage
    }
}