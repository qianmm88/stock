import 'package:grpc/grpc.dart';

class GrpcChannelSingleton {
  ClientChannel channel;
  static final GrpcChannelSingleton _singleton =
      new GrpcChannelSingleton._internal();

  factory GrpcChannelSingleton() => _singleton;

  /// To call service methods, we first need to create a gRPC channel to
  /// communicate with the server. We create this by passing the server address
  /// and port number to ClientChannel()
  GrpcChannelSingleton._internal() {
    channel = ClientChannel(
      "192.168.1.12", // Your IP here, localhost might not work.
      port: 50051,
      options: ChannelOptions(
        //TODO: Change to secure with server certificates
        credentials: ChannelCredentials.insecure(),
        idleTimeout: Duration(minutes: 1),
      ),
    );
  }
}
