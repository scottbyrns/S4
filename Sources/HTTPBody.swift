public enum HTTPBody {
    case BufferBody(Data)
    case StreamBody(Stream)
}