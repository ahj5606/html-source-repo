<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원 관리 - [수정구현]</title>
<%@ include file="./JEasyUICommon.jsp" %>
<style type="text/css">
	#d_btn{
		position: absolute;
		bottom: 0px;
		right:10px;
	}
</style>
<script type="text/javascript">
	//여기가 전변자리이다.
	//전역변수는 그 페이지내에서 계속 유지되므로 업무 프로세스가 새로 시작할땐 처음값으로 초기화.
	function emp_ins(){
		//화면에서 입력받은 값은 http프로토콜을 이용해서 서버쪽으로 전송되는대 이때 유니코드로 변환
		//되어 전달됨.
		//해결방법 - server.xml문서에 포트번호 설정 위치(63번라인) URIEncoding="UTF-8"
		//단 get방식에만 적용됨 post방식일때는 java코드를 활용하여 별도 처리
		$("#f_ins").attr("method","get");
		$("#f_ins").attr("action","empInsert.jsp");
		$("#f_ins").submit();
	};
	function btn_emp_upd(){
		$("#f_upd").attr("method","get");
		$("#f_upd").attr("action","empUpdate.jsp");
		$("#f_upd").submit();
	}
	function upd_btn_close(){
		$("#dlg_upd").dialog('close');
	};
	function btn_close(){
		$("#dlg_ins").dialog('close');
	};
	function empINS(){
		$("#dlg_ins").dialog({
			title: '사원정보 등록'
			,closed: false
		});
	}
	function empUPD(){
		var check = $("#dg_emp").datagrid('getChecked');
		if(check.length>1){
			$.messager.alert('Info',"한번에 한명의 사원만 수정할 수 있습니다.");
		}else
		if(check.length<=0){
			$.messager.alert('Info',"수정할 사원을 선택해 주세요.");
		}else{
			var param ="empno="+check[0].EMPNO;
			$("#dlg_upd").dialog('open');
			$.ajax({
				url:'jsonEmpList.jsp'
				,data:param
				,method:'post'
				,dataType:'json'
				,success:function(result){
					var str = JSON.stringify(result);
					var jsondoc = JSON.parse(str);
					$("#upd_empno").textbox('setValue',jsondoc[0].EMPNO);
					$("#upd_ename").textbox('setValue',jsondoc[0].ENAME);
					$("#upd_job").textbox('setValue',jsondoc[0].JOB);
					$("#upd_hiredate").textbox('setValue',jsondoc[0].HIREDATE);
					$("#upd_sal").textbox('setValue',jsondoc[0].SAL);
					$("#upd_comm").textbox('setValue',jsondoc[0].COMM);
					$("#upd_deptno").combobox('setValue',jsondoc[0].DEPTNO);
				}
			});
		}
	}
	function empDEL(){
		/* $("#dlg_del").dialog({
			title: '사원 삭제'
			,closed: false
		}); */
		var empnos =[];
		var rows = $("#dg_emp").datagrid('getSelections');
		for(var i=0;i<rows.length;i++){
			empnos.push(rows[i].EMPNO);
		}
		alert(empnos.join());
	}
	
	function dongfind(){
		var dong=$("#_easyui_textbox_input1").val();
		if(dong=="동이름이나 주소 정보 입력.." || dong.length<1 || dong==null){
			alert("동을 입력하세요.");
			return;
		}else{
			zipcodeRefresh();
		}
		
		
	}
	function zipcodeRefresh(){
		var dong=$("#_easyui_textbox_input1").val();
		$('#dg_zipcode').datagrid({
		    url:'jsonZipcodeList.jsp?dong='+dong
		    ,singleSelect:true
			,onDblClickRow:function(index,row){
				var zipcode = row.ZIPCODE;
				var address = row.ADDRESS;
				$("#zipcode").textbox('setValue',zipcode);
				$("#mem_addr").textbox('setValue',address);
				$("#dlg_zipcode").dialog({
					closed:true
				})
			}
			/* ,onDblClickCell:function(index,field,value){
				if("ZIPCODE"==field){
					
				}
			} */
		});
	}
	function empList(){
		$('#dg_emp').datagrid({
			url:'jsonEmpList.jsp'
			,onLoadSuccess:function(data){
				var result = JSON.stringify(data);
				alert("새로고침 처리 성공 : "+data+" , "+result);
			}
			 
		});
	};
	function getRowIndex(target){
	    var tr = $(target).closest('tr.datagrid-row');
	    return parseInt(tr.attr('datagrid-row-index'));
	}
	function editrow(target){
	    $('#dg_emp').datagrid('beginEdit', getRowIndex(target));
	}
	function deleterow(target){
	    $.messager.confirm('Confirm','Are you sure?',function(r){
	        if (r){
	            $('#dg_emp').datagrid('deleteRow', getRowIndex(target));
	        }
	    });
	}
	function saverow(target){
	    $('#dg_emp').datagrid('endEdit', getRowIndex(target));
	   	
	}
	function cancelrow(target){
	    $('#dg_emp').datagrid('cancelEdit', getRowIndex(target));
	}
	function empnonSearch(){
		var s_empno =$("#s_empno").val();
		$("#dg_emp").datagrid({
			url:'jsonEmpList.jsp?empno='+s_empno
		})
	}
