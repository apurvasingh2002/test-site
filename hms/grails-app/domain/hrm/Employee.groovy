package hrm

import Enums.EmployeeStatus
import um.User

class Employee {
    String employeeId
    String firstName
    String lastName
    String middleName
    String nationality
    Date dateOfBirth
    String maritalStatus
    String gender
    String country
    String permanentAddress
    String temporaryAddress
    String homePhone
    String workPhone
    String mobile
    String email
    String alterEmail
    String filename //for cv
    EmployeeStatus status
    Employee updatedBy
    Departments departments
    Designation designation
    Employee supervisor
    Date effectiveDate //hired date
    Date joinDate
    Date terminatedDate



    static hasMany = [salary:Payroll,leave:LeaveSetting]

    static belongsTo = [user:User]


    def getFullName() {
        return firstName.capitalize()+""+(middleName?(" "+middleName.capitalize()+" "):" ")+""+lastName.capitalize()
    }

    static constraints = {


        email(email: true)
        mobile(matches: "[0-9]+")
        workPhone(matches:"[0-9]+",blank:true,nullable: true)
        homePhone(matches: "[0-9]+",blank:true,nullable: true)
        updatedBy(blank:true,nullable: true)
        maritalStatus(inList: ["SINGLE", "MARRIED", "DIVORCED","WIDOWED"],blank:false,nullable: false)
        supervisor(blank:true,nullable: true)
        middleName(blank:true,nullable: true)
        terminatedDate(blank:true,nullable: true)
        alterEmail(email: true,blank:true,nullable: true)
        filename(blank:true,nullable: true)
        temporaryAddress(blank:true,nullable: true)
        gender(inList: ['M','F','T'])

    }
}
