import XCTest
@testable import S4

class BodyTests: XCTestCase {
    static var allTests : [(String, BodyTests -> () throws -> Void)] {
        return [
           ("testSender", testSender),
           ("testReceiver", testReceiver),
           ("testBuffer", testBuffer),
        ]
    }

    let data: Data = [0x00, 0x01, 0x02, 0x03]

    func testSender() {
        let sender = Body.sender({ stream in
            try stream.send(self.data)
        })

        testBodyProperties(sender)
    }

    func testReceiver() {
        let drain = Drain(self.data)
        let receiver = Body.receiver(drain)

        testBodyProperties(receiver)
    }

    func testBuffer() {
        let buffer = Body.buffer(self.data)

        testBodyProperties(buffer)
    }

    private func testBodyProperties(body: Body) {
        var bodyForBuffer = body
        var bodyForReceiver = body
        var bodyForSender = body

        XCTAssert(data.bytes == bodyForBuffer.buffer.bytes, "Garbled buffer bytes")

        (bodyForReceiver.receiver as? Drain)?.open()
        let receiverDrain = Drain(bodyForReceiver.receiver) //must open because of reference semantics
        XCTAssert(data.bytes == receiverDrain.data.bytes, "Garbled receiver bytes")


        let senderDrain = Drain()
        (bodyForReceiver.receiver as? Drain)?.open() //must open because of reference semantics
        guard let _ = try? bodyForSender.sender(senderDrain) else {
            XCTFail("Drain threw error")
            return
        }
        XCTAssert(data.bytes == senderDrain.data.bytes, "Garbled sender bytes")
    }

}

extension Drain {
    func open() {
        self.closed = false
    }
}