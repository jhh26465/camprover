<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>Insert title here</title>
        <style>
            .contents-inner2 {padding: 2.4rem;}
            .business .radioset-input:checked+.radioset-label::before {color: rgba(var(--main-ton-down-rgb), 1);background: white;}
            .unique {display: flex; align-items: center; margin-top:15px;}
            .unique {display: flex; align-items: center; margin-top:15px;}
            .unique > ul .radioset+.radioset {margin-left: 0;}
            .business {display: flex;flex-direction: column;align-items: stretch;}
            .radioset {display: flex;align-items: center;width: auto; max-width: 200px;}
            .radioset-input { margin-right: 5px; }
            .uniquetext {flex-grow: 1;text-align: left;width: 100px;}
            .radioset-input:checked+.radioset-label {background-color: #e0e0e0;}
            .unique > ul { display: flex;flex-wrap: wrap; gap: 10px; margin-bottom: -5px;} 

            .general_review_img_x_wrap{display: flex; margin-left: 150px;}
            .general_review_img_wrap{ display: flex; position: relative; width: 110px; padding:0px; margin-left: 7px; margin-bottom: 10px; }
            .general_review_img_wrap>img{ width:104px; border-radius: 4px; }
            .general_review_img_wrap>button{ position: absolute; top: 3px; right: 10px; border:none; background-color: transparent; color:#fff }
            .general_reivew_photo{ display: flex;
            justify-content: flex-end;  }
            .general_reivew_photo_btn{ width: 182px;margin-right: 60px; }
            .photo {display: flex;flex-direction: column;align-items: stretch; margin-top: 41px;}


        </style>
        <script>
           

        </script>
       <script>
           $(document).ready(function () {
                    updateCampInfo('bizrno0'); // 여기서 '0'은 첫 번째 캠핑장 정보에 해당하는 옵션의 value 값의 숫자 부분입니다.
                    });
           function updateCampInfo(selectedValue) {
                // 모든 폼을 숨깁니다.
                
               var forms = document.querySelectorAll('[id^="bizrno"]');
               forms.forEach(function(form) {
                   form.style.display = 'none';
                });
                
                // 선택된 캠핑장에 해당하는 폼만 보이도록 합니다.
                // 여기서 selectedValue는 option의 value 속성을 기반으로 하는데,
                // 실제 value와 form ID 사이에 일관된 매핑이 필요합니다.
                var selectedFormId = 'bizrno' + selectedValue.replace('bizrno', '');
                var selectedForm = document.getElementById(selectedFormId);
                if (selectedForm) {
                    selectedForm.style.display = 'block';
                    console.log("#"+selectedFormId);
                    
                }

                
                
            }
            
            //화로대 선택값 가져오기
            $(".selectset-item-brazierCl .btn").on("click", function() {
                let selectedValue = $(this).find("span").text().trim(); // 클릭한 버튼의 텍스트 값을 가져옴
                let form = $(this).closest("form"); // 클릭한 버튼이 속한 폼을 찾음
                let targetInput = form.find("#brazierCl"); // 해당 폼 내의 특정 입력 필드를 찾음

                targetInput.val(selectedValue); // 입력 필드의 값 업데이트
               
             });
            //화로대 선택값 가져오기
            $(".selectset-item-animalCmgCl .btn").on("click", function() {
                let selectedValue = $(this).find("span").text().trim(); // 클릭한 버튼의 텍스트 값을 가져옴
                let form = $(this).closest("form"); // 클릭한 버튼이 속한 폼을 찾음
                let targetInput = form.find("#animalCmgCl"); // 해당 폼 내의 특정 입력 필드를 찾음

                targetInput.val(selectedValue); // 입력 필드의 값 업데이트
               
             });
            //체험프로그램여부 선택값 가져오기
            $(".selectset-item-exprnProgrmAt .btn").on("click", function() {
                let selectedValue = $(this).find("span").text().trim(); // 클릭한 버튼의 텍스트 값을 가져옴
                let form = $(this).closest("form"); // 클릭한 버튼이 속한 폼을 찾음
                let targetInput = form.find("#exprnProgrmAt"); // 해당 폼 내의 특정 입력 필드를 찾음

                targetInput.val(selectedValue); // 입력 필드의 값 업데이트
               
             });
     
            function updateCamp(buttonElement) {
                var bizno = buttonElement.getAttribute('data-bizno');
                
                // 해당 사업자 번호에 맞는 폼을 찾습니다.
                var formId = 'bizrno' + bizno;
                var form = document.getElementById(formId);
                // FormData 객체를 사용하여 폼 데이터를 수집합니다.
                var formData = new FormData(form);
                for (var pair of formData.entries()) {
                    console.log(pair[0]+ ', ' + pair[1]);
                    
                }
                $.ajax({
                    type:"POST",
                    url: "mypage_container_ceo_business_modify.do",
                    data: formData,
                    contentType: false,
                    processData: false,
                    success: function (res_data) {
                        alert("수정되었습니다");
                        location.href=location.href;
                    //  $("#container_content").html(res_data);
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        console.table(jqXHR)
                    }
                    });
            }  
            // 파일중복선택
            function checkFileType(input) {
                const file = input.files[0];
                if (file) {
                    const fileType = file.type;
                    if (!fileType.startsWith('image/')) {
                        alert('이미지 파일을 선택해주세요.');
                        input.value = ''; // 파일 선택을 취소합니다.
                    }
                }
            }  
            // 화면상의 삭제
            function photo_del(pho_idx){
             
             if(confirm("정말 삭제하시겠습니까?\n수정하기를 눌러주셔야 수정됩니다.")==false) return;

           var pho_name = "pho_name_"+pho_idx;
           var img = "img_"+pho_idx;

           $("#"+pho_name).removeAttr('name');
           $("#"+img).hide();

                       
           }

       </script>
       <script>
        function business_insert_form(){
            $.ajax({
                type: "GET",
                url: "business_insert_form.do",
                success: function (res_data) {
                    $("#container_content").html(res_data);
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    console.table(jqXHR)
                }
            });

        }
       </script>
    </head>

    <body>
        <main class="th-layout-main">
            <div id="my_keep">
                <div class="my_info_title">내 캠핑장 </div>
                <div class="my_info_bizrno_list">
                    <select class="search_inquiry" name="search" id="search" onchange="updateCampInfo(this.value)">
                        <c:forEach items="${campCeoList}" var="campCeoList" varStatus="status">
                            <option value="bizrno${status.index}">${campCeoList.camps.facltNm}</option>
                        </c:forEach>                     
                    </select>
                    <input class="btnset btnset-round" type="button" value="캠핑장등록" onclick="business_insert_form();">
                </div>

                <!-- [S]mypage_container_info  -->
                <div id="info_content">
                    <c:forEach items="${campCeoList}" var="campCeo" varStatus="status">
                    <form id="bizrno${status.index}" style="display: none;" method="post" enctype="multipart/form-data">
                        <div class="glamping-N47" data-bid="KAltwpIVGl">
                            <div class="contents-inner2">
                                <div class="contents-container container-md">
                                    <div class="contents-top">
                                        <span>* 표시는 반드시 입력하셔야 하는 항목입니다</span>
                                    </div>

                                    <div class="contents-group">
                                        <input type="hidden"  name="bizrno" value="${campCeo.camps.bizrno}">
                                        <div class="business form-wrap">
                                            <h6 class="form-tit">사업자번호<span>*</span>
                                            </h6>
                                            <div class="contents-form-group">
                                                <div class="inputset inputset-round">
                                                    <input type="text" class="inputset-input form-control"
                                                        placeholder="000-00-00000 형식으로 입력하세요" aria-label="내용"
                                                        value="${campCeo.camps.bizrno}"readonly="true"
                                                        required="아이디">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="business form-wrap">
                                            <h6 class="form-tit">관광사업자번호
                                            </h6>
                                            <div class="contents-form-group">
                                                <div class="inputset inputset-round">
                                                    <input type="text" class="inputset-input form-control"
                                                        placeholder="제 0000-0000 호" aria-label="내용"
                                                        value="${campCeo.camps.trsagntNo}" name="trsagntNo"
                                                        required="아이디">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="business form-wrap">
                                            <h6 class="form-tit">휴장시작일
                                            </h6>
                                            <div class="contents-form-group">
                                                <div class="inputset inputset-round">
                                                    <input type="text" class="inputset-input form-control"
                                                        placeholder="YYYY-MM-DD" aria-label="내용"
                                                        value="${campCeo.camps.hvofBgnde}"name="hvofBgnde"
                                                        required="아이디">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="business form-wrap">
                                            <h6 class="form-tit">휴장종료일
                                            </h6>
                                            <div class="contents-form-group">
                                                <div class="inputset inputset-round">
                                                    <input type="text" class="inputset-input form-control"
                                                        placeholder="YYYY-MM-DD" aria-label="내용"
                                                        value="${campCeo.camps.hvofEnddle}" name="hvofEnddle"
                                                        required="아이디">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="business form-wrap">
                                            <h6 class="form-tit">업종 <span>*</span>
                                            </h6>
                                            <div class="inputset inputset-round">
                                                <input type="text" class="inputset-input form-control" aria-label="내용"
                                                value="${campCeo.camps.induty}" name="induty"
                                                    required="">
                                            </div>
                                        </div>
                                        <div class="business form-wrap">
                                            <h6 class="form-tit">캠핑장명 <span>*</span>
                                            </h6>
                                            <div class="inputset inputset-round">
                                                <input type="text" class="inputset-input form-control" aria-label="내용"
                                                value="${campCeo.camps.facltNm}"name="facltNm"
                                                    required="">
                                            </div>
                                        </div>
                                        <div class="business form-wrap">
                                            <h6 class="form-tit">연락처 <span>*</span>
                                            </h6>
                                            <div class="inputset inputset-round">
                                                <input type="text" class="inputset-input form-control" aria-label="내용"
                                                value="${campCeo.camps.tel}"name="tel"
                                                    placeholder="-없이 번호를 입력해주세요" required="">
                                            </div>
                                        </div>
                                        <div class="business form-wrap">
                                            <h6 class="form-tit">주소 <span>*</span>
                                            </h6>
                                            <div class="contents-address">
                                                <div class="contents-form-group">
                                                    <div class="inputset inputset-round">
                                                        <input type="text" class="inputset-input form-control"
                                                        value="${campCeo.camps.addr1}"name="addr1"
                                                            aria-label="내용">
                                                    </div>
                                                    <input class="btnset btnset-round btnset-line" type="button"
                                                        value="우편번호 검색">
                                                </div>
                                                <div class="inputset inputset-round">
                                                    <input type="text" class="inputset-input form-control"
                                                    value="${campCeo.camps.addr2}"name="addr2"
                                                        aria-label="내용" required="">
                                                </div>
                                            </div>
                                        </div>
                                        
                                        <div class="business form-wrap">
                                            <h6 class="form-tit">한줄소개 <span>*</span>
                                            </h6>
                                            <div class="inputset inputset-round">
                                                <input type="text" class="inputset-input form-control" aria-label="내용"
                                                value="${campCeo.camps.lineIntro}"name="lineIntro"
                                                    required="">
                                            </div>
                                        </div>
                                        <div class="business form-wrap">
                                            <h6 class="form-tit">특징 <span></span>
                                            </h6>
                                            <div class="inputset inputset-round">
                                                <input type="text" class="inputset-input form-control" aria-label="내용"
                                                value="${campCeo.camps.featureNm}"name="featureNm"
                                                    required="">
                                            </div>
                                        </div>
                                        <div class="business form-wrap">
                                            <h6 class="form-tit">홈페이지
                                            </h6>
                                            <div class="inputset inputset-round">
                                                <input type="text" class="inputset-input form-control" aria-label="내용"
                                                value="${campCeo.camps.homepage}"name="homepage"
                                                    required="">
                                            </div>
                                        </div>
                                        <div class="business form-wrap">
                                            <h6 class="form-tit">예약구분<span style="font-size: 15px;">(, 구분 필수)</span>
                                            </h6>
                                            <div class="inputset inputset-round">
                                                <input type="text" placeholder="예시:전화,온라인예약대기,온라인실시간예약,현장" class="inputset-input form-control" aria-label="내용"
                                                value="${campCeo.camps.resveCl}"name="resveCl"
                                                    required="">
                                            </div>
                                        </div>
                                        <div class="business form-wrap">
                                            <h6 class="form-tit">예약페이지 <span></span>
                                            </h6>
                                            <div class="inputset inputset-round">
                                                <input type="text" class="inputset-input form-control" aria-label="내용"
                                                value="${campCeo.camps.resveUrl}"name="resveUrl"
                                                    required="">
                                            </div>
                                        </div>

                                        <div class="business form-wrap">
                                            <h6 class="form-tit">입지구분<span style="font-size: 15px;">(, 구분 필수)</span>
                                            </h6>
                                            <div class="inputset inputset-round">
                                                <input type="text" placeholder="예시:해변,산,숲,계곡,강,호수"
                                                value="${campCeo.camps.lctCl}"name="lctCl"
                                                class="inputset-input form-control" aria-label="내용"
                                                    required="">
                                            </div>
                                        </div>


                                        <div class="business form-wrap">
                                            <h6 class="form-tit">주요시설(일반야영장) <span></span>
                                            </h6>
                                            <div class="inputset inputset-round">
                                                <input type="text" placeholder="숫자를 입력하세요" 
                                                value="${campCeo.camps.gnrlSiteCo}"name="gnrlSiteCo"
                                                class="inputset-input form-control" aria-label="내용"
                                                    required="">
                                            </div>
                                        </div>
                                        <div class="business form-wrap">
                                            <h6 class="form-tit">주요시설(자동차야영장)<span></span>
                                            </h6>
                                            <div class="inputset inputset-round">
                                                <input type="text" placeholder="숫자를 입력하세요" 
                                                value="${campCeo.camps.autoSiteCo}"name="autoSiteCo"
                                                class="inputset-input form-control" aria-label="내용"
                                                    required="">
                                            </div>
                                        </div>
                                        <div class="business form-wrap">
                                            <h6 class="form-tit">주요시설(글램핑)<span></span>
                                            </h6>
                                            <div class="inputset inputset-round">
                                                <input type="text" placeholder="숫자를 입력하세요" 
                                                value="${campCeo.camps.glampSiteCo}"name="glampSiteCo"
                                                class="inputset-input form-control" aria-label="내용"
                                                    required="">
                                            </div>
                                        </div>
                                        <div class="business form-wrap">
                                            <h6 class="form-tit">주요시설(카라반)<span></span>
                                            </h6>
                                            <div class="inputset inputset-round">
                                                <input type="text" placeholder="숫자를 입력하세요"
                                                value="${campCeo.camps.caravSiteCo}"name="caravSiteCo"
                                                 class="inputset-input form-control" aria-label="내용"
                                                    required="">
                                            </div>
                                        </div>
                                        <div class="business form-wrap">
                                            <h6 class="form-tit">내부시설(글램핑)<span style="font-size: 15px;">(, 구분 필수)</span>
                                            </h6>
                                            <div class="inputset inputset-round">
                                                <input type="text" placeholder="예시:침대,TV,에어컨,냉장고,유무선인터넷,난방기구,취사도구,내부화장실,내부샤워실" 
                                                value="${campCeo.camps.glampInnerFclty}"name="glampInnerFclty"
                                                class="inputset-input form-control" aria-label="내용"
                                                    required="">
                                            </div>
                                        </div>
                                        <div class="business form-wrap">
                                            <h6 class="form-tit">내부시설(카라반)<span style="font-size: 15px;">(, 구분 필수)</span>
                                            </h6>
                                            <div class="inputset inputset-round">
                                                <input type="text" placeholder="예시:침대,TV,에어컨,냉장고,유무선인터넷,난방기구,취사도구,내부화장실,내부샤워실" 
                                                value="${campCeo.camps.caravInnerFclty}"name="caravInnerFclty"
                                                class="inputset-input form-control" aria-label="내용"
                                                    required="">
                                            </div>
                                        </div>
                                        <div class="business form-wrap">
                                            <h6 class="form-tit">캠핑장비대여<span style="font-size: 15px;">(, 구분 필수)</span>
                                            </h6>
                                            <div class="inputset inputset-round">
                                                <input type="text" placeholder="예시:텐트,릴선,화로대,난방기구,식기,침낭" 
                                                value="${campCeo.camps.eqpmnLendCl}"name="eqpmnLendCl"
                                                class="inputset-input form-control" aria-label="내용"
                                                    required="">
                                            </div>
                                        </div>


                                        <div class="business form-wrap">
                                            <h6 class="form-tit">화장실개수
                                            </h6>
                                            <div class="inputset inputset-round">
                                                <input type="text" class="inputset-input form-control" 
                                                value="${campCeo.camps.toiletCo}"name="toiletCo"
                                                aria-label="내용"
                                                    required="">
                                            </div>
                                        </div>
                                        <div class="business form-wrap">
                                            <h6 class="form-tit">샤워실개수
                                            </h6>
                                            <div class="inputset inputset-round">
                                                <input type="text" class="inputset-input form-control" 
                                                value="${campCeo.camps.swrmCo}"name="swrmCo"
                                                aria-label="내용"
                                                    required="">
                                            </div>
                                        </div>
                                        <div class="business form-wrap">
                                            <h6 class="form-tit">개수대개수
                                            </h6>
                                            <div class="inputset inputset-round">
                                                <input type="text" class="inputset-input form-control" 
                                                value="${campCeo.camps.wtrplCo}"name="wtrplCo"
                                                aria-label="내용"
                                                    required="">
                                            </div>
                                        </div>
                                        <div class="business form-wrap">
                                            <h6 class="form-tit">부대시설 <span>*</span> <span style="font-size: 15px;">(, 구분 필수)</span>
                                            </h6>
                                            <div class="inputset inputset-round">
                                                <input type="text" placeholder="예시:전기,무선인터넷,장작판매,온수,트렘폴린,기타 " 
                                                value="${campCeo.camps.sbrsCl}"name="sbrsCl"
                                                class="inputset-input form-control" aria-label="내용"
                                                    required="">
                                            </div>
                                        </div>
                                        <div class="business form-wrap">
                                            <h6 class="form-tit">부대시설기타<span style="font-size: 15px;">(, 구분 필수)</span></h6>
                                            <div class="inputset inputset-round">
                                                <input type="text" placeholder="예시:음식점,영농체험장,고카트트랙 등" 
                                                value="${campCeo.camps.sbrsEtc}"name="sbrsEtc"
                                                class="inputset-input form-control" aria-label="내용"
                                                    required="">
                                            </div>
                                        </div>

                                        <div class="business form-wrap">
                                            <input type="hidden" id="exprnProgrmAt" name="exprnProgrmAt" value="${campCeo.camps.exprnProgrmAt}">
                                            <h6 class="form-tit">체험프로그램여부</h6>
                                            <div class="form-wrap"name="hvofBgnde">
                                                <div class="selectset selectset-round selectset-md">
                                                  <button class="selectset-toggle btn" type="button">
                                                    <span>${campCeo.camps.exprnProgrmAt}</span>
                                                  </button>
                                                  <ul class="selectset-list">
                                                    <li class="selectset-item-exprnProgrmAt">
                                                      <button class="selectset-y btn" type="button" >
                                                        <span>y</span>
                                                      </button>
                                                    </li>
                                                    <li class="selectset-item-exprnProgrmAt">
                                                      <button class="selectset-y btn" type="button" >
                                                        <span>n</span>
                                                      </button>
                                                    </li>
                                                  </ul>
                                                </div>
                                              </div>

                                        </div>

                                        <div class="business form-wrap">
                                            <h6 class="form-tit">체험프로그램명<span style="font-size: 15px;">(, 구분 필수)</span>
                                            </h6>
                                            <div class="inputset inputset-round">
                                                <input type="text" placeholder="예시:래프팅,영농 체험,고카트 체험 등" 
                                                value="${campCeo.camps.exprnProgrm}"name="exprnProgrm"
                                                class="inputset-input form-control" aria-label="내용"
                                                    required="">
                                            </div>
                                        </div>
                                        <div class="business form-wrap">
                                            <h6 class="form-tit">테마환경<span style="font-size: 15px;">(, 구분 필수)</span>
                                            </h6>
                                            <div class="inputset inputset-round">
                                                <input type="text" placeholder="예시:일출명소,일몰명소,수상레저" 
                                                value="${campCeo.camps.themaEnvrnCl}"name="themaEnvrnCl"
                                                class="inputset-input form-control" aria-label="내용"
                                                    required="">
                                            </div>
                                        </div>
                                        



                                        <!-- -------------------------------------------------------------------------------------------------------------------->


                                        <div class="business form-wrap">
                                            <input type="hidden"  id="brazierCl" name="brazierCl" value="${campCeo.camps.brazierCl}">
                                            <div class="unique">
                                                <h6 class="form-tit">화로대<span>*</span></h6>
                                                <div class="form-wrap">
                                                    <div class="selectset selectset-round selectset-md">
                                                      <button class="selectset-toggle btn" type="button" id="${status.index}">
                                                        <span>${campCeo.camps.brazierCl}</span>
                                                      </button>
                                                      <ul class="selectset-list">
                                                        <li class="selectset-item-brazierCl">
                                                          <button class="selectset-y btn" type="button" >
                                                            <span>개별</span>
                                                          </button>
                                                        </li>
                                                        <li class="selectset-item-brazierCl">
                                                          <button class="selectset-y btn" type="button" >
                                                            <span>공동취사장</span>
                                                          </button>
                                                        </li>
                                                        <li class="selectset-item-brazierCl">
                                                          <button class="selectset-y btn" type="button" >
                                                            <span>불가</span>
                                                          </button>
                                                        </li>
                                                        <li class="selectset-item-brazierCl">
                                                          <button class="selectset-y btn" type="button" >
                                                            <span>기타</span>
                                                          </button>
                                                        </li>
                                                      </ul>
                                                    </div>
                                                  </div>
                                            </div>
                                        </div>

                                        <div class="business form-wrap">
                                            <input type="hidden" id="animalCmgCl" name="animalCmgCl" value="${campCeo.camps.animalCmgCl}">
                                            <div class="unique">
                                                <h6 class="form-tit">애견동물출입<span>*</span></h6>
                                                <div class="form-wrap">
                                                    <div class="selectset selectset-round selectset-md">
                                                      <button class="selectset-toggle btn" type="button">
                                                        <span>${campCeo.camps.animalCmgCl}</span>
                                                      </button>
                                                      <ul class="selectset-list">
                                                        <li class="selectset-item-animalCmgCl">
                                                          <button class="selectset-y btn" type="button" >
                                                            <span>개별문의</span>
                                                          </button>
                                                        </li>
                                                        <li class="selectset-item-animalCmgCl">
                                                          <button class="selectset-y btn" type="button" >
                                                            <span>가능</span>
                                                          </button>
                                                        </li>
                                                        <li class="selectset-item-animalCmgCl">
                                                          <button class="selectset-y btn" type="button" >
                                                            <span>가능(소형견)</span>
                                                          </button>
                                                        </li>
                                                        <li class="selectset-item-animalCmgCl">
                                                          <button class="selectset-y btn" type="button" >
                                                            <span>불가능</span>
                                                          </button>
                                                        </li>
                                                      </ul>
                                                    </div>
                                                  </div>
                                            </div>
                                        </div>
                                        
                                        <div class="business form-wrap">
                                            
                                            <h6 class="form-tit">사이트바닥재<span style="font-size: 15px;">(숫자만 입력하세요)</span></h6>
                                            <div class="unique">
                                                <div class="form-wrap">
                                                <div class="inputset inputset-round">
                                                    <div class="site_wrap" style="display: flex; align-items: center;" >
                                                        <div class="site" style="font-size: var(--fs-p1); width: 60px; margin-right: 10px;">잔디</div>
                                                        <input type="text" placeholder="" 
                                                        value="${campCeo.camps.siteBottomCl1}"name="siteBottomCl1"
                                                        class="inputset-input form-control" aria-label="내용"
                                                            required="">
                                                    </div>
                                                </div>
                                                <div class="inputset inputset-round">
                                                    <div class="site_wrap" style="display: flex; align-items: center;" >
                                                        <div class="site" style="font-size: var(--fs-p1); width: 107px; margin-left: 10px; margin-right: 10px;">파쇄석</div>
                                                        <input type="text" placeholder="" 
                                                        value="${campCeo.camps.siteBottomCl2}"name="siteBottomCl2"
                                                        class="inputset-input form-control" aria-label="내용"
                                                            required="">
                                                    </div>
                                                </div>
                                                <div class="inputset inputset-round">
                                                    <div class="site_wrap" style="display: flex; align-items: center;" >
                                                        <div class="site" style="font-size: var(--fs-p1); width: 60px; margin-left: 10px; margin-right: 10px;">테크</div>
                                                        <input type="text" placeholder="" 
                                                        value="${campCeo.camps.siteBottomCl3}"name="siteBottomCl3"
                                                        class="inputset-input form-control" aria-label="내용"
                                                            required="">
                                                    </div>
                                                </div>
                                                <div class="inputset inputset-round">
                                                    <div class="site_wrap" style="display: flex; align-items: center;" >
                                                        <div class="site" style="font-size: var(--fs-p1); width: 60px; margin-left: 10px; margin-right: 10px;">자갈</div>
                                                        <input type="text" placeholder="" 
                                                        value="${campCeo.camps.siteBottomCl4}"name="siteBottomCl4"
                                                        class="inputset-input form-control" aria-label="내용"
                                                            required="">
                                                    </div>
                                                </div>
                                                <div class="inputset inputset-round">
                                                    <div class="site_wrap" style="display: flex; align-items: center;" >
                                                        <div class="site" style="font-size: var(--fs-p1); width: 60px; margin-left: 10px; margin-right: 10px;">맨흙</div>
                                                        <input type="text" placeholder="" 
                                                        value="${campCeo.camps.siteBottomCl5}"name="siteBottomCl5"
                                                        class="inputset-input form-control" aria-label="내용"
                                                            required="">
                                                    </div>
                                                </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="photo">
                                            <h6 class="form-tit">대표이미지<span style="font-size: 15px;">(최대 20장)</span></h6>
                                            <div class="general_review_img_x_wrap">
                                                <c:forEach var="photo_vo" items="${campCeo.camps.photo_list}">
                                                    <div class="general_review_img_wrap" style="display: flex;" id="img_${photo_vo.pho_idx}">
                                                        <input type="hidden" name="photo_idx" value="${photo_vo.pho_idx}" id="pho_name_${photo_vo.pho_idx}">
                                                        <img src="${pageContext.request.contextPath}/camp_photo_upload/${photo_vo.pho_name}">
                                                        <p class="pho_name_btn pho_name_a_${photo_vo.bizrno}" ><a style="cursor: pointer;" onclick="photo_del('${photo_vo.pho_idx}');">X</a></p>
                                                    </div>
                                                </c:forEach>                                                                                           
                                            </div>
                                        </div>

                                        <div class="general_reivew_photo">
                                            <input type="file" class="general_reivew_photo_btn" name="photo"accept="image/*" style="cursor: pointer;" onchange="checkFileType(this)" multiple="multiple">
                                        </div>
                                        
                                        


                                    </div>
                                    <div class="contents-btn-group">
                                        <input type="button" class="btnset btnset-round" value="수정"onclick="updateCamp(this)" data-bizno="${status.index}">
                                        
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </c:forEach>
                </div>
                <!-- [E]mypage_container_info  -->
            </div>
        </main>
    </body>

    </html>