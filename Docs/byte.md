# Byte

The `Byte` type represents a byte.

```swift
public typealias Byte = UInt8
```

## Motivation

`Byte` is clearer than `UInt8` in the context of binary data. Additionally, standardizing the use of an *unsigned* integer avoids burdensome type conversion between projects.