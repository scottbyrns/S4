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
        let sender = Body.sender { stream in
            try stream.send(self.data)
        }

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

        XCTAssert(data == bodyForBuffer.buffer, "Garbled buffer bytes")

        bodyForReceiver.forceReopenDrain()
        let receiverDrain = Drain(bodyForReceiver.receiver) //must open because of reference semantics
        XCTAssert(data == receiverDrain.data, "Garbled receiver bytes")


        let senderDrain = Drain()
        bodyForReceiver.forceReopenDrain()
        do {
            try bodyForSender.sender(senderDrain)
            XCTAssert(data == senderDrain.data, "Garbled sender bytes")
        } catch {
            XCTFail("Drain threw error \(error)")
        }
    }

}

extension Body {
    mutating func forceReopenDrain() {
        if let drain = self.receiver as? Drain {
            drain.closed = false
        }
    }
}