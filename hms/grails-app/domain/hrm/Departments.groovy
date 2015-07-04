package hrm

class Departments {

        String name
        String description
        Departments belongsTo

    static hasMany = [unit:DepartmentsUnit,employee:Employee]

    static constraints = {
    }
}
