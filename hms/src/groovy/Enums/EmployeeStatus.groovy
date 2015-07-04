package Enums

/**
 * Created by Apurva on 6/21/2015.
 */
enum EmployeeStatus {

    PERMANENT('permanent'),
    TERMED('termed'),
    SUSPENDED('suspended'),
    TEMPORARY('temporary'),
    PROBATION('probation')

    public String value

    public EmployeeStatus(String val){
        this.value=val
    }
}