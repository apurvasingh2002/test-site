package Enums

/**
 * Created by Apurva on 6/21/2015.
 */
enum LeaveType {

    PERSONAL('personal'),
    SICK('sick'),
    FLOATING('floating')

    public value

    public LeaveType(String val){
        this.value = val
    }
}