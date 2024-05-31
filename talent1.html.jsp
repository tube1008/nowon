<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link rel="stylesheet" href="/user/css/reset.css">
<link rel="stylesheet" href="/user/css/common.css">
<link rel="stylesheet" href="/user/css/style.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="/user/js/main.js"></script>
<script src="script/practice.js"></script>

<title>청년인재등록 | 노원청년포탈</title>
</head>
<script type="text/javascript">
	$(document).ready(function() {
		if ('${error}' === 'true') {
			alert('에러가 발생했습니다. 다시 시도 해주세요.');
		}
		
		$("#saveButton").click(function(e) {
			e.preventDefault();
			
			var domainSelect = document.getElementById("domain_select").value;
			var domainManual = document.getElementById("domain_manual");

			if (domainSelect !== "type") {
				domainManual.value = domainSelect;
			}

			if (validForm(document.frm)) {
				document.frm.action = '/user/uss/ion/tal/YouthTalentReg.do';
				document.frm.submit();
			};
		});
	});
	
	function validForm(requestForm) {
	    var divs = requestForm.getElementsByTagName('div');
	    var allFieldsValid = true;

	    for (var i = 0; i < divs.length; i++) {
	        if (divs[i].querySelector('em')) { // 각 div 내에 em 태그가 있는지 확인
	            var inputs = divs[i].querySelectorAll('input'); // 해당 div 내의 모든 입력 필드를 찾음
	            for (const input of inputs) {
	            	if (input.value.trim() === '' || input.value.trim() === '0') {  // 입력 필드가 비어 있는지 확인
	                    var spanText = divs[i].querySelector('span').textContent;
	                    alert(spanText.substring(0, spanText.length-1) + '는(은) 필수 입력 사항입니다. 입력해주세요.');

	                    allFieldsValid = false;
	                    break; // 빈 필드 발견 시 루프 탈출
	                }
	            }
	            if (!allFieldsValid) {
	                break 
	            } 
	        }
	    }
	    return allFieldsValid; // 모든 필수 필드가 유효하면 true, 아니면 false 반환
	}

	function toggleInput() {
		var mailBox = document.getElementById("mail_box");
		var selectedOption = document.getElementById("domain_select").value;
		var domainManual = document.getElementById("domain_manual");

		// Hide or show inputs based on selected option
		if (selectedOption === "type") {
			domainManual.style.display = "block";
		} else {
			mailBox.style.justifyContent = "unset";
			domainManual.style.display = "none";
		}
	}
	
	function checkboxValueChange() {
		var chk = document.getElementById("chk").checked;
		var saveButton = document.getElementById("saveButton");
		
		if (chk) {
			saveButton.classList.remove('disabled');
		} else {
			saveButton.classList.add('disabled');
		}
	}
