/// <reference path="../adminajax.aspx" />
/// <reference path="../adminajax.aspx" />
function getbranchweeklyincome(val) {
    var columnName = $("#ddlFilters").val();
    var input = val;
    var obj;
        var Data = JSON.stringify({ inputVal: input });

        alert(Data);

        $.ajax({

          url: "adminajax.aspx/getBranchWeeklyIncome",
          async: false,
            data: Data,
            type: "POST",
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            success: function (mydata) {
                //var a = mydata;
                //var x = JSON.stringify(a); // "[1,2]"
                //alert("stringify " + x);
                // var o = JSON.parse(x);
                // alert("Json parse " + o);
                obj = mydata.d;
                alert("checking"+obj);
                
            }
        });    
        return obj;
}