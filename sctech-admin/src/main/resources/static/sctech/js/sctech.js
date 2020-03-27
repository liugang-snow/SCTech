/**
 * 文件上传
 * 2020 SCTech
 */
(function ($) {
    $.extend({
    	//文件上传 //layui文件上传组件
    	upload: {
    		//初始化
    		init: function(options) {
    			layui.use('upload', function() {
                	var upload = layui.upload;               	
                	var uploadInst = upload.render({
                		elem: options.elem, 				//指向容器选择器，如：elem: '#id'。也可以是DOM对象
                		url: options.url,					//服务端上传接口
                		data: options.data,					//请求上传接口的额外参数
                		headers: options.headers,			//接口的请求头
                		accept: options.accept,				//指定允许上传时校验的文件类型，可选值有：images（图片）、file（所有文件）、video（视频）、audio（音频）
                		acceptMime: options.acceptMime,		//规定打开文件选择框时，筛选出的文件类型，值为用逗号隔开的 MIME 类型列表。如：'image/*'（只显示图片文件）、'image/jpg, image/png'（只显示 jpg 和 png 文件）
                		exts: options.exts,					//允许上传的文件后缀
                		auto: options.auto,					//是否选完文件后自动上传
                		bindAction: options.bindAction,		//指向一个按钮触发上传
                		field: options.field,				//设定文件域的字段名
                		size: options.size,					//设置文件最大可允许上传的大小，单位 KB。不支持ie8/9
                		multiple: options.multiple,			//是否允许多文件上传。设置 true即可开启。不支持ie8/9
                		number: options.number,				//设置同时可上传的文件数量，一般配合 multiple 参数出现
                		drag: options.drag,					//是否接受拖拽的文件上传，设置 false 可禁用。不支持ie8/9
                		choose: options.choose,				//选择文件后的回调函数
                		before: options.before,				//文件提交上传前的回调
                		done: options.done,					//执行上传请求后的回调
                		error: options.error				//执行上传请求出现异常的回调
                	});
                });
    		},    		
    		//初始化 多文件上传 带文件列表 选择文件后 需手动点击上传
    		initList: function(options) {
    			var listId = options == undefined ? "#file-upload-list": $common.isEmpty(options.listId) ? "#file-upload-list" : options.listId;
    			
    			var defaults = {
    					elem: "#file-upload",
    					url: "/common/upload",
    					accept: "file",
    					size: 51200,//50M
    					auto: false,
    					bindAction: "#file-upload-btn",
    					multiple: true,
    					number: 5,
    					drag: false,
    					choose: function(obj) {
    						var files = this.files = obj.pushFile(); //将每次选择的文件追加到文件队列
    					    //读取本地文件
    					    obj.preview(function(index, file, result){
    					    	var tr = $(['<tr id="upload-'+ index +'">'
    							,'<td>'+ file.name +'</td>'
    							,'<td>'+ (file.size/1024).toFixed(1) +'kb</td>'
    							,'<td>等待上传</td>'
    							,'<td>'
    							,'<button class="layui-btn layui-btn-xs file-reload layui-hide"><i class="layui-icon layui-icon-upload-circle"></i>重传</button>'
    							,'<button class="layui-btn layui-btn-xs layui-btn-danger file-delete"><i class="layui-icon layui-icon-delete"></i>删除</button>'
    							,'</td>'
    							,'</tr>'].join(''));
    					      
    							//单个重传
    							tr.find('.file-reload').on('click', function(){
    								obj.upload(index, file);
    							});
    					      
    							//删除
    							tr.find('.file-delete').on('click', function(){
    								delete files[index]; //删除对应的文件
    								tr.remove();
    								uploadListIns.config.elem.next()[0].value = ''; //清空 input file 值，以免删除后出现同名文件不可选
    							});
    					      
    							$(listId).append(tr);
    					    });
    					},
    					done: function(result, index, upload) {
    						if (result.code == web_status.SUCCESS) {
    							var tr = $(listId).find('tr#upload-'+ index)
					            ,tds = tr.children();
					            tds.eq(2).html('<span style="color: #5FB878;">上传成功</span>');
					            //tds.eq(3).html(''); //清空操作
					            return delete this.files[index]; //删除文件队列已经上传成功的文件
    						} else {
    							this.error(index, upload);
    						}  		
    					},
    					error: function(index, upload) {
    						var tr = $(listId).find('tr#upload-'+ index)
							,tds = tr.children();
							tds.eq(2).html('<span style="color: #FF5722;">上传失败</span>');
							tds.eq(3).find('.file-reload').removeClass('layui-hide'); //显示重传
    					}
            		};
                var param = $.extend(defaults, options);
                
                $.upload.init(param)             
    		}
    	},
    	//下拉组建 内容为树型 
    	xmselect: {
    		//初始化 方法
    		initoptions: function(options) {
    			var xmselect = xmSelect.render({
    				el: options.el,							//渲染对象, css选择器, dom元素
    				language: options.language,				//语言选择, zn/en, 默认：zn
    				data: options.data,						//显示的数据
    				content: options.content,				//自定义下拉框html
    				initValue: options.initValue,			//初始化选中的数据, 需要在data中存在
    				tips: options.tips,						//默认提示, 类似于placeholder, 默认：请选择
    				empty: options.empty,					//空数据提示, 默认：暂无数据
    				filterable: options.filterable,			//是否开启搜索, 默认：false
    				searchTips: options.searchTips,			//搜索提示, 默认：请选择
    				delay: options.delay,					//搜索延迟 ms, 默认：500ms
    				filterMethod: options.filterMethod,		//搜索回调函数
    				filterDone: options.filterDone,			//搜索完成函数
    				remoteSearch: options.remoteSearch,		//是否开启自定义搜索 (远程搜索), 默认：false
    				remoteMethod: options.remoteMethod,		//自定义搜索回调函数
    				direction: options.direction,			//下拉方向, auto/up/down, 默认：auto
    				style: options.style,					//自定义样式
    				height: options.height,					//默认最大高度, 默认：200px
    				paging: options.paging,					//是否开启自定义分页, 默认：false
    				pageSize: options.pageSize,				//分页条数, 默认：10
    				pageEmptyShow: options.pageEmptyShow,	//分页无数据是否显示, 默认：true
    				pageRemote: options.pageRemote,			//是否开启远程分页, 默认：true
    				radio: options.radio,					//是否开启单选模式, 默认：false
    				repeat: options.repeat,					//是否开启重复性模式, 默认：false
    				clickClose: options.clickClose,			//是否点击选项后自动关闭下拉框, 默认：false
    				prop: options.prop,						//自定义属性名称
    				theme: options.theme,					//主题配置
    				model: options.model,					//模型, 多选的展示方式
    				show: options.show,						//展开下拉的回调
    				hide: options.hide,						//隐藏下拉的回调
    				template: options.template,				//自定义渲染选项
    				on: options.on,							//监听选中变化
    				max: options.max,						//设置多选选中上限, 默认：0
    				maxMethod: options.maxMethod,			//达到选中上限的回调
    				name: options.name,						//表单提交时的name, 默认：select
    				layVerify: options.layVerify,			//表单验证, 同layui的lay-verify
    				layVerType: options.layVerType,			//表单验证, 同layui的lay-verType
    				toolbar: options.toolbar,				//工具条
    				showCount: options.showCount,			//展示在下拉框中的最多选项数量, 默认：0
    				autoRow: options.autoRow,				//是否开启自动换行(选项过多时), 默认：false
    				size: options.size,						//尺寸, large/medium/small/mini, 默认：medium
    				disabled: options.disabled,				//是否禁用多选, 默认：false
    				create: options.create,					//创建条目
    				tree: options.tree,						//树形结构
    				cascader: options.cascader				//级联结构
    			})
    		},
    		//初始化 树型
    		inittree: function(options, url, parentVal){
    			var defaults = {
    					filterable: true,
    					searchTips: '请输入',
    					height: 'auto',
    					clickClose: true,
    					prop: {
    						name: 'name',
    						value: 'id',
    					}, 
    					tree: {
    						show: true,
    						strict: false,
    					},
    					on: function(data){
    						if(data.isAdd){
    							return data.change.slice(0, 1)
    						}
    					},
    					toolbar: {
    						show: true,
    						list: [ 'CLEAR' ]
    					}
    			};
    			var param = $.extend(defaults, options);
    			var elem = xmSelect.render(param);   			
    			$.xmselect.ajaxtree(url, parentVal, elem); 
    			return elem;
    		},
    		//初始化
    		init: function(options, url){
    			var defaults = {
    					filterable: true,
    					searchTips: '请输入',
    					height: 'auto',
    					toolbar: {
    						show: true,
    						list: [ 'ALL', 'CLEAR', 'REVERSE' ]
    					}
    			};
    			var param = $.extend(defaults, options);
    			var elem = xmSelect.render(param);   			
    			$.xmselect.ajax(url, elem); 
    			return elem;
    		},
    		//ajax请求 树型
    		ajaxtree: function(url, parentVal, elem){
    			$.ajax({
    		        url: url,
    		        type: "get",
    		        dataType: "json",
    		        success: function(result) {
    		        	data = $.commons.dataToTree(result, "id", "pId", "children", parentVal);
    		        	elem.update({
    		        		data: data
    		        	})
    		        }
    		    });
    		},
    		//ajax请求 
    		ajax: function(url, elem){
    			$.ajax({
    		        url: url,
    		        type: "get",
    		        dataType: "json",
    		        success: function(result) {
    		        	elem.update({
    		        		data: result
    		        	})
    		        }
    		    });
    		},
    		//初始化 树型 搜索
    		initSearchTree: function(el, url, parentVal){
    			var options = {
    					el: '#' + el,
    					name: el,
    					style: {
    						borderRadius: '4px',
    						border: '1px solid #ddd',
    				    	paddingLeft: '5px',  				    		
    					},
    			};
    			return $.xmselect.inittree(options, url, parentVal);   			
    		},
    		//初始化表单 树型 新增、编辑
    		initEditTree: function(options, url, parentVal){
    			var defaults = {
    					style: {
    						border: '1px solid #ddd',
    					},
    			};
    			var param = $.extend(defaults, options);
    			return $.xmselect.inittree(param, url, parentVal);
    		}
    	},
    	//layui tablt 
    	ltable: {
    		init: function(options){
    			layui.use('table', function(){   				
    				var defaults = {
    				};   				
    				var param = $.extend(defaults, options);
    				var table = layui.table;
    				table.render(param);
    			})
    		},
    	},
    	// 公共方法
    	commons: {
            //LG* 2020-03-23 把扁平数据转成树形数据 
            dataToTree: function(source, id, parentId, children, parentValue){   
                let cloneData = JSON.parse(JSON.stringify(source))
                parentValue = parentValue == undefined ? 0 : $.common.isEmpty(parentValue) ? 0 : parentValue;
                return cloneData.filter(father=>{
                    let branchArr = cloneData.filter(child => father[id] == child[parentId]);
                    branchArr.length > 0 ? father[children] = branchArr : ''
                    return father[parentId] == parentValue
                })
            },
    		//获取字符串长度（汉字算两个字符，字母数字算一个）
    		getByteLen: function(val) {
    		    var len = 0;
    		    for (var i = 0; i < val.length; i++) {
    		        var a = val.charAt(i);
    		        if (a.match(/[^\x00-\xff]/ig) != null) {
    		            len += 2;
    		        } else {
    		            len += 1;
    		        }
    		    }
    		    return len;
    		},
    		//获取字符串长度（汉字算两个字符，字母数字算一个）
    		getStrPosition: function(str, length) {
    		    var len = 0;
    		    for (var i = 0; i < str.length; i++) {
    		        var a = str.charAt(i);
    		        if (a.match(/[^\x00-\xff]/ig) != null) {
    		            len += 2;
    		        } else {
    		            len += 1;
    		        }
    		        if (len-length>=0){
    		            return i;
    		        }
    		    }
    		},
    		//超出字符长度显示方案
    		tooltip: function(value, length){
    			var _length = $.common.isEmpty(length) ? 20 : length;
    		    var _text = "";
    		    var _value = value||'';
    		    if ($.common.isNotEmpty(value) && $.commons.getByteLen(value) > _length) {
    		        _text = _value.substr(0, $.commons.getStrPosition(_value,_length)) + "...";
    		        _value = _value.replace(/\'/g,"’");
    		        var actions = [];
    		        actions.push($.common.sprintf("<span href='###' class='tooltip-show' style='z-index: 999'  title='%s'>%s</span>", _value, _text));
    		        return actions.join('');
    		    } else {
    		        _text = _value;
    		        return _text;
    		    }
    		},
    		//超出20字符长度显示方案
    		tooltip20: function(value) {
    		    return $.commons.tooltip(value, 20);
    		},
    		//超出30字符长度显示方案
    		tooltip30: function(value) {
    		    return $.commons.tooltip(value, 30);
    		},
    		//超出40字符长度显示方案
    		tooltip40: function(value) {
    		    return $.commons.tooltip(value, 40);
    		},
    	}
    });
})(jQuery);


function initXmSelect(url, parentVal, options){
	var elem = xmSelect.render(options);
	
	$.ajax({
        url: url,
        type: "get",
        dataType: "json",
        success: function(result) {
        	data = $.commons.dataToTree(result, "id", "pId", "children", parentVal);
        	elem.update({
        		data: data
        	})
        }
    });
	
	return elem;
}

function setXmSelect(el, url, parentVal){
	var options = {
			el: '#' + el,
			filterable: true,
			searchTips: '请输入',
			style: {
				borderRadius: '4px',
				border: '1px solid #ddd'
			},
			height: 'auto',
			clickClose: true,
			prop: {
				name: 'name',
				value: 'id',
			}, 
			tree: {
				show: true,
				strict: false,
			},
			on: function(data){
				if(data.isAdd){
					return data.change.slice(0, 1)
				}
			},
			name: el,
			toolbar: {
				show: true,
				list: [ 'CLEAR' ]
			}
		};
	
	return initXmSelect(url, parentVal, options);		
}
