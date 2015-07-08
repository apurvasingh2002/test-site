/**
 * Created by Apurva on 7/5/2015.
 */
function showLoadingScreen(){
    console.log("ssss");
    $("#loading-screen").show();
}
function hideLoadingScreen(){
    $("#loading-screen").hide();
}
function getMenuContent(url,template){
    $.ajax({
        url:url,
        data:{template:template},
        method:'POST',
        beforeSend : function(){
            showLoadingScreen();
        },
        complete:function(data){
            $("#body-container").html(data);
        },
        success:function(){
            hideLoadingScreen();
        }
    });
}