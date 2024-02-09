abstract class AppStates{

}

class InitialStates extends AppStates{}
// Sign up states
class SignUpWithFirebaseLoadingState extends AppStates{}
class SignUpWithFirebaseSuccessState extends AppStates{}
class SignUpWithFirebaseErrorState extends AppStates{}
// Sign in states
class SignInWithFirebaseLoadingState extends AppStates{}
class SignInWithFirebaseSuccessState extends AppStates{}
class SignInWithFirebaseErrorState extends AppStates{}
// Get user states
class GetUserLoadingState extends AppStates{}
class GetUserSuccessState extends AppStates{}
class GetUserErrorState extends AppStates{}

class SwitchShowItemMoreDetailsState extends AppStates{}

class SaveUserLoadingState extends AppStates{}
class SaveUserSuccessState extends AppStates{}
class SaveUserErrorState extends AppStates{}




class SwitchTermsState extends AppStates{}
class IncreaseCartCounterState extends AppStates{}
class DecreaseCartCounterState extends AppStates{}
