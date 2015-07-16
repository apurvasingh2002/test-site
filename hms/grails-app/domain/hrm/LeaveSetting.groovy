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
        fromDate(validator:{ val, obj ->
            def leaveSetting=LeaveSetting.findByEmployee(obj.employee,[sort:'toDate',order:'desc'])
            if (val> obj.toDate) ['validation.customFromDateScope','FromDate cannot be greater than ToDate']
            else if(leaveSetting && val>=leaveSetting?.toDate) ['validation.customFromDateTaken', obj.employee.getFullName()+' has already taken leave in selected date']
         })



        }


}
