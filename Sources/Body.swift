// Body.swift
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

public enum Body {
    case buffer(Data)
    case stream(Stream)
}

extension Body {
    public var buffer: Data {
        mutating get {
            switch self {
            case .buffer(let data):
                return data
            case .stream(let stream):
                let data = Drain(stream).data
                self = .buffer(data)
                return data
            }
        }

        set(data) {
            self = .buffer(data)
        }
    }

    public var isBuffer: Bool {
        switch self {
        case .buffer: return true
        default: return false
        }
    }

    public var stream: Stream {
        mutating get {
            switch self {
            case .stream(let stream):
                return stream
            case .buffer(let data):
                let stream = Drain(data)
                self = .stream(stream)
                return stream
            }
        }

        set(stream) {
            self = .stream(stream)
        }
    }

    public var isStream: Bool {
        switch self {
        case .stream: return true
        default: return false
        }
    }
}