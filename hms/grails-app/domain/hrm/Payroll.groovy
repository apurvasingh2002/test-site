package hrm

class Payroll {

    Date promotionDate = new Date()
    Double salary

    static belongsTo = [employee:Employee]
    static constraints = {
    }
}
