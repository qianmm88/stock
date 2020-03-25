///
//  Generated code. Do not modify.
//  source: users.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;

import 'users.pb.dart' as $0;

export 'users.pb.dart';

class UserServiceClient extends $grpc.Client {
  static final _$getUsers =
      $grpc.ClientMethod<$0.GetUsersRequest, $0.GetUsersResponse>(
          '/UserService/GetUsers',
          ($0.GetUsersRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.GetUsersResponse.fromBuffer(value));

  UserServiceClient($grpc.ClientChannel channel, {$grpc.CallOptions options})
      : super(channel, options: options);

  $grpc.ResponseFuture<$0.GetUsersResponse> getUsers($0.GetUsersRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(_$getUsers, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }
}

abstract class UserServiceBase extends $grpc.Service {
  $core.String get $name => 'UserService';

  UserServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.GetUsersRequest, $0.GetUsersResponse>(
        'GetUsers',
        getUsers_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetUsersRequest.fromBuffer(value),
        ($0.GetUsersResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.GetUsersResponse> getUsers_Pre(
      $grpc.ServiceCall call, $async.Future<$0.GetUsersRequest> request) async {
    return getUsers(call, await request);
  }

  $async.Future<$0.GetUsersResponse> getUsers(
      $grpc.ServiceCall call, $0.GetUsersRequest request);
}
