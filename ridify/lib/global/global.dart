import 'package:firebase_auth/firebase_auth.dart';
import 'package:ridify/models/directionsDetails.dart';
import 'package:ridify/models/userModels.dart';

final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

User? currentUser;

UserModel? userModelCurrentInfo;
DirectionsDetails? tripDirectionDetailsInfo;
String userDropoffAddress="";

String driverCarDetails="";
String driverName="";
String driverPhone="";
double countRatingStars=0.0;
String titleStarsRating="";

String driverRatings="";


List driversList=[];
String cloudMessagingServerToken="key=AAAA0z1x6Bc:APA91bFTGAenxRTbpdR1cADTQbDY67R0hZcjNSpqEj9YQ8qLO4XlJqzDKB0YBJZxnGAa243CJpXzsgnsc4XgbMlMNxr7t8sLFXVPxyC0Y1EgEkGZW4Ih_jX56ux3FQy_iWjoUcvo2VUc";
