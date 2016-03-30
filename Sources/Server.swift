public protocol Server {
    init(port: Int) throws
    var port: Int { get }
    func serve(responder: Responder) throws
}
