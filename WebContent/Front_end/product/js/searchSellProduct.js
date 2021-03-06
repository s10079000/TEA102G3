
let contextPath = $("#contextPath").val();
$.ajax({
    url: contextPath + "/ProductTypeAjax",
    type : "GET",
    dataType : "json",
    success : function(data) {
        $.each(data, function(index, value) {
            $("#ptype").append(
                `<option value="${value.pt_id}">${value.pt_platform} ${value.pt_kind}</option>`
            )
        })
    
    }
})


$("#searchBtn").click(function() {
    let type = $("#ptype").val();
    let pname = $("#pname").val();
    // console.log(pname)
    var data = {
        "type" : type,
        "pname" : pname
    }
    $.ajax({
        url: contextPath + "/Productajax",
        type : "GET",
        dataType : "json",
        data : data,
        success : function(data) {
            // console.log(data);
            $(".row").html("");
            $.each(data, function(index, value) {

                findPicture(value.p_id).then((data) => {
                    $(".row").append(
                        `<div class="col-md-4">
                            <div class="card" style="width: 18rem;">
                                <img src="${contextPath}/ShowPicture?type=pp&id=${data}" class="card-img-top" alt="沒...沒圖片">
                                <div class="card-body">
                                    <h5 class="card-title">${value.p_name}</h5>
                                    <p class="card-text">平台:${value.pt_idName}</p>
                                    <p class="card-text">價格:${value.p_price}</p>
                                    <small>上架時間:${value.p_addDateSec}</small>
                                    <div>
                                        <form action="${contextPath}/ProductServlet" method="POST">
                                            <input type="hidden" name="pid" value="${value.p_id}">
                                            <input type="hidden" name="action" value="findthis">
                                            <input type="submit" class="btn btn-primary" value="詳細">
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>`
                    );
                })
            });
        }
    });
});

function findPicture(pid) {
    return new Promise(function(resolve, reject) {
        $.ajax({
            url: contextPath + "/Productajax",
            type : "GET",
            dataType : "text",
            data : {
                "pid" : pid
            },
            success : function(data) {
                resolve(data);
                
            }
        })
    }) 
}
