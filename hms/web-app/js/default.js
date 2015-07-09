/**
 * Created by Apurva on 7/5/2015.
 */
function showLoadingScreen(){
    $("#loading-screen").show();
}
function hideLoadingScreen(){
    $("#loading-screen").hide();
}
function makeAjaxCall(url,data,updateDiv,beforeSend,complete,success){
    $.ajax({
        url:url,
        data:data?data:{},
        method:'POST',
        beforeSend : function(){
            showLoadingScreen();
            if(beforeSend) beforeSend();
        },
        complete:function(){
            hideLoadingScreen();
            if(complete) complete();
        },
        success:function(data){
            if(updateDiv) updateDiv.html(data);
            if(success) success();
        }
    });
}