</script>
</head>
<body>
<!--========================== 검색 조건 추가하기 시작 ====================================  -->
<div id="tbar_emp">
	<form id="f_search">
		<table>
			<tr>
				<td width="190px">
					<label width="80px">사원번호</label>
					<input id="s_empno" name="s_empno" class="easyui-searchbox"  data-options="prompt:'사원번호' , searcher:empnonSearch" style="width:120px">
				</td>
			</tr>
			<tr>
				<td>
			        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="empList()">사원 조회</a>
			        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="empINS()">사원 등록</a>
			        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="empUPD()">사원 수정</a>
			        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="empDEL()">사원 삭제</a>
				</td>
			</tr>
		</table>
	</form>
</div>

<!--========================== 검색 조건 추가하기 끝 ====================================  -->

   <table id="dg_emp"></table>
<script type="text/javascript">
	$(document).ready(function(){
		$("#dong").textbox('textbox').bind('keydown', function(e){
			if (e.keyCode == 13){
				zipcodeRefresh();
			}
		});
		$("#dg_zipcode").datagrid({
			title:'우편번호'
		});
		$("#dlg_upd").dialog({
			closed:true
			,modal: true
		});
		$("#dlg_ins").dialog({
			modal: true
		});
		$("#dlg_del").dialog({
			modal: true
		});
		$("#btn_zipcode").linkbutton({
			onClick:function(){
				$("#dlg_zipcode").dialog('open');
			}
		});
		$('#dg_zipcode').datagrid({
		    columns:[[
		       {field:'ZIPCODE',title:'우편번호',width:120,align:'center'}
		       ,{field:'ADDRESS',title:'주소',width:350,align:'left'  }
		    ]]
		});
		$('#dg_emp').datagrid({
			toolbar: '#tbar_emp'
			,width:1200
			,hegith:850
			,title:'사원테이블'
			,columns:[[
			    {field:'ck',checkbox:true,width:50,align:'center'}
			    ,{field:'EMPNO',title:'사원번호',width:100,align:'center',editor:'numberbox'}
			    ,{field:'ENAME',title:'사원이름',width:100,align:'center',editor:'text'}
			    ,{field:'JOB',title:'JOB',width:100,align:'center',editor:'text'}
			    ,{field:'HIREDATE',title:'입사일자',width:200,align:'center',editor:'text'}
			    ,{field:'MGR',title:'MGR',width:90,align:'center',editor:'numberbox' ,hidden:'true'}
			    ,{field:'SAL',title:'급여',width:100,align:'center',editor:'numberbox'}
			    ,{field:'COMM',title:'인센티브',width:100,align:'center',editor:'numberbox'}
			    ,{field:'DEPTNO',title:'부서번호',width:100,align:'center'
			   		,editor:{
			   			type:'combobox'
			   			,options:{
								url:'jsonDeptList.jsp'
								,valueField: 'DEPTNO'//실제 서버에 넘어가는 필드
								,textField: 'DNAME'//화면에 출력되는 필드
								,required: true
						    }///////////end of options
				   		}//end of editor
			    	}
			    ,{field:'action',title:'Action',width:180,align:'center',
	                formatter:function(value,row,index){
	                    if (row.editing){
	                        var s = '<a href="javascript:void(0)" onclick="saverow(this)">Save</a> ';
	                        var c = '<a href="javascript:void(0)" onclick="cancelrow(this)">Cancel</a>';
	                        return s+c;
	                    } else {
	                        var e = '<a href="javascript:void(0)" onclick="editrow(this)">Edit</a> ';
	                        var d = '<a href="javascript:void(0)" onclick="deleterow(this)">Delete</a>';
	                        return e+d;
	                    }
	                }
	            }
			]]
			,onEndEdit:function(index,row){
	            var ed = $(this).datagrid('getEditor', {
	                index: index,
	                field: 'productid'
	            });
	            row.productname = $(ed.target).combobox('getText');
	        },
	        onBeforeEdit:function(index,row){
	            row.editing = true;
	            $(this).datagrid('refreshRow', index);
	        },
	        onAfterEdit:function(index,row){
	            row.editing = false;
	            $(this).datagrid('refreshRow', index);
	        },
	        onCancelEdit:function(index,row){
	            row.editing = false;
	            $(this).datagrid('refreshRow', index);
	        }
		}); 
	});

