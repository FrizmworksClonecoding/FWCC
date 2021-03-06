const change = $("#orderlistchange").html();

$(document).ready(function(){
	$.get({
		url:"./orderStateChange",
		data:{
			orderState:1
		},
		success:function(result){
			for(let datas of result){
				$("#orderlists").append("<tr id='jsoninjection'></tr>");
				let data = JSON.parse(datas);
				$("#jsoninjection").append("<td><input type='checkbox' class='checklist' data-orderNum='"+data.orderNum+"'></td>")
				$("#jsoninjection").append("<td>"+data.orderNum+"</td>");
				$("#jsoninjection").append("<td>"+data.orderName+"</td>");
				$("#jsoninjection").append("<td>"+data.orderState+"</td>");
				$("#jsoninjection").removeAttr("id");
			}
		}
	});
});

$("#allCheck").click(function(){
	let val = $(this).prop("checked");
	
	$(".checklist").prop("checked", val);
});

$("#orderlistTable").on(".checklist","click",function(){
	let check = true;
	
	$(".checklist").each(function(){
		if(!$(this).prop("checked")){
			check = false;
		}
	});
	
	$("#allCheck").prop("checked",check);
});

$("#selectCheck").click(function(){
	
	let check = $("#updateCheck").val();

	if(check==3){
		$("#orderlistTable").css("display", "none");
		$("#selectedlist").css("display","block");
		
	}else{
		$("#orderlistTable").css("display", "block");
		$("#selectedlist").css("display","none");
		
		$.get({
		url:"./orderStateChange",
		data:{
			orderState:check
		},
		success:function(result){
			$("#orderlists").empty();
			for(let datas of result){
				$("#orderlists").append("<tr id='jsoninjection'></tr>");
				let data = JSON.parse(datas);
				$("#jsoninjection").append("<td><input type='checkbox' class='checklist' data-orderNum='"+data.orderNum+"'></td>")
				$("#jsoninjection").append("<td>"+data.orderNum+"</td>");
				$("#jsoninjection").append("<td>"+data.orderName+"</td>");
				$("#jsoninjection").append("<td>"+data.orderState+"</td>");
				$("#jsoninjection").removeAttr("id");
			}
		}
	});
	}
});

$("#typebutton").click(function(){
	let ordernum = $("#typedorderNum").val();
	
	if(ordernum.trim()==''){
		swal({
			icon:"info",
			title:"INFO",
			text:"????????????????????? ?????? ????????? ??????????????????."
		});
		return;
	}
	
	$.get({
		url:"./selectedOrder",	
		data:{
			orderNum:ordernum
		},
		success:function(result){
			if(result.trim()==''){
				$("#checkBoolean").prop("checked", false);
				return;
			}
			let data = JSON.parse(result);
			$("#vieworderlist").empty();
			$("#vieworderlist").append(change);
			let insert = "<p id='selectedOrderNum'>"+data.orderNum+"</p><p>"+data.orderName+"</p><p>"+data.orderState+"</p>";
			$("#vieworderlist").append(insert);
			$("#selectedOrderState").val(data.orderState);
			$("#checkBoolean").prop("checked", true);
		}
	});
});

$("#selectedlist").on("click", "#fixorderbutton", function(event){
	event.preventDefault();
	
	let orderNum = $("#selectedOrderNum").text();
	let selectedOrderState = $("#selectedOrderState").val();
	
	if(!$("#checkBoolean").prop("checked")) {
		return;
	}
	
	if(selectedOrderState == '' || selectedOrderState < 1 || selectedOrderState > 4){
		swal({
			icon:"info",
			title:"INFO",
			text:"??????????????? ?????? ?????? ????????? ??????????????? ?????????"
		});
		return;
	}
	
	$.post({
		url:"./orderlistUpdate",
		data:{
			orderNum:orderNum,
			orderState:selectedOrderState
		},
		success:function(result){
			if(result>0){
				alert("????????? ?????????????????????.");
				location.href="./orderlistUpdate";
			}else{
				swal({
					icon:"error",
					title:"????????????",
					text:"???????????? ?????? ????????? ?????????????????????."
				});
			}
		}
	});
});

$("#stateChangeButton").click(function(event){
	event.preventDefault();
	
	let orderNums = new Array();
	$(".checklist").each(function(){
		if($(this).prop("checked")){
			orderNums.push($(this).attr("data-orderNum"));
		}
	});
	
	if(orderNums.length==0){
		swal({
			icon:"info",
			title:"????????????",
			text:"??????????????? ??????????????? ??????????????? ??????????????????."
		});
		return;
	}
	
	$.post({
		url:"./orderlistsUpdate",
		traditional:true,
		data:{
			orderNums:orderNums
		},
		success:function(result){
			if(result>0){
				alert("orderState??? ?????????????????????.");
				location.href="./orderlistUpdate";
			}else{
				swal({
					icon:"error",
					title:"ERROR",
					text:"orderState ????????? ????????? ?????????????????????."
				});
			}
		}
	});
});