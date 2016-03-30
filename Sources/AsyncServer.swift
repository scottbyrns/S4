public protocol AsyncServer {
    init(port: Int) throws
    var port: Int { get }
    func serve(responder: AsyncResponder) throws
}
