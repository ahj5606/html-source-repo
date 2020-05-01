<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원 관리 - [jEasyUI활용]</title>
<%@ include file="./JEasyUICommon.jsp" %>
<script type="text/javascript">
	function empINS(){
		$("#dlg_ins").dialog({
			title: '사원 등록'
			,closed: false
		});
	}
	function empUPD(){
		$("#dlg_upd").dialog({
			title: '사원 수정'
			,closed: false
		});
	}
	function empDEL(){
		$("#dlg_del").dialog({
			title: '사원 삭제'
			,closed: false
		});
	}
	function zipfind(){
		$("#dlg_zipcode").dialog({
			title:'우편번호 찿기'
			,closed:false
		});
	}
	function dongfind(){
		var str=$("#_easyui_textbox_input1").val();
		alert(str);
		$.ajax({
			url:'jsonZipcodeList.jsp'
			,method:"post"
			,dataType:"json"
			,data:"dong="+str
			,success:function(result){
				var str = JSON.stringify(result);
				var jsonData = JSON.parse(str);
				var ahtml = ' <table border="1" borderColor="green" width="1200px"><tr><td>시도</td><td>시구</td><td>동</td><td>리</td><td>번지</td><td>우편번호</td><td>주소</td><td>건물</td>';
				for(var i =0; i<jsonData.length;i++){
					ahtml+='<tr>';
					ahtml+='<td>'+jsonData[i].ZDO+'</td>';
					ahtml+='<td>'+jsonData[i].SIGU+'</td>';
					ahtml+='<td>'+jsonData[i].DONG+'</td>';
					if(jsonData[i].RI!=null){
						ahtml+='<td>'+jsonData[i].RI+'</td>';
					}else{
						ahtml+='<td> </td>';
					}
					if(jsonData[i].BUNGI!=null){
						ahtml+='<td>'+jsonData[i].BUNGI+'</td>';
					}else{
						ahtml+='<td> </td>';
					}
					ahtml+='<td>'+jsonData[i].ZIPCODE+'</td>';
					ahtml+='<td>'+jsonData[i].ADDRESS+'</td>';
					ahtml+='<td>'+jsonData[i].APTNAME+'</td>';
					ahtml+='</tr>';
				}
				$("#dg_zipcode").show();
			} 
			
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
		$("#dg_zipcode").hide();
		$("#dlg_upd").dialog({
			closed:true
		});
		$('#dg_emp').datagrid({
			toolbar: '#tbar_emp'
			,width:1200
			,hegith:850
			,title:'사원테이블'
			,url:'jsonEmpList.jsp' 
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
	<div id="dlg_zipcode" class="easyui-dialog" data-options="closed:true" style="width:100%; max-width:800px; height:600px; padding:30px 30px">
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
				<input class="easyui-textbox" id="zipcode" name="zipcode" label="우편번호" labelPosition="top" data-options="prompt:'Enter a ZIPCODE'" style="width:220px;"/>
				<a id="btn_zipcode" href="javascript:zipfind()" class="easyui-linkbutton">우편번호 찿기</a>
			</div>
			<div style="margin-bottom:10px;">
				<input class="easyui-textbox" id="mem_addr" name="mem_addr" label="주소" labelPosition="top" data-options="prompt:'Enter a ADDRESS'" style="width:400px;"/>
			</div>	
   		</form>
   	</div>
    <!--=================== 사원등록 끝 ============================= -->
    <!--=================== 사원수정 시작 ============================= -->
   	<div id="dlg_upd" class="easyui-dialog" style="width:100%;max-width:480px;padding:30px 60px;">
   		<form id="f_upd">
   		수정
   		</form>
   	</div>
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