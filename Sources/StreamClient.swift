public protocol StreamClient {
    func connect() throws -> Stream
}
