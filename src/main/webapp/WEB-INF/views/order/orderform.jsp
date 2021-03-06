<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<c:import url="${pageContext.request.contextPath}/WEB-INF/views/templates/head.jsp"></c:import>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:import url="${pageContext.request.contextPath}/WEB-INF/views/templates/navbar.jsp">
	<c:param name="isCommon" value="true"></c:param>
</c:import>
	<h1></h1>
	<div style="margin:10% 8% 5% 8%; text-align: center;">
		<h2 style="letter-spacing: 0.15rem; margin-bottom: 5%">ORDER</h2>
		<div style="text-align: left;">
			<strong>μΌλ°μν(<c:out value="${orderCount}"></c:out>)</strong>
		</div>
		<table style="width:100%; margin-bottom: 1%;">
			<thead style="border-bottom: 1px gray solid;">
				<tr>
					<th style="width:15%;padding:1%;">
						THUMB
					</th>
					<th>
						PRODUCT
					</th>
					<th style="width:12%;">
						PRICE
					</th>
					<th style="width:8%;">
						QUANTITY
					</th>
					<th style="width:8%;">
						MILEAGE
					</th>
					<th style="width:8%;">
						DELIVERY
					</th>
					<th style="width:8%;">
						CHARGE
					</th>
					<th style="width:14%;">
						TOTAL
					</th>
				</tr>
			</thead>
			<tbody style="text-align: center; border-bottom: 1px gray solid;">
				<c:forEach items="${items}" var="item">
					<tr class="productDataList"
						data-productNum='<c:out value="${item.productNum}"></c:out>'
						data-pInfoNum='<c:out value="${item.PInfoNum}"></c:out>'
						data-finalPrice='<c:out value="${item.productVO.finalPrice}"></c:out>'
						data-productCount='<c:out value="${item.productCount}"></c:out>'
						data-cartNum='<c:out value="${item.cartNum}"></c:out>'
						style="border-bottom: 1px rgba(128,128,128,0.5) solid;">
						<td style="padding:1%;">
							<img alt="" src="${pageContext.request.contextPath}/resources/images/product/
															${item.productVO.productNum}/${item.productFileVO.fileName}"
								width="100px" height="100px">
						</td>
						<td style="text-align: left; padding:1% 3%;">
							<c:out value="${item.productVO.productTitle}"></c:out><br>
							<span>[μ΅μ: <c:out value="${item.productInfoVO.size}"></c:out>]</span>
						</td>
						<td>
							<strong><span>KRW</span> <c:out value="${item.productVO.productPrice}"></c:out></strong><br>
							<span>[ν μΈλ₯  : <c:out value="${item.productVO.productDisRate}"></c:out>%]</span>
						</td>
						<td><!-- μ ν κ°μλ₯Ό μ°μ΄μΌ νλ€. -->
							<c:out value="${item.productCount}"></c:out>
						</td>
						<td><!-- λ°μ μ μλ μ΄ λ§μΌλ¦¬μ§λ₯Ό μ²΄ν¬ν΄μΌνλ€. -->
							<img alt="μ λ¦½" src="${pageContext.request.contextPath}/images/cartAndOrder/icon_cash.gif">
							<span> <c:out value="${item.productVO.productMileage}"></c:out>μ</span>
						</td>
						<td>
							<span>κΈ°λ³Έλ°°μ‘</span>
						</td>
						<td>
							<span>[λ¬΄λ£]</span>
						</td>
						<td>
							<c:if test="${item.productVO.productDisRate eq 0}">
								<span><strong>KRW <c:out value="${item.productCount*item.productVO.productPrice}"></c:out></strong></span>
							</c:if>
							<c:if test="${item.productVO.productDisRate ne 0}">
								<del>KRW <c:out value="${item.productCount*item.productVO.productPrice}"></c:out></del><br>
								<strong>KRW <c:out value="${item.finalPrice}"></c:out></strong>
							</c:if>
						</td>
					</tr>
				</c:forEach>
			</tbody>
			<tfoot>
				<tr style="border-bottom:1px gray solid;">
					<td colspan="8">
						<br>
						<div style="display: flex; justify-content: space-between; width:100%;">
							<div>
								[κΈ°λ³Έλ°°μ‘]
							</div>
							<div>
								<span>μνκ΅¬λ§€κΈμ‘ <strong><c:out value="${totalprice}"></c:out></strong>+λ°°μ‘λΉ 0 (λ¬΄λ£) = ν©κ³:</span>
								<strong>KRW <span style="font-size: 1.5em;"><c:out value="${totalprice}"></c:out></span></strong>
							</div>
						</div>
						<br>
					</td>
				</tr>
				<tr style="border-bottom:1px rgba(128,128,128,0.5) solid;">
					<td colspan="8" style="text-align: left;">
						<span>ν μΈ μ μ© κΈμ‘μ μ£Όλ¬Έμμμ±μ κ²°μ μμ κΈμ‘μμ νμΈκ°λ₯ν©λλ€.</span>
					<td>
				</tr>
			</tfoot>
		</table>
		
		<table style="width:100%;margin-top:7%;">
			<thead>
				<tr style="border-bottom: 1px rgba(128,128,128,0.5) solid;">
					<th style="text-align: left; width:16%;">μ£Όλ¬Έ μ λ³΄</th>
					<th style="text-align: right;">
						<img src="//img.echosting.cafe24.com/skin/base_ko_KR/order/ico_required.gif" alt=""> νμμλ ₯μ¬ν­</th>
				</tr>
			</thead>
			<tbody style="text-align: left;">
				<tr style="border-bottom: 1px rgba(128,128,128,0.5) solid;">
					<td style="padding:1%;">μ£Όλ¬Ένμλ λΆ 
						<img src="//img.echosting.cafe24.com/skin/base_ko_KR/order/ico_required.gif" alt=""></td>
					<td style="padding:1%;">
						<input type="text" id="buyerName" value='<c:out value="${orderAddr.recipient}"></c:out>' readonly="readonly">
					</td>
				</tr>
				<tr style="border-bottom: 1px rgba(128,128,128,0.5) solid;">
					<td style="padding:1%;">μ£Όμ <img src="//img.echosting.cafe24.com/skin/base_ko_KR/order/ico_required.gif" alt=""></td>
					<td style="padding:1%;">
						<input type="text" style="width:8%;" id="buyerZipcode" value='<c:out value="${orderAddr.zipCode}"></c:out>' 
																												readonly="readonly"><br>
						<input type="text" style="margin-top:0.5%;" id="buyerBasic" value='<c:out value="${orderAddr.basicAddr}"></c:out>' 
																							readonly="readonly"> <span>κΈ°λ³Έμ£Όμ</span><br>
						<input type="text" style="margin-top:0.5%;" id="buyerDetail" 
											value='<c:out value="${orderAddr.detailAddr}"></c:out>' readonly="readonly"> 
											<span>λλ¨Έμ§μ£Όμ</span>
					</td>
				</tr>
				<tr style="border-bottom: 1px rgba(128,128,128,0.5) solid;">
					<td style="padding:1%;">μ νλ²νΈ <img src="//img.echosting.cafe24.com/skin/base_ko_KR/order/ico_required.gif" alt=""></td>
					<td style="padding:1%;">
						<input type="text" id="buyerPhone1" value='<c:out value="${orderAddr.addrPhone1}"></c:out>' readonly="readonly"> 
						- <input type="text" id="buyerPhone2" value='<c:out value="${orderAddr.addrPhone2}"></c:out>' readonly="readonly"> 
						- <input type="text" id="buyerPhone3" value='<c:out value="${orderAddr.addrPhone3}"></c:out>' readonly="readonly">
					</td>
				</tr>
				<tr style="border-bottom: 1px rgba(128,128,128,0.5) solid;">
					<td style="padding:1%;">μ΄λ©μΌ <img src="//img.echosting.cafe24.com/skin/base_ko_KR/order/ico_required.gif" alt=""></td>
					<td style="padding:1%;">
						<input type="text" id="buyerEmail1" value='${orderDetail.email1}' readonly="readonly"> 
						@ <input type="text" id="buyerEmail2" value='${orderDetail.email2}' readonly="readonly"> 
						. <input type="text" id="buyerEmail3" value='${orderDetail.email3}' readonly="readonly"> 
						<br><span>- μ΄λ©μΌμ ν΅ν΄ μ£Όλ¬Έμ²λ¦¬κ³Όμ μ λ³΄λ΄λλ¦½λλ€.</span>
					</td>
				</tr>
			</tbody>
		</table>

		<table style="width:100%;margin-top:7%;">
			<thead>
				<tr style="border-bottom: 1px rgba(128,128,128,0.5) solid;">
					<th style="text-align: left; width:16%;">λ°°μ‘ μ λ³΄</th>
					<th style="text-align: right;">
						<img src="//img.echosting.cafe24.com/skin/base_ko_KR/order/ico_required.gif" alt=""> νμμλ ₯μ¬ν­
					</th>
				</tr>
			</thead>
			<tbody style="text-align: left;">
				<tr style="border-bottom: 1px rgba(128,128,128,0.5) solid;">
					<td style="padding:1%;">λ°°μ‘μ§ μ ν 
						<img src="//img.echosting.cafe24.com/skin/base_ko_KR/order/ico_required.gif" alt="">
					</td>
					<td style="padding:1%;">
						<a id="recSelect" href="#forAddAddress" rel="modal:open">μ£Όμλ‘ λ³΄κΈ°</a>
					</td>
				</tr>
				<tr style="border-bottom: 1px rgba(128,128,128,0.5) solid;">
					<td style="padding:1%;">λ°μΌμλ λΆ 
						<img src="//img.echosting.cafe24.com/skin/base_ko_KR/order/ico_required.gif" alt="">
					</td>
					<td style="padding:1%;">
						<input type="text" id="recPeople" value='<c:out value="${recentAddr.recipient}"></c:out>' readonly="readonly">
					</td>
				</tr>
				<tr style="border-bottom: 1px rgba(128,128,128,0.5) solid;">
					<td style="padding:1%;">μ£Όμ 
						<img src="//img.echosting.cafe24.com/skin/base_ko_KR/order/ico_required.gif" alt="">
					</td>
					<td style="padding:1%;">
						<input type="text" style="width:8%;" id="recZipcode" 
								value='<c:out value="${recentAddr.zipCode}"></c:out>' readonly="readonly">
						<br><input style="margin-top:0.5%;" type="text" id="recBasic" 
								value='<c:out value="${recentAddr.basicAddr}"></c:out>' readonly="readonly"> κΈ°λ³Έμ£Όμ
						<br><input style="margin-top:0.5%;" type="text" id="recDetail" 
								value='<c:out value="${recentAddr.detailAddr}"></c:out>' readonly="readonly"> λλ¨Έμ§μ£Όμ
					</td>
				</tr>
				<tr style="border-bottom: 1px rgba(128,128,128,0.5) solid;">
					<td style="padding:1%;">μ νλ²νΈ 
						<img src="//img.echosting.cafe24.com/skin/base_ko_KR/order/ico_required.gif" alt="">
					</td>
					<td style="padding:1%;">
						<input type="text" id="reccall1" value='<c:out value="${recentAddr.addrPhone1}"></c:out>' readonly="readonly"> 
						- <input type="text" id="reccall2" value='<c:out value="${recentAddr.addrPhone2}"></c:out>' readonly="readonly"> 
						- <input type="text" id="reccall3" value='<c:out value="${recentAddr.addrPhone3}"></c:out>' readonly="readonly">
					</td>
				</tr>
				<tr style="border-bottom: 1px rgba(128,128,128,0.5) solid;">
					<td style="padding:1%;">λ°°μ‘ λ©μΈμ§</td>
					<td style="padding:1%;">
						<textarea id="orderMessage" rows="2" style="width:100%;"></textarea>
					</td>
				</tr>
			</tbody>
		</table>
		
		<table style="width:100%; margin-top:7%;">
			<thead>
				<tr>
					<th colspan="3" style="text-align: left; padding-bottom:3%;">κ²°μ  μμ  κΈμ‘</th>
				</tr>
				<tr style="border-bottom: 1px rgba(128,128,128,0.5) solid;">
					<th style="padding: 1%;">μ΄ μ£Όλ¬ΈκΈμ‘</th>
					<th style="padding: 1%;">μ΄ ν μΈ + λΆκ°κ²°μ  κΈμ‘</th>
					<th style="padding: 1%;">μ΄ κ²°μ μμ  κΈμ‘</th>
				</tr>
			</thead>
			<tbody>
				<tr style="border-bottom: 2px rgba(128,128,128,0.5) solid; font-size:1.6rem;">
					<td style="padding: 3%;"><strong>KRW <span><c:out value="${totalprice}"></c:out></span></strong></td>
					<td style="padding: 3%;"><strong>- KRW <span id="onsaleprice"><c:out value='0'></c:out></span></strong></td>
					<td style="padding: 3%;">
						<strong>= KRW <span id="endprice"><c:out value="${totalprice}"></c:out></span></strong>
					</td>
				</tr>
			</tbody>
		</table>
		
		<table style="width:100%;">
			<tbody>
				<tr style="border-bottom: 1px rgba(128,128,128,0.5) solid;">
					<td style="width:16%; text-align: left; padding:1%;">μ΄ ν μΈκΈμ‘</td>
					<td style="text-align: left; padding:1%;">
						<strong>KRW <span><c:out value="${totalprice}"></c:out></span></strong>
					</td>
				</tr>
				<tr style="border-bottom: 1px rgba(128,128,128,0.5) solid;">
					<td style="width:16%; text-align: left; padding:1%;">μΏ ν°ν μΈ</td>
					<td style="text-align: left; padding:1%;">
						<a id="cuSelect" href="#forAddCoupon" rel="modal:open">μΏ ν°μ μ©</a>
					</td>
				</tr>
				<tr style="border-bottom: 1px rgba(128,128,128,0.5) solid;">
					<td style="width:16%; text-align: left; padding:1%;">μ΄ λΆκ°κ²°μ κΈμ‘</td>
					<td style="text-align: left; padding:1%;">
						<strong>KRW <span id="delPriceInsert">0</span></strong>
					</td>
				</tr>
				<tr style="border-bottom: 1px rgba(128,128,128,0.5) solid;">
					<td style="width:16%; text-align: left; padding:1%;">μ λ¦½κΈ</td>
					<td style="text-align: left; padding:1%;">
						<input type="text" id="useMile" value="0"> μ (μ΄ μ¬μ©κ°λ₯ μ λ¦½κΈ: 
							<span><c:out value="${orderDetail.mileageVO.enabledMile}"></c:out></span>μ)
						<br><button style="margin-top:0.5%;" id="mileAccept">μ μ©</button>
						<p>
							<br>- μ λ¦½κΈμ μ΅μ 1000μ΄μμΌ λ κ²°μ κ° κ°λ₯ν©λλ€.
							<br>- 1ν κ΅¬λ§€μ μ λ¦½κΈ μ΅λ μ¬μ©κΈμ‘μ 2000μμλλ€.
							<br>- μ λ¦½κΈμΌλ‘λ§ κ²°μ ν  κ²½μ°, κ²°μ κΈμ‘μ΄ 0μΌλ‘ λ³΄μ¬μ§λ κ²μ μ μμ΄λ©° [κ²°μ νκΈ°] λ²νΌμ λλ₯΄λ©΄ μ£Όλ¬Έμ΄ μλ£λ©λλ€.
						</p>
					</td>
				</tr>
			</tbody>
		</table>
		
		<div style="text-align: right; margin-top: 4%;">
			<strong>μ΅μ’κ²°μ  κΈμ‘</strong>
			<p><strong><span style="font-size:1.8rem;" id="forUserPrice"><c:out value="${totalprice}"></c:out></span></strong></p>
			<input type="checkbox" id="agreepayment">
			<span>κ²°μ μ λ³΄λ₯Ό νμΈνμμΌλ©°, κ΅¬λ§€μ§νμ λμν©λλ€.</span><br>
			<button id="purchasebutton"
				data-name="${name}"
				data-originTotPrice="${totalprice}"
				data-cuSale="0"
				data-mileSp="0"
				data-cuNum="0"
				data-changeMile='<c:out value="${totalMileage}"></c:out>'>
				PAYMENT
			</button>
		</div>
		<div style="text-align: right; margin-top:3%;">
			<table style="float: right;">
				<tbody>
					<tr>
						<th>μ λ¦½μμ κΈμ‘</th>
						<td>&ensp;<td>
						<td><c:out value="${totalMileage}"></c:out>μ</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div style="font-size: 0.75rem; clear: both; text-align: left;">
			<p><strong>μ΄μ©μλ΄</strong></p>
			<ol style="list-style: none; padding-left: 0;">
				<li>κ²°μ κ°λ₯λΈλΌμ°μ  : ν¬λ‘¬,νμ΄μ΄ν­μ€,μ¬νλ¦¬,μ€νλΌ λΈλΌμ°μ μμ κ²°μ  κ°λ₯</li>
				<li>(λ¨, window os μ¬μ©μμ ννλ©° λ¦¬λμ€/mac os μ¬μ©μλ μ¬μ©λΆκ°)</li>
				<li>μ΅μ΄ κ²°μ  μλμμλ νλ¬κ·ΈμΈμ μΆκ° μ€μΉ ν λ°λμ λΈλΌμ°μ  μ’λ£ ν μ¬μμν΄μΌλ§ κ²°μ κ° κ°λ₯ν©λλ€.</li>
				<li>(λ¬΄ν΅μ₯, ν΄λν°κ²°μ  ν¬ν¨)</li>
			</ol>
		</div>
	</div>
	
	<div style="display:none; position: fixed; top:10%; left:15%; max-width:70%; max-height: 75%; overflow-y: auto;" 
			id="forAddAddress" class="modal">
		<div id="addressChapter1" style="margin:2%; width:96%; display:contents;">
			<table style="border: 1px rgba(128,128,128,0.5) solid; width: 100%;">
				<thead style="border-bottom: 1px rgba(128,128,128,0.25) solid;">
					<tr>
						<th style="padding:2%;">
							λ°°μ‘μ£Όμλ‘ μ μμ¬ν­
						</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="padding:3%;">
							<ul style="padding:0; list-style: none;">
								<li>
									 - λ°°μ‘ μ£Όμλ‘μ μ΅λ 10κ°κΉμ§ λ±λ‘ν  μ μμ΅λλ€.
								</li>
							</ul>
						</td>
					</tr>
				</tbody>
			</table>
			<table style="width:100%; border: 1px black solid; margin-top: 2%; height:50%;">
				<thead>
					<tr>
						<th><input type="checkbox" id="addressAllCheck"></th>
						<th>λ°°μ‘μ§λͺ</th>
						<th>μλ ΉμΈ</th>
						<th>μ νλ²νΈ</th>
						<th>μ£Όμ</th>
						<th>λ°°μ‘μ§ κ΄λ¦¬	</th>
					</tr>
				</thead>
				<tbody id="settingAddressList">
					<c:if test="${fn:length(addrList) eq 0}">
						<tr>
							<td colspan="6" style="text-align: center;">
								λ±λ‘λ μ£Όμκ° μμ΅λλ€.
							</td>
						</tr>
					</c:if>
					<c:forEach items='${addrList}' var="item">
						<tr data-addrNum="${item.addrNum}">
							<td>
								<input type="checkbox" class="addressSelect" data-addrNum='<c:out value="${item.addrNum}"></c:out>'>
							</td>
							<td><c:out value="${item.addrName}"></c:out></td>
							<td><c:out value="${item.recipient}"></c:out></td>
							<td><c:out value="${item.addrPhone}"></c:out></td>
							<td><c:out value="${item.fullAddress}"></c:out></td>
							<td><button class="addressAdapt" data-addrNum='<c:out value="${item.addrNum}"></c:out>'>μ μ©</button>
								<br><button class="addressRepareForm" data-addrNum='<c:out value="${item.addrNum}"></c:out>'>μμ </button>
							</td>		
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div style="margin-top:1%; text-align: center;">
				<button id="selectAddressDelete" style="margin-right:1.5%;">μ ν μ£Όμλ‘ μ­μ </button>
				<button id="addressAddButton">λ°°μ‘μ§λ±λ‘</button>
			</div>
		</div>
		
		<div id="addressChapter2" style="margin:2%; width:96%; display:none;">
			<table style="border: 1px rgba(128,128,128,0.5) solid; width: 100%;">
				<thead style="border-bottom: 1px rgba(128,128,128,0.25) solid;">
					<tr>
						<th style="padding:2%;">
							λ°°μ‘μ£Όμλ‘ μ μμ¬ν­
						</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="padding:3%;">
							<ul style="padding:0; list-style: none;">
								<li>
									 - λ°°μ‘ μ£Όμλ‘μ μ΅λ 10κ°κΉμ§ λ±λ‘ν  μ μμ΅λλ€.
								</li>
							</ul>
						</td>
					</tr>
				</tbody>
			</table>
			<table style="width:100%; border: 1px black solid; margin-top: 2%; height:50%;">
				<colgroup>
					<col width="20%">
					<col>
				</colgroup>
				<tbody>
					<tr>
						<td style="padding:1%;">
							λ°°μ‘μ§λͺ <img src="//img.echosting.cafe24.com/skin/base_ko_KR/order/ico_required.gif" alt="">
						</td>
						<td style="padding:1%;">
							<input type="text" id="insertAddressTitle">
						</td>
					</tr>
					<tr>
						<td style="padding:1%;">
							μ±λͺ <img src="//img.echosting.cafe24.com/skin/base_ko_KR/order/ico_required.gif" alt="">
						</td>
						<td style="padding:1%;">
							<input type="text" id="insertAddrRecipient">
						</td>
					</tr>
					<tr>
						<td style="padding:1%;">
							μ£Όμ <img src="//img.echosting.cafe24.com/skin/base_ko_KR/order/ico_required.gif" alt="">
						</td>
						<td style="padding:1%;">
							<input type="text" readonly="readonly" id="sample2_postcode" placeholder="μ°νΈλ²νΈ" style="width:25%;">
							<input type="button" onclick="sample2_execDaumPostcode()" value="μ°νΈλ²νΈ μ°ΎκΈ°"><br>
							<input type="text" readonly="readonly" id="sample2_address" style="width:65%" placeholder="μ£Όμ"><br>
							<input type="text" id="sample2_detailAddress" style="width:65%" placeholder="μμΈμ£Όμ">
							
							<!-- iOSμμλ position:fixed λ²κ·Έκ° μμ, μ μ©νλ μ¬μ΄νΈμ λ§κ² position:absolute λ±μ μ΄μ©νμ¬ top,leftκ° μ‘°μ  νμ -->
							<div id="layer" 
								style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
							<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" 
								style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" 
									onclick="closeDaumPostcode()" alt="λ«κΈ° λ²νΌ">
							</div>
						</td>
					</tr>
					<tr>
						<td style="padding:1%;">
							μ νλ²νΈ <img src="//img.echosting.cafe24.com/skin/base_ko_KR/order/ico_required.gif" alt="">
						</td>
						<td style="padding:1%;">
							<input type="text" style="width:25%;" id="insertAddrPhone1"> 
							- <input type="text" style="width:25%;" id="insertAddrPhone2"> 
							- <input type="text" style="width:25%;" id="insertAddrPhone3">
						</td>
					</tr>
				</tbody>
			</table>
			<div style="margin-top: 1%; text-align: right;">
				<button id="addThisAddress" data-role="edit" data-addrNum="" style="margin-right:1%;"></button>
				<button id="cancleAddAddress">μ·¨μ</button>
			</div>
		</div>
	</div>
	
	<div style="display:none; position: fixed; top:15%; left:30%; max-width:45%; max-height: 65%;" id="forAddCoupon" class="modal">
		<div style="margin:2%; width:96%;">
			<table style="width:100%; border: 1px rgba(128,128,128,0.5) solid;">
				<thead>
					<tr>
						<th style="padding:2%; border-bottom:1px rgba(128,128,128,0.25) solid;">μΏ ν° μ¬μ©μ λ°λ₯Έ μ£Όμμ¬ν­</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="padding:2%;">
							<ul style="list-style: none; padding:0;">
								<li>- μ¬μ© κ°λ₯ν μΏ ν°λ§ λ³΄μ¬μ§κ² λ©λλ€.</li>
								<li>- μΏ ν°μ νμλ±κΈ ν μΈ μ΄νμ μ μ©λλ―λ‘,</li>
								<li>&ensp;νμ¬ νμ΄μ§μμ λ³΄μ¬μ§λ νλ§€κ°μ μ€μ  μ μ©λλ κΈμ‘κ³Ό λ€λ₯Ό μ μμ΅λλ€.</li>
							</ul>
						</td>
					</tr>
				</tbody>
			</table>
			<table style="width:100%; border: 1px black solid; margin-top: 2%; height:60%;">
				<thead>
					<tr>
						<th style="text-align: center; padding:3%;">
							μΏ ν° ν μΈκΈμ‘
						</th>
					</tr>
					<tr>
						<th style="text-align: center; padding:2%;">
							<span style="font-size: 2rem;">
								KRW <span id="cuSalePrice1" style="font-size: 2.5rem;"><c:out value="0"></c:out></span>
							</span>
						</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="text-align: center; padding:3%;">
							- <select id="couponSelector">
								<option value="0" data-disRate="0" selected="selected">μ ννμΈμ.</option>
								<c:forEach items="${cuList}" var="item">
									<option value="${item.cuNum}" data-disRate="<c:out value='${item.couponspVO.disRate}'></c:out>">
										<c:out value="${item.couponspVO.cuName}"></c:out>
									</option>
								</c:forEach>
							</select>
						</td>
					</tr>
					<tr>
						<td style="text-align: right; padding:2%; border-top: 1px rgba(128,128,128,0.5) solid;">
							<strong>
								= μ΄ μΏ ν° ν μΈ κΈμ‘ :&ensp;KRW&ensp;
								<span id="cuSalePrice2" style="font-size: 1.8rem;"><c:out value="0"></c:out></span>
							</strong>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	
	<c:import url="${pageContext.request.contextPath}/WEB-INF/views/templates/footer.jsp"></c:import>
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/order/orderform.js"></script>
	<script type="text/javascript">
		var msg="${msg}";
		
		if(msg!=""){
			swal({
				icon:"info",
				title:"INFO",
				text:msg
			});
		}
	</script>
</body>
</html>