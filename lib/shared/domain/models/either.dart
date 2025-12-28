abstract class Either<L, R> {
  B fold<B>(B Function(L l) left, B Function(R r) right);
}

class Left<L, R> extends Either<L, R> {
  final L value;
  Left(this.value);
  @override
  B fold<B>(B Function(L l) left, B Function(R r) right) => left(value);
}

class Right<L, R> extends Either<L, R> {
  final R value;
  Right(this.value);
  @override
  B fold<B>(B Function(L l) left, B Function(R r) right) => right(value);
}
