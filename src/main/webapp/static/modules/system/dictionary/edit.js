/**
 * 
 */
//@ sourceURL=editdictionary.js
$.namespace("system.dictionary.edit");

$.system.dictionary.edit.dictionaryEdit= function(){
	var form = $("#id-edit-form-dictionary",$.system.dictionary.edit.container);
	if(!form.valid()){
		return false;
	}
	$.ajax({
		type:'post',
		dataType:'json',
		url:'system/dictionary/save',
		data:$('#id-edit-form-dictionary').serialize(),
		success:function(json){
			if(json.resultCode == 1){
				$.toast("保存成功");
				$('#' +$.system.dictionary.manager.winId).dialog('close');
				$("#"+$.system.dictionary.manager.gridId).jqGrid("setGridParam", {search: true }).trigger("reloadGrid");
			}else{
				$.toast("保存失败");
			}
		}
	});
	
};

//字典类型编码验证
$.validator.addMethod("checkTypeCode", function(value, element) {
	return this.optional(element) || /^[A-Z_]+$/.test(value);
}, "字典类型编码由大写字母和下划线组成");

//字典排序验证
$.validator.addMethod("checkSortNum", function(value, element) {
	return this.optional(element) || /^[0-9]{0,5}$/.test(value);
}, "字典排序只能是不超过5位的正整数");

$.system.dictionary.edit.init=function(){
	$.system.dictionary.edit.container = $("#wid-id-system-dictionary-edit");
	
	$("#id-edit-form-dictionary",$.system.dictionary.edit.container).validate({
		rules : {
			typeCode : {
				required : true,
				maxlength : 40,
				checkTypeCode : true
			},
			dictionaryName : {
				required : true,
				maxlength:40
			},
			dictionaryCode : {
				maxlength:40,
				required : true,
				remote : {
					type : "post",
					dateType : 'json',
					url : "system/dictionary/find-by-name-code",
					data : {
						id : function() {
							return $("#id-edit-dictionary",$.system.dictionary.edit.container).val();
						},
						dictionaryCode : function() {
							return $("#id-dictionaryCode",$.system.dictionary.edit.container).val();
						},
						dictionaryName : function() {
							return $("#id-dictionaryName",$.system.dictionary.edit.container).val();
						}
					}
				}
			},
			dictionaryValue : {
				maxlength:40
			},
			sortNum : {
				checkSortNum : true
			},
			remark : {
				minlength : 5,
				maxlength : 60
			}
		},
		messages : {
			typeCode : {
				checkTypeCode : "字典类型编码由大写字母和下划线组成"
			},
			dictionaryCode : {
				remote : "同类型下字典编码重复"
			}
	
		}
	});
};