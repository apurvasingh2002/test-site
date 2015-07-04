package hrm

class Designation {

    String name
    String description

    static hasMany = [employee:Employee]
    static constraints = {
    }
}
