public protocol ResponseParser {
    func parse(data: Data) throws -> Response?
}
