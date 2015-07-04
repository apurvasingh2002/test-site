package hrm

class DepartmentsUnit {

    String name
    String description
    static belongsTo = [department:Departments]

    static constraints = {
    }
}
