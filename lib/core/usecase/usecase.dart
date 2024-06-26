import "package:core_module/core/either/either.dart";
import "package:core_module/core/error/failure.dart";

abstract class UseCase<Type, Params> {
  const UseCase();

  Future<Either<Failure, Type>> call(Params params);
}

class NoParams {}
