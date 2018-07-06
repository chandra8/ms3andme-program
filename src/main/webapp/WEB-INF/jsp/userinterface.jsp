<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
input:invalid {
  border: 2px dashed red;
}

input:valid {
  border: 2px solid black;
}

#display{
 border: 2px solid black;
}
table {
width : 40%
}




</style>
<!-- <script type="text/javascript">
 
function validateInput(){
	var minValue = document.getElementById("minvalue").value;
	var maxValue = document.getElementById("maxValue").value;
	document.write(minValue + maxValue);
	
}
 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
<script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/additional-methods.min.js"></script>
<script>
// just for the demos, avoids form submit

</script>
</body>
</html>

<script>
function isNumberKey(evt){
    var charCode = (evt.which) ? evt.which : event.keyCode
    if (charCode > 31 && (charCode < 48 || charCode > 57))
        return false;
    return true;
}




$(document).ready(function(){
  $(".validation-error").hide();
  $(".error-minvalue").hide();
  $("#reverse").hide();
  $(".exceed-limit-validation-error").hide();
  
  //JQuery input validations
   $('#myForm').validate({ // initialize the plugin
        rules: {
            min: {
                required: true,
			    maxlength : 3
				 
				  
                
            },
            max: {
                required: true,
				maxlength : 3
				
              
            }
        },
		messages: {
		min : "Please enter valid input",
		max : "Please enter valid input"
		}
    });
   //This function is used to reverse the order
	$("#reverse").click(function(){
	 $("tbody").each(function(elem,index){
      var arr = $.makeArray($("tr",this).detach());
      arr.reverse();
        $(this).append(arr);
    });
	});
	// This function is used to get the reponse from API.
    $("#button").click(function(){
	 $("#reverse").hide();
	$(".json-list").empty();
	$('#key-value').empty();
	var min  = $("#minvalue").val();
	var max = $("#maxValue").val();
	if(min > 0 && min < 200 && max > 0 && max <201 && min < max){
	
		var data0 = {"min":min, "max":max};

		$.ajax({
  //API URL
    url : 'http://localhost:8080/get/keyVlaues',
    type : 'POST',
    data : JSON.stringify(data0),
	contentType: "application/json; charset=utf-8",
    dataType:'json',
    success : function(data) {              
        
		$(".validation-error").hide();
		$(".exceed-limit-validation-error").hide();
		
		//Printing JSON response
		$(".json-list").append('<h1>JSON Response : </h1>' + JSON.stringify(data,null,'\t'));
		//populating response in the table
		var trHTML = ' <table border = "1" collapse = "1" id="display" ><thead><tr id= "headers"><th>Key</th><th>Value</th></tr></thead><tbody>'; 	  
    $.each(data.listOfValues, function(k, v) {
    trHTML += '<tr><td>' + v.number + '</td><td>' + v.value + '</td></tr>';
});
   trHTML += '</tbody></table>'
	$('#key-value').append(trHTML);
	$("#reverse").show();
    },
    error : function(request,error)
    {
        alert("Request: "+JSON.stringify(request));
    }
});
	
	} else if(min >=200 || max >200) {
	 $(".validation-error").hide();
	$(".exceed-limit-validation-error").show();
	}else{
	$(".exceed-limit-validation-error").hide();
	  $(".validation-error").show();
	}
	
    });
});
</script>

</head>
<body>
<h1>MS3 Programming Challenge</h1>
<form action = "" id = "myForm">
 <p>Min Number : <input type="text" id="minvalue" name="min" required
               minLength="1" maxLength="3" onkeypress="return isNumberKey(event)" />
			   
 <br/>
 <p>Max Number : <input type="text" id="maxValue" name="max" required
               minLength="1" maxLength="3" onkeypress="return isNumberKey(event)"/></p><br/>
               <input type = 'button' id = 'button'value = 'Submit'/>
			   <span style = "color:red" class = "validation-error">Maxmium value should be greater than mininum value.</span>
			   <span style = "color:red" class = "exceed-limit-validation-error">Please enter the input values between 1 to 200 and max value should be greater than min value.</span>
 </form>
			   
			   <p  id="key-value"></p>
			   <input type = 'button' id = 'reverse'value = 'ReverseOrder'/>
			 
<p class = "json-list"></p>

</body>
</html>