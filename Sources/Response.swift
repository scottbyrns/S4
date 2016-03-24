public struct Response: Message {
    public var version: Version
    public var status: Status
    public var headers: Headers
    public var body: Stream
    public var storage: Storage = [:]

    public init(version: Version, status: Status, headers: Headers, body: Stream) {
        self.version = version
        self.status = status
        self.headers = headers
        self.body = body
    }
}