class Student{
  String firstName;
  String lastName;
  int grade;
  String _status;
  String personImage;
  

  Student(String firstName , String lastName , int grade ,String personImage ){
    this.firstName = firstName;
    this.lastName = lastName;
    this.grade = grade;
    this.personImage = personImage;
  }

  String get getFirstName{
    return "OGR : " + this.firstName;
  }

  void set setFirstName(String value){
    this.firstName = value;
  }

  String get getStatus{
    
    if(this.grade>65){
      _status="Pass";
    }
    else{
      _status = "Fail";
    }
    return _status;
  }
}