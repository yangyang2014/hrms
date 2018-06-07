//基于准备好的dom，初始化echarts实例
var deptChart = echarts.init(document.getElementById('deptGraph'));
var empGenderGraph = echarts.init(document.getElementById('empGenderGraph'));
option = {
	backgroundColor : '#eee',
	tooltip : {
		trigger : 'item',
		formatter : "{a} <br/>{b}: {c} ({d}%)"
	},
	itemStyle : {
		shadowBlur : 200,	// 阴影的大小
		shadowOffsetX : 0,// 阴影水平方向上的偏移
		shadowOffsetY : 0,// 阴影垂直方向上的偏移
		shadowColor : 'rgba(0, 0, 0, 0.5)'// 阴影颜色
	},
	series : [ {
		name : '组织信息',
		type : 'pie',
		data : []
	} ]
};

empGenderOption = {
		backgroundColor : '#eee',
		tooltip : {
			trigger : 'item',
			formatter : "{a} <br/>{b}: {c} ({d}%)"
		},
		itemStyle : {
			shadowBlur : 200,	// 阴影的大小
			shadowOffsetX : 0,// 阴影水平方向上的偏移
			shadowOffsetY : 0,// 阴影垂直方向上的偏移
			shadowColor : 'rgba(0, 0, 0, 0.5)'// 阴影颜色
		},
		itemStyle : {
			shadowBlur : 200,	// 阴影的大小
			shadowOffsetX : 0,// 阴影水平方向上的偏移
			shadowOffsetY : 0,// 阴影垂直方向上的偏移
			shadowColor : 'rgba(0, 0, 0, 0.5)'// 阴影颜色
		},
		series : [ {
			name : '员工性别分布图',
			type : 'pie',
			data : []
		} ]
	};
// 使用刚指定的配置项和数据显示图表。
if (option && typeof option === "object") {
	deptChart.setOption(option);
}
empGenderGraph.setOption(empGenderOption);
/** ********************页面显示相关js代码********************** */

function buildDeptGraph(result) {
	var deptsData = [];
	var empNums = [];
	var departments = result.extend.departments;
	$.each(departments, function(index, item) {
		var department = {};
		department.name = item.name;
		department.value = item.empNum;
		deptsData.push(department);
	});
	// 填入数据
	deptChart.setOption({
		series : [ {
			data : deptsData
		} ]
	});

}
/* 渲染员工性别分布情况图 */
function buildEmpGraph(data){
	var genderData=[{name:"男",value:data.m},{name:"女",value:data.f}];
	empGenderGraph.setOption({series : [ {
		data : genderData
	} ]});
	
}