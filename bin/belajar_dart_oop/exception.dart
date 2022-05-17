class ValidationException implements Exception {
  String message;
  ValidationException(this.message);
}

class Validation {

  static void validate(String username, String password){
    if(username == ""){
      throw ValidationException("Username is blank");
    } else if(password == ""){
      throw ValidationException("Password is blank");
    } else if(username != 'tio' || password != 'tio'){
      throw Exception('Login failed');
    }
    // valid
  }

}

void main(){

  try{
    Validation.validate("tio", "g");
  } on ValidationException catch (exception, stackTrace) {
    print('Validation Error : ${exception.message}');
    print('Stack Trace : ${stackTrace.toString()}');
  } on Exception catch(exception, stackTrace) {
    print('Error : ${exception.toString()}');
    print('Stack Trace : ${stackTrace.toString()}');
  } finally {
    print('Finally');
  }

  try{
    Validation.validate("tio", "tio");
  } catch(exception) {
    print('Error : ${exception.toString()}');
  } finally {
    print('Finally');
  }

  print('Selesai');
}