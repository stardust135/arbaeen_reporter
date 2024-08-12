abstract class Success {}

abstract class Failure {}

class ServerFailure extends Failure {}

class ServerSuccess implements Success {}
