public protocol StreamServer {
    func accept() throws -> Stream
}