import 'Users.dart';

List <Users> data = [];

int getNbOfIdentical(String type){
  int i=0;
  for(int j = 0 ;j<data.length;j++){
    if(data[j].blood == type) {
      i++;
    }
  }
  return i;
}
