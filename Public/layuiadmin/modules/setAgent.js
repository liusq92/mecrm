layui.use(['index','table', 'util', 'layer', 'form', 'laydate', 'xcity'], function() {
    var util = layui.util,
        layer = layui.layer,
        form = layui.form,
        laydate = layui.laydate,
        xcity = layui.xcity,
        $ = layui.jquery;

    var addAgentCostId = '',
        addAgentCostName = '';
    xcity.render('#addrs', '上海', '市辖区', '浦东新区');
    laydate.render({
        elem: "#hztime"
    });
    

    util.event('lay-active', {
        addAgent: function() {
            layer.open({
                title: "新增代理商",
                type: 1,
                content: $('#addAgent'),
                area: ['1100px', '630px'],
                btn: ['确认提交', '取消'],
                anim: 1,
                yes: function(index) {
                    
                    var d = form.val('addAgent');
                    if (d.name == '' || d.name == null) {
                        layer.msg('代理商名称必填', {
                            icon: 5,
                            time: 2000
                        });
                    } else {
                        var loading = layer.load(2,{
                            "content":"数据新增中"
                        });
                        $.post(agentApi.add, 
                            {'agentd': d}, 
                            function(data) {
                            if(data){
                                layer.msg('代理商新增成功');
                                layer.close(index);
                                layer.close(loading);
                                form.val('addAgent');
                                tableAgent.reload();
                            }
                        });
                    }
                    // layer.close(index);
                }


            });
            // layer.full(editOpen);
        },
        addAgentCost: function() {
            if(addAgentCostId == ''){
                layer.msg('请先选择代理商后在操作');
            }else{
                form.val('addAgentCost',{
                    agentname:addAgentCostName,
                    agentid:addAgentCostId
                });
                layer.open({
                title: "新增「"+addAgentCostName+"」成本",
                type: 1,
                content: $('#addAgentCost'),
                area: ['630px', '530px'],
                btn: ['确认提交', '取消'],
                anim: 1,
                yes: function(index) {
                    layer.msg(1);
                    form.on('submit(addAgentCostSub)', function(data){
                        // layer.msg(JSON.stringify(data.field));
                        var loading = layer.load(2,{
                            "content":"数据新增中"
                        });
                        $.post(agentApi.cadd, 
                            {agentcostd: form.val('addAgentCost')}, 
                            function(data) {
                            if(data){
                                layer.msg('成本新增成功');
                                layer.close(index);
                                layer.close(loading);
                                form.val('addAgentCost');
                                tableAgentCost.reload({
                                    url:agentApi.csearch,
                                    where:{ 'agentid' : addAgentCostId}
                                  });
                            }
                        });
                        return false;
                      });

                    $('#subaddagentcost').click();
                    
                    // layer.close(index);
                }


            });
            }
            
        }
    });

    // 代理商列表
    var table = layui.table;

    var tableAgent = table.render({
        elem: '#agent',
        url: agentApi.search,
        
        // toolbar: true,
        title: '代理商列表',
        cols: [
            [
                { field: 'xuhao',width: 45, title: '#', fixed: 'left', templet: '#xuhao', type: 'number' },
                { field: 'name',width: 180, title: '名称', fixed: 'left' },
                { field: 'phone',width: 140, title: '联系方式' },
                { field: 'contacts',width: 140, title: '联系人' },
                { field: 'address',width: 250, title: '地址' },
                {field: 'hzflg',
                    title: '合作状态',
                    sort: true,
                    templet: '#switchHz',
                    width: 120},
                { field: 'note',width: 250, title: '备注' },
                { title: '操作', width: 150, align: 'center', fixed: 'right', toolbar: '#barAgent' }
            ]
        ],
        id: 'agent',
        height: 'full-140',
        even: true,
        done: function(res, curr, count) {
            $("div[lay-id='agent']").find('div.layui-table-body').find('tr:first').dblclick()

        }
    });
    table.on('rowDouble(agent)', function(obj){

        var d = obj.data;
        if(addAgentCostId != d.id){
            addAgentCostId = d.id;
            addAgentCostName = d.name;
            $('.table-tr-selected-bg').removeClass('table-tr-selected-bg');
            $(obj.tr).addClass('table-tr-selected-bg');
            $('.agentCostListText').html('「'+d.name+'」成本列表');
            tableAgentCost.reload({
                url:agentApi.csearch,
                where:{ 'agentid' : addAgentCostId}
            });
        }
        
    });

    // 代理商成本价格
    var tableAgentCost = table.render({
        elem: '#agentCost',
        url: agentApi.csearch,
        
        // toolbar: true,
        title: '代理商成本列表',
        cols: [
            [
                { field: 'xuhao',width: 45, title: '#', fixed: 'left', templet: '#xuhao', type: 'number' },
                { field: 'jdtype',width: 110, title: '鉴定类型' },
                { field: 'ybtype',width: 110, title: '样本类型' },
                { field: 'cost',width: 110, title: '成本价格' },
                { field: 'note',width: 150, title: '备注' },
                { title: '操作', width: 150, align: 'center', fixed: 'right', toolbar: '#barAgentCost' }
            ]
        ],
        id: 'agentCost',
        height: 'full-140',
        even: true,
        done: function(res, curr, count) {


        }
    });

});