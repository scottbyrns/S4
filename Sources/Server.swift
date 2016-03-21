public protocol Server {
    var port: Int { get set }
    func serve(responder: Responder) throws
}
