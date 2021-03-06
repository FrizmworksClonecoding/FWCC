/**
 * 
 */
 
// 주소 API ======================================
//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('zipCodeT').value = data.zonecode;
                document.getElementById("basicAddrT").value = roadAddr;
                document.getElementById("basicAddrT").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("basicAddrT").value = roadAddr+extraRoadAddr;
                } else {
                    document.getElementById("basicAddrT").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
    
// MemberVO init =======================================
let username = "";
let password = "";
let passwordCheck = "";
let name = "";
let zipCode = "";
let basicAddr = "";
let detailAddr = "";
let phone0 = "";
let phone1 = "";
let phone2 ="";
let phone = "";
let email = "";
let birth_year = "";
let birth_month = "";
let birth_day = "";
let birth = "";
let smsAgree = "";
let emailAgree = "";

// 페이지 로딩 시 폰번호 앞자리 check ==========================
$(document).ready(function(){
	let phoneNum = $("#phone0").attr("title");
	if(phoneNum == "010"){
		$("#010").prop("selected", true);
	}else if(phoneNum == "011"){
		$("#011").prop("selected", true);
	}else if(phoneNum == "016"){
		$("#016").prop("selected", true);
	}else if(phoneNum == "017"){
		$("#017").prop("selected", true);
	}else if(phoneNum == "018"){
		$("#018").prop("selected", true);
	}else if(phoneNum == "019"){
		$("#019").prop("selected", true);
	}
});

// 회원정보 수정 =============================================== 
$("#updateBtn").click(function(){
	username = $("#usernameT").val();
	let oldPWCheck = $("#passwordCheckT").val();
	$.ajax({
		method:"POST",
		url:"./pwCheck",
		data:{
			username:username,
			passwordCheck:oldPWCheck
		},
		success:function(result){
			result = result.trim();
			console.log(result);
			if(result == "true"){
				username = $("#usernameT").val();
				username = username.toLowerCase();
				newPassword = $("#newPasswordT").val();
				if(newPassword == ""){
					password = oldPWCheck;
				} else {
					password = newPassword;
				}
				passwordCheck = $("#newPasswordCheckT").val();
				zipCode = $("#zipCodeT").val();
				basicAddr = $("#basicAddrT").val();
				detailAddr = $("#detailAddrT").val();
				phone0 = $("#phone0").val();
				phone1 = $("#phone1").val();
				phone2 = $("#phone2").val();
				phone = phone0+"-"+phone1+"-"+phone2;
				email = $("#emailT").val();
				smsAgree = $("#is_sms0").prop("checked");
				emailAgree = $("#is_news_mail0").prop("checked");
				$.ajax({
					method:"POST",
					url:"./memberUpdate",
					data:{
						username:username,
						password:password,
						phone:phone,
						email:email,
						smsAgree:smsAgree,
						emailAgree:emailAgree,
						zipCode:zipCode,
						basicAddr:basicAddr,
						detailAddr:detailAddr
					},
					success:function(result){
						result = result.trim();
						if(result != 0){
							alert("회원정보 수정 성공");
							location.href="/"
						}
					}
				}); // --- memberUpdate ajax END ---/
			}else {
				alert("비밀번호를 확인해주세요.");
			}
		} // --- pwCheck success END ---
	}); // --- pwCheck ajax END ---
	
function memberUpdate(){
	
}
	
/*	username = $("#usernameT").val();
	username = username.toLowerCase();
	password = $("#newPasswordT").val();
	passwordCheck = $("#newPasswordCheckT").val();
	zipCode = $("#zipCodeT").val();
	basicAddr = $("#basicAddrT").val();
	detailAddr = $("#detailAddrT").val();
	phone0 = $("#phone0").val();
	phone1 = $("#phone1").val();
	phone2 = $("#phone2").val();
	phone = phone0+"-"+phone1+"-"+phone2;
	email = $("#emailT").val();
	smsAgree = $("#is_sms0").prop("checked");
	emailAgree = $("#is_news_mail0").prop("checked");
	$.ajax({
		method:"POST",
		url:"./memberUpdate",
		data:{
			username:username,
			password:password,
			phone:phone,
			email:email,
			smsAgree:smsAgree,
			emailAgree:emailAgree,
			zipCode:zipCode,
			basicAddr:basicAddr,
			detailAddr:detailAddr
		},
		success:function(result){
			result = result.trim();
			if(result != 0){
				alert("회원정보 수정 성공");
				location.href="/"
			}
		}
	}); // --- ajax END ---*/
});





