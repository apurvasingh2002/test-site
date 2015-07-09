package Enums

/**
 * Created by nick on 6/27/2015.
 */
enum LeaveStatus {

    PENDING('Pending'),
    UNAPPROVED('Unapproved'),
    APPROVED('Approved')

    public value

    public LeaveStatus(String val){
        this.value=val
    }

}