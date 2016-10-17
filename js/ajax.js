/// <reference path="../adminajax.aspx" />
/// <reference path="../adminajax.aspx" />
function getbranchweeklyincome(val,date) {
    var columnName = $("#ddlFilters").val();
    var input = val;
    var obj;
        var Data = JSON.stringify({ inputVal: input,dateofweek:date});
        $.ajax({

          url: "adminajax.aspx/getBranchWeeklyIncome",
          async: false,
            data: Data,
            type: "POST",
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            success: function (mydata) {
               
                obj = mydata.d;
               
            }
        });    
        return obj;
}




function getbranchweeklyexpenditure(val,date) {
   
    var input = val;
    var obj;
    var Data = JSON.stringify({ inputVal: input,incomedate:date });

    

    $.ajax({

        url: "adminajax.aspx/getBranchWeeklyexpenditure",
        async: false,
        data: Data,
        type: "POST",
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        success: function (mydata) {
           
            obj = mydata.d;
           

        }
    });
    return obj;
}


function getMonthlyIncome(val, date) {

    var input = val;
    var obj;
    var Data = JSON.stringify({ inputVal: input, incomedate: date });



    $.ajax({

        url: "adminajax.aspx/getMonthlyincome",
        async: false,
        data: Data,
        type: "POST",
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        success: function (mydata) {
          
            //alert(mydata.d)
            var check = $.parseJSON(mydata.d)
            obj = check;
           

        },
        failure: function (response) {
            alert("Faliar"+response.d);
        }
    });
    return obj;
}
function getMonthlyExp(val, date) {

    var input = val;
    var obj;
    var Data = JSON.stringify({ inputVal: input, incomedate: date });



    $.ajax({

        url: "adminajax.aspx/getMonthlyExpenditure",
        async: false,
        data: Data,
        type: "POST",
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        success: function (mydata) {

            //alert(mydata.d)
            var check = $.parseJSON(mydata.d)
            obj = check;


        },
        failure: function (response) {
            alert("Faliar" + response.d);
        }
    });
    return obj;
}
//yearly branch income and expensers
function getyearlyIncome(val, date) {

    var input = val;
    var obj;
    var Data = JSON.stringify({ inputVal: input, incomedate: date });



    $.ajax({

        url: "adminajax.aspx/getyearlyincome",
        async: false,
        data: Data,
        type: "POST",
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        success: function (mydata) {

            //alert(mydata.d)
            var check = $.parseJSON(mydata.d)
            obj = check;


        },
        failure: function (response) {
            alert("Faliar" + response.d);
        }
    });
    return obj;
}
function getyearlyExp(val, date) {

    var input = val;
    var obj;
    var Data = JSON.stringify({ inputVal: input, incomedate: date });



    $.ajax({

        url: "adminajax.aspx/getyearlyExpenditure",
        async: false,
        data: Data,
        type: "POST",
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        success: function (mydata) {

            //alert(mydata.d)
            var check = $.parseJSON(mydata.d)
            obj = check;


        },
        failure: function (response) {
            alert("Faliar" + response.d);
        }
    });
    return obj;
}
