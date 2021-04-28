layui.use(['dropdown', 'util', 'table'], function() {
    var setType, setName, editId, delId;


    var table = layui.table;

    var tableIns = table.render({
        elem: '#test',
        url: api.search,
        where: { 'itype': 'yblx' },
        // toolbar: true,
        title: '数据字典',
        cols: [
            [
                { field: 'xuhao', title: '#', fixed: 'left', templet: '#xuhao', type: 'number' },
                { field: 'id', title: '代码', fixed: 'left' },
                { field: 'value', title: '名称' },
                { title: '操作', width: 200, align: 'center', fixed: 'right', toolbar: '#barDemo' }
            ]
        ],
        id: 'test',
        height: 'full-140',
        even: true,
        done: function(res, curr, count) {


        }
    });
    table.on('tool(test)', function(obj) {
        var data = obj.data;
        console.log(data);
        if (obj.event === 'del') {
            delId = data.id
            layer.confirm('确认删除「' + data.value + '」数据吗？', function(index) {
                var load = layer.load(2);
                $.post(
                    api.del, {
                        'id': delId
                    },
                    function(data) {
                        if (data) {
                            layer.msg('分类删除成功');
                            $('#' + setType).click();
                            layer.close(load);
                        }
                    });
                layer.close(index);
            });
        } else if (obj.event === 'edit') {
            editId = data.id;
            layer.prompt({
                    title: $('#' + setType).find('span').text() + '修改',
                    value: data.value
                },
                function(text, index) {
                    layer.close(index);
                    var load = layer.load(2);
                    $.post(
                        api.edit, {
                            'value': text,
                            'id': editId
                        },
                        function(data) {
                            if (data) {
                                layer.msg('分类修改成功');
                                $('#' + setType).click();
                                layer.close(load);
                            }
                        });
                }
            )
        }
    });

    var dropdown = layui.dropdown,
        util = layui.util,
        $ = layui.jquery;


    //菜单点击事件
    dropdown.on('click(setMenu)', function(options) {
        var thisElem = $(this);
        setType = options.itype;
        setName = thisElem.find('span').text();
        $('.menuText').text(thisElem.find('span').text());
        console.log(setType);
        tableIns.reload({
            where: { 'itype': setType }

        });
    });


    // $("#yblx").click();

    $("#addSet").on('click', function() {
        layer.prompt({ title: '请输入「'+setName+'」名称', formType: 0 }, function(text, index) {
            layer.close(index);
            var load = layer.load(2);
            $.post(
                api.add, {
                    'value': text,
                    'type': setType
                },
                function(data) {
                    if (data) {
                        layer.msg('分类添加成功');
                        $('#' + setType).click();
                        layer.close(load);
                    }
                });
        });
    });
});