</script>
    <!--=================== 우편번호 찿기 시작 ============================= -->
	<div id="dlg_zipcode" class="easyui-dialog" data-options="closed:true,title:'우편번호 찿기'" style="width:100%; max-width:550px; height:400px; padding:30px 30px">
		<input id="dong" name="dong" label="동이름" class="easyui-textbox" labelPosition="top" data-options="prompt:'동이름이나 주소 정보 입력..'" style="width:230;">
		<a id="btn_dong" href="javascript:dongfind();" class="easyui-linkbutton">찿기</a>
		<div></div>
		<table id="dg_zipcode" class="easyui-datagrid"></table>
	</div>
    <!--=================== 우편번호 찿기 끝 ============================= -->
    <!--=================== 사원등록 시작 ============================= -->
   	<div id="dlg_ins" data-options="closed:true" class="easyui-dialog" style="width:100%;max-width:480px;padding:30px 60px;">
   		<form id="f_ins">
			<div style="margin-bottom:10px;">
				<input class="easyui-textbox" id="empno" name="empno" label="사원번호" data-options="prompt:'Enter a EmpNO'" style="width:150px;"/>
			</div>
			<div style="margin-bottom:10px;">
				<input class="easyui-textbox" id="ename" name="ename" label="사원명" data-options="prompt:'Enter a Ename'" style="width:250px;"/>
			</div>
			<div style="margin-bottom:10px;">
				<input class="easyui-textbox" id="job" name="job" label="JOB" data-options="prompt:'Enter a JOB'" style="width:250px;"/>
			</div>
			<div style="margin-bottom:10px;">
				<input class="easyui-textbox" id="hiredate" name="hiredate" label="입사 일자" data-options="prompt:'Enter a hiredate'" style="width:300px;"/>
			</div>
			<div style="margin-bottom:10px;">
				<input class="easyui-textbox" id="sal" name="sal" label="급여" data-options="prompt:'Enter a SAL'" style="width:250px;"/>
			</div>
			<div style="margin-bottom:10px;">
				<input class="easyui-textbox" id="comm" name="comm" label="인센티브" data-options="prompt:'Enter a COMM'" style="width:250px;"/>
			</div>
			<div style="margin-bottom:10px;">
				<input class="easyui-combobox" id="deptno" name="deptno" label="부서번호" 
				data-options="prompt:'Enter a DEPTNO'
						,valueField:'DEPTNO'
						,textField:'DNAME'
						,url:'jsonDeptList.jsp'
						,onSelect:function(rec){
						}" 
					 style="width:250px;"/>
			</div>
			<div style="margin-bottom:10px;">
				<input class="easyui-textbox" id="zipcode" name="zipcode" label="우편번호" labelPosition="top" data-options="prompt:'Enter a ZIPCODE' ,readonly:true" style="width:220px;"/>
				<a id="btn_zipcode" class="easyui-linkbutton">우편번호 찿기</a>
			</div>
			<div style="margin-bottom:10px;">
				<input class="easyui-textbox" id="mem_addr" name="mem_addr" label="주소" labelPosition="top" data-options="prompt:'Enter a ADDRESS'" style="width:400px;"/>
			</div>	
			<div id="d_btn" style="margin-bottom:10px;">
				<a id="btn_save" href ="javascript:emp_ins()" class="easyui-linkbutton" data-options="iconCls:'icon-save'">저장</a>
				<a id="btn_cancel" href ="javascript:btn_close()" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'">닫기</a>
			</div>
   		</form>
   	</div>
    <!--=================== 사원등록 끝 ============================= -->
    <!--=================== 사원수정 시작 ============================= -->
   	<div id="dlg_upd" class="easyui-dialog" data-options="footer:'#b_upd'" style="width:100%;max-width:480px;padding:30px 60px;">
   		<form id="f_upd">
   					<div style="margin-bottom:10px;">
				<input class="easyui-textbox" id="upd_empno" name="upd_empno" label="사원번호" data-options="prompt:'Enter a EmpNO' ,readonly:true" style="width:150px;"/>
			</div>
			<div style="margin-bottom:10px;">
				<input class="easyui-textbox" id="upd_ename" name="upd_ename" label="사원명" data-options="prompt:'Enter a Ename'" style="width:250px;"/>
			</div>
			<div style="margin-bottom:10px;">
				<input class="easyui-textbox" id="upd_job" name="upd_job" label="JOB" data-options="prompt:'Enter a JOB'" style="width:250px;"/>
			</div>
			<div style="margin-bottom:10px;">
				<input class="easyui-textbox" id="upd_hiredate" name="upd_hiredate" label="입사 일자" data-options="prompt:'Enter a hiredate'" style="width:300px;"/>
			</div>
			<div style="margin-bottom:10px;">
				<input class="easyui-textbox" id="upd_sal" name="upd_sal" label="급여" data-options="prompt:'Enter a SAL'" style="width:250px;"/>
			</div>
			<div style="margin-bottom:10px;">
				<input class="easyui-textbox" id="upd_comm" name="upd_comm" label="인센티브" data-options="prompt:'Enter a COMM'" style="width:250px;"/>
			</div>
			<div style="margin-bottom:10px;">
				<input class="easyui-combobox" id="upd_deptno" name="upd_deptno" label="부서번호" 
				data-options="prompt:'Enter a DEPTNO'
						,valueField:'DEPTNO'
						,textField:'DNAME'
						,url:'jsonDeptList.jsp'
						,onSelect:function(rec){
						}" 
					 style="width:250px;"/>
			</div>
			<div id="b_upd" style="margin-bottom:10px;">
				<a id="btn_upd" href ="javascript:btn_emp_upd()" class="easyui-linkbutton" data-options="iconCls:'icon-save'">저장</a>
				<a id="btn_upd_cancle" href ="javascript:upd_btn_close()" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'">닫기</a>
			</div>
   		</form>
   	</div>
<%
	//수정처리가 완료된거니?
	String mode = request.getParameter("upd");
	if("update".equals(mode)){
%>
	   	<script type="text/javascript">
	   		empList();
	   	</script>
<%
	}
%>
    <!--=================== 사원수정 끝 ============================= -->
    <!--=================== 사원삭제 시작 ============================= -->
   	<div id="dlg_del" data-options="closed:true" class="easyui-dialog" style="width:100%;max-width:480px;padding:30px 60px;">
   		<form id="f_del">
   			삭제
   		</form>
   	</div>
    <!--=================== 사원삭제 끝 ============================= -->
</body>
</html>