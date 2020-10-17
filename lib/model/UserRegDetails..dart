class UserRegDetails{
  String userID;
  String userRole;
  String fName;
  String lName;
  String phone;
  String extnsn;
  String email;
  String password;
  bool active;
  UserRegDetails(userID, userRole, fName, lName, phone, extnsn, email, password, active){
   this.userID = '';
   this.userRole = userRole;
   this.fName = fName;
   this.lName = lName;
   this.phone = phone;
   this.email = email;
   this.password = password;
   this.active = active;
   this.extnsn = extnsn==null?'':extnsn;
  }

Map toJson(){
return {
      'Id':userID,
      'UserRole':userRole,
      'FirstName':fName,
      'LastName':lName,
      'Telephone':phone,
      'Extention':extnsn,
      'Email':email,
      'Password':password,
      'Active':active
      };
  }
}
