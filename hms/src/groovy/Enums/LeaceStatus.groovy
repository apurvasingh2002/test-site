package Enums

/**
 * Created by nick on 6/27/2015.
 */
enum LeaveStatus {

    PENDING('pending'),
    UNAPPROVED('unapproved'),
    APPROVED('approved')

    public value

    public LeaveStatus(String val){
        this.value=val
    }


}