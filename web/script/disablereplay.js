/**
 * Created by Administrator on 2016/3/23.
 */
function disablereplay(replayid){
    $.ajax({
        url:"deletereplay.do",
        type:"post",
        datatype:"json",
        data:{"replayid":replayid},
        success:function(result){
            if(result.statu==0){
                //删除成功
               alert(result.msg);
                $("#"+replayid).next().html("用户回复被屏蔽");
            }
        },
        error:function(){
            alert("屏蔽失败")
        }
    });
}