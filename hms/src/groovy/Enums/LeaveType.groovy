package Enums

/**
 * Created by Apurva on 6/21/2015.
 */
enum LeaveType {

    PERSONAL('Personal'),
    SICK('Sick'),
    FLOATING('Floating')

    public value

    public LeaveType(String val){
        this.value = val
    }
}