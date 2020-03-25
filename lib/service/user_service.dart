import 'package:stock/common/grpc_channel.dart';
import 'package:stock/rpc/user/users.pbgrpc.dart';

class UserService {
  static Future<GetUsersResponse> getUsers() async {
    var client = UserServiceClient(GrpcChannelSingleton().channel);
    return await client.getUsers(GetUsersRequest());
  }
}
