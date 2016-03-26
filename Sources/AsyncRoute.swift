// AsyncRoute.swift
//
// The MIT License (MIT)
//
// Copyright (c) 2015 SwiftX
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

public protocol AsyncRoute: AsyncResponder {
    var path: String { get }
    var actions: [Method: AsyncResponder] { get }
    var fallback: AsyncResponder { get }
}

extension AsyncRoute {
    public var fallback: AsyncResponder {
        return BasicAsyncResponder { _, result in
            result {
                Response(
                    version: Version(major: 1, minor: 1),
                    status: .methodNotAllowed,
                    headers: Headers([:]),
                    body: Drain()
                )
            }
        }
    }

    public func respond(request: Request, result: (Void throws -> Response) -> Void) {
        let action = actions[request.method] ?? fallback
        action.respond(request, result: result)
    }
}