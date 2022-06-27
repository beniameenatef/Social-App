
abstract class socialappTwostate{}
class socialappintialstateTwo extends socialappTwostate{}

class newapploadingBusinessstate extends socialappTwostate{}
class newappsucessBusinessstate extends socialappTwostate{}
class newapperrorBusinessstate extends socialappTwostate{
  final String error;
  newapperrorBusinessstate(this.error);
}
class socialBottomNavigationState extends socialappTwostate{}



class socialgetimageprofileloadingstate extends socialappTwostate{}
class socialgetimageprofileimagesucessstate extends socialappTwostate{}
class socialgetimageprofileimageerrorstate extends socialappTwostate{}

class socialgetimagecoverloadingstate extends socialappTwostate{}
class socialgetimagecoverimagesucessstate extends socialappTwostate{}
class socialgetimagecoverimageerrorstate extends socialappTwostate{}



class socialuseruploadprofileloadingstate extends socialappTwostate{}
class socialuseruploadprofilesucessstate extends socialappTwostate{}
class socialuseruploadprofileerrorstate extends socialappTwostate{
  final String? error;
  socialuseruploadprofileerrorstate(this.error);

}


class socialuseruploadcoverloadingstate extends socialappTwostate{}
class socialuseruploadcoversucessstate extends socialappTwostate{}
class socialuseruploadcovererrorstate extends socialappTwostate{
  final String? error;
  socialuseruploadcovererrorstate(this.error);

}

class SocialGetDataToUserLoadingState extends socialappTwostate{}
class SocialGetDataToUserSuccessState extends socialappTwostate{}
class SocialGetDataToUserErrorState extends socialappTwostate{
  final String? error;
  SocialGetDataToUserErrorState(this.error);

}

class SocialUpdateUserLoadingState extends socialappTwostate{}
class SocialUpdateUserSuccessState extends socialappTwostate{}
class SocialUpdateUserErrorState extends socialappTwostate{
  final String? error;
  SocialUpdateUserErrorState(this.error);

}
class SocialGetPostImageLoadingState extends socialappTwostate{}
class SocialGetPostImageSuccessState extends socialappTwostate{}
class SocialGetPostImageErrorState extends socialappTwostate{
  final String? error;
  SocialGetPostImageErrorState(this.error);

}

class SocialRemovePostImageSuccessState extends socialappTwostate{}


class SocialCreatePostImageLoadingState extends socialappTwostate{}
class SocialCreatePostImageSuccessState extends socialappTwostate{}
class SocialCreatePostImageErrorState extends socialappTwostate{
  final String? error;
  SocialCreatePostImageErrorState(this.error);

}
class SocialCreatePostLoadingState extends socialappTwostate{}
class SocialCreatePostSuccessState extends socialappTwostate{}
class SocialCreatePostErrorState extends socialappTwostate{
  final String? error;
  SocialCreatePostErrorState(this.error);

}

class SocialGetPostsLoadingState extends socialappTwostate{}
class SocialGetPostsSuccessState extends socialappTwostate{}
class SocialGetPostsErrorState extends socialappTwostate{
  final String? error;
  SocialGetPostsErrorState(this.error);

}