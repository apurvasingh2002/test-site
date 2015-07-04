package hrm

import Enums.LeaveType
import Enums.LeaveStatus

class LeaveSetting {
    String reason
    LeaveType type
    Date fromDate
    Date toDate
    Double days
    LeaveStatus status
    Employee approveBy
    Float duration

    static belongsTo = [employee:Employee]

    static constraints = {

        type(blank:false,nullable: false)
        reason(blank:false,nullable: false)
        approveBy(blank:true,nullable: true)
        toDate(validator:{ val, obj ->
            if (val< obj.fromDate) ['datePriorTo', val.toString(), obj.fromDate]
    })
}
}
