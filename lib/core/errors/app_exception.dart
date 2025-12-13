class AppException implements Exception{
  final String message;
  AppException({required this.message});
}
class LocalException extends AppException{
  LocalException({required super.message});
}
class RemoteException extends AppException{
  RemoteException({required String remoteExceptionMessage}):super(message: remoteExceptionMessage);
}