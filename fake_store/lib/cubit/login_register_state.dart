part of 'login_register_cubit.dart';

// ignore: must_be_immutable
class LoginRegisterState {
  int? id;

  LoginRegisterState(
      { this.id,
      });
  LoginRegisterState copyWith({
    int? id,
  }) {
    return LoginRegisterState(
      id: id ?? this.id,
      
    );
  }

  // ignore: override_on_non_overriding_member
  @override
  List<Object?> get props =>
      [id];

  @override
  String toString() {
    return 'DatesState(id: $id,)';
  }
}