</script>
<body>
	<div id="skip_nav">
		<a href="#main"><span>본문 바로가기</span></a> <a href="#header"><span>주메뉴
				바로가기</span></a> <a href="#footer"><span>푸터 바로가기</span></a>
	</div>
	<div id="wrap">
		<!-- ========== HEADER ========== -->
		<jsp:include page="/user/mnu/headerMenu.do"></jsp:include>
		<!-- ========== END HEADER ========== -->

		<!-- ========== MAIN CONTENT ========== -->
		<main id="main"> <section class="board talent"
			id="content-area">
		<div class="title_box">
			<div class="path">
				<ul>
					<li class="path_item"><img src="/user/images/ico-home.png"
						alt="Home"></li>
					<li class="path_item">와글와글 청년목소리</li>
					<li class="path_item">청년인재등록</li>
				</ul>
			</div>
			<h2>청년인재등록</h2>
		</div>
		<div class="tab_list">
			<ul class="tab_type2">
				<c:forEach var="menu" items="${headerMenu}">
					<c:if test="${menu.upperId == 80}">
						<c:set var="classAttribute"
							value="${menu.menuOrdr == 4 ? 'on' : ''}" />
						<li class="${classAttribute}"><a
							href="<c:url value='${menu.menuUrl}'/>"> <c:out
									value="${menu.menuName}" />
						</a></li>
					</c:if>
				</c:forEach>
			</ul>
		</div>
		<div class="talent_box">
			<div class="tal_tit">
				<div class="speaker">
					<img src="/user/images/img/talent_speaker.png" alt=""> <span
						class="tit">청년이 주인공!!</span>
				</div>
			</div>
			<div class="detail_box">
				<p class="tal_detail">
					노원에서 취업연계, 청년패널을 모집하며, 노원구에 거주하지 않더라도 인재 등록이 가능합니다.<br> 청년들의
					다양한 목소리에 귀를 기울이고 다양한곳에 참여를 확대하고, 노원의 미래를 이끌어갈 청년인재를 모집합니다.
				</p>
			</div>
			<div class="tal_info">
				<div class="regist">
					<span class="info">등록대상</span> <span class="detail">노원구에 거주
						또는 활동하고 있는 <span class="bold">만19세 ~ 39세 청년</span> 누구나 등록가능하며 해당
						목적이외의 용도로 사용되지 않습니다.
					</span>
				</div>
				<div class="regist">
					<span class="info">활동내용</span> <span class="detail">노원구 취업연계
						활동 및 청년패널</span>
				</div>
				<div class="regist">
					<span class="info ph">문의전화</span> <span class="detail">02)2116-0592</span>
				</div>
				<div class="watch">
					<p class="watch_img">
						<img src="/user/images/img/talent_info.png" alt="주의사항">
					</p>
					<span class="detail">청년의 참여가 필요한 곳에 적합한 인재를 추천하기 위해 미리 인력을
						확보하는 것으로 등록과 동시에 패널로 활동하는 것은 아님. 패널에 성격에 따라 추천이 제한될 수 있음.</span>
				</div>
			</div>
			<div class="chk_box"></div>
			<div class="information">
				<form action="#" method="post" class="user_info" name="frm">
					<fieldset>
						<legend class="hide">신청양식</legend>
						<p class="essential">
							<em>*</em>필수항목이므로 반드시 입력해 주시기 바랍니다.
						</p>
						<div class="user_name">
							<span class="title_name">신청자<em>*</em></span> <input type="text"
								class="name" name="registerNm">
						</div>
						<div class="user_tel">
							<span class="title_tel">연락처<em>*</em></span>
							<div class="tel">
								<input type="tel" class="num num1" maxlength="3" name="phoneNum1" id="phoneNum1"> 
								<span class="hyphen">-</span> 
								<input type="tel" class="num num2" maxlength="4" name="phoneNum2" id="phoneNum2"> 
								<span class="hyphen">-</span> 
								<input type="tel" class="num num3" maxlength="4" name="phoneNum3" id="phoneNum3"> 
							</div>
						</div>
						<div class="user_email">
							<span class="title_mail">e-mail<em>*</em></span>
							<div class="mail_box" id="mail_box">
								<input type="email" class="email_txt" name="email1" id="email">
								<span class="txt">@</span> <select name="mail_address"
									id="domain_select" class="domain_list" onchange="toggleInput()">
									<option value="" disabled selected>선택하세요</option>
									<option value="type">직접입력</option>
									<option value="naver.com">naver.com</option>
									<option value="google.com">google.com</option>
									<option value="daum.com">daum.com</option>
									<option value="nate.com">nate.com</option>
									<option value="hanmail.net">hanmail.net</option>
								</select>
								<input type="email" class="domain_txt manual" name="email2" id="domain_manual">
							</div>
						</div>
					</fieldset>
				</form>
			</div>
			<div class="chk_box">
				<input type="checkbox" id="chk" onclick="checkboxValueChange()"> <label for="chk1">만19세~39세
					청년으로 청년인재등록에 동의합니다.</label>
			</div>
			<div class="save_cancel">
				<button type="submit" class="save disabled" id="saveButton">인재등록</button>
				<a href="#" class="cancel">취소</a>
			</div>
		</div>
		</section> </main>
		<!-- ========== END MAIN CONTENT ========== -->

		<!-- ========== FOOTER ========== -->

		<!-- ========== END FOOTER ========== -->
	</div>
</body>

</html>

.talent_box .user_email {
display: flex; align-items: center;
}
.talent_box .title_mail {
width: 100px;
font-size: 2.0rem; font-weight: 700;
}
.talent_box .mail_box {
width: 90%;
display: flex;
align-items: center;
}
.talent_box .email_txt {
width: 29%; height: 50px;
background: #eee;
border: none;
font-size: 1.8rem;
text-align: center;
}
.talent_box .domain_txt {
width: 29%; height: 50px;
background: #eee;
border: none;
font-size: 1.8rem;
text-align: center;
margin-left: 57px;
}

.suggestion .user_email {
display: flex; align-items: center;
padding-bottom: 30px;
}
.suggestion .title_mail {
width: 100px;
font-size: 2.0rem; font-weight: 700;
}
.suggestion .mail_box {
width: 90%;
display: flex;
align-items: center;
}
.suggestion .email_txt {
width: 29%; height: 50px;
background: #eee;
border: none;
font-size: 1.8rem;
text-align: center;
}
.suggestion .domain_txt {
width: 29%; height: 50px;
background: #eee;
border: none;
font-size: 1.8rem;
text-align: center;
margin-left: 57px;
}