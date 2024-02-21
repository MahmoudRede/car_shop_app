abstract class AppStates {}

class InitialStates extends AppStates {}

// Sign up states
class SignUpWithFirebaseLoadingState extends AppStates {}

class SignUpWithFirebaseSuccessState extends AppStates {}

class SignUpWithFirebaseErrorState extends AppStates {}

// Sign in states
class SignInWithFirebaseLoadingState extends AppStates {}

class SignInWithFirebaseSuccessState extends AppStates {}

class SignInWithFirebaseErrorState extends AppStates {}

// Get user states
class GetUserLoadingState extends AppStates {}

class GetUserSuccessState extends AppStates {}

class GetUserErrorState extends AppStates {}

class SaveUserLoadingState extends AppStates {}

class SaveUserSuccessState extends AppStates {}

class SaveUserErrorState extends AppStates {}

class SwitchTermsState extends AppStates {}

class IncreaseCartCounterState extends AppStates {}

class DecreaseCartCounterState extends AppStates {}

class SwitchShowItemMoreDetailsState extends AppStates {}

class SignOutSuccessState extends AppStates {}

class DeleteUserLoadingState extends AppStates {}

class DeleteUserSuccessState extends AppStates {}

class DeleteUserErrorState extends AppStates {}

class CreateTableState extends AppStates {}

class CreateDatabaseSuccessState extends AppStates {}

class CreateDatabaseErrorState extends AppStates {}

class InsertDatabaseSuccessState extends AppStates {}

class GetDatabaseSuccessState extends AppStates {}

class DeleteDatabaseSuccessState extends AppStates {}

class UpdateNoteDatabaseState extends AppStates {}

class GetProductsFromApiLoadingState extends AppStates {}

class GetProductsFromApiSuccessState extends AppStates {}

class GetProductsFromApiErrorState extends AppStates {}

class GetSearchLoadingState extends AppStates {}

class GetSearchSuccessState extends AppStates {}

class GetSearchErrorState extends AppStates {}

class GetBestSellProductsFromApiLoadingState extends AppStates {}

class GetBestSellProductsFromApiSuccessState extends AppStates {}

class GetBestSellProductsFromApiErrorState extends AppStates {}

class GetNewSellProductsFromApiLoadingState extends AppStates {}

class GetNewSellProductsFromApiSuccessState extends AppStates {}

class GetNewSellProductsFromApiErrorState extends AppStates {}
