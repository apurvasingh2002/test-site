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
                //create and update for sameinstance
            if (val> obj.toDate) return ['validation.customFromDateScope','FromDate cannot be greater than ToDate']
            else{
                //update
                if(obj?.id){
                    def leaveSetting=LeaveSetting.findAllByEmployee(obj.employee,[sort:'id',order:'asc'])
                    def currInd=leaveSetting.indexOf(obj);
                    def size=leaveSetting.size()
                    def prev=currInd-1;
                    def next=currInd+1;

                    if(prev>=0){
                        if(obj.fromDate <= leaveSetting.get(prev).toDate  ){
                          return  ['validation.customFromDateTaken', obj.employee.getFullName()+' has already taken leave in selected date. From Date must be greater than '+leaveSetting.get(prev).toDate]
                        }
                    }

                    if(size>next){
                        if(obj.toDate >= leaveSetting.get(next).fromDate){
                         return   ['validation.customFromDateTaken', obj.employee.getFullName()+' has already taken leave in selected date. To Date must be lesser than '+leaveSetting.get(next).fromDate]
                        }
                    }


                }else{
                    //create
                    def leaveSetting=LeaveSetting.findByEmployee(obj.employee,[sort:'id',order:'desc'])

                    if(leaveSetting && val<=leaveSetting?.toDate){
                       return ['validation.customFromDateTaken', obj.employee.getFullName()+' has already taken leave in selected date']
                    }
                }

            }



         })



        }


}
