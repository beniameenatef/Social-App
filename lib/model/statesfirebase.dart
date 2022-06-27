import 'package:socialapp/module/Register..dart';

abstract class socialappOnestate{}
class socialappinitialstateOne extends socialappOnestate{}
class sociallodingstate extends socialappOnestate{}
class socialsuccesstate extends socialappOnestate{}
class socialerrorsstate extends socialappOnestate
{
  final String error;
  socialerrorsstate(this.error);
}


class SocialRegisterLoadingState extends socialappOnestate{}
class SocialRegisterSuccessState extends socialappOnestate{}
class SocialRegisterErrorState extends socialappOnestate
{
  final String error;
  SocialRegisterErrorState(this.error);
}


class SocialCreateAccountUserLoadingState extends socialappOnestate{}
class SocialCreateAccountUserSuccessState extends socialappOnestate{}
class SocialCreateAccountUserErrorState extends socialappOnestate
{
  final String error;
  SocialCreateAccountUserErrorState(this.error);
}

class SocialLogInLoadingState extends socialappOnestate{}
class SocialLogInSuccessState extends socialappOnestate{
  final String uid;

  SocialLogInSuccessState(this.uid);
}
class SocialLogInErrorState extends socialappOnestate {
  final String error;
  SocialLogInErrorState(this.error);
}


// class socialgetuserlodingstate extends socialsignstate{}
// class socialgetusersuccesstate extends socialsignstate{}
// class socialgetusererrorsstate extends socialsignstate
// {
//   final String error;
//   socialgetusererrorsstate(this.error);
// }




// binding.signOut.setOnClickListener {
// FirebaseAuth.getInstance().signOut()
// System.exit(0)
// }