public struct Response: Message {
    public var version: Version
    public var status: Status
    public var headers: Headers
    public var body: Body
    public var storage: Storage

    public init(version: Version, status: Status, headers: Headers, body: Body, storage: Storage) {
        self.version = version
        self.status = status
        self.headers = headers
        self.body = body
        self.storage = storage
    }
}