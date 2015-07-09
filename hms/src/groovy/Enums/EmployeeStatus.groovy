package Enums

/**
 * Created by Apurva on 6/21/2015.
 */
enum EmployeeStatus {

    PERMANENT('Permanent'),
    TERMED('Termed'),
    SUSPENDED('Suspended'),
    TEMPORARY('Temporary'),
    PROBATION('Probation')

    public String value

    public EmployeeStatus(String val){
        this.value=val
    }
}