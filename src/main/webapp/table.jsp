<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>表格</title>
    <jsp:include page="import.jsp" flush="true"/>
    <script>
        $(document).ready(function () {

            $('#example').baseTable({
                "index": "selectAll",
                "columns": [
                    {"mData": "id", title: "编号", width: "60px"},
                    {"mData": "text", "title": "文本"},
                    {"mData": "ctime", title: "创建时间"},
                    {
                        mData: "status", title: "状态", render: function (data) {
                        var s;
                        var c;
                        switch (data) {
                            case 0:
                                s = "初始状态"
                                c = "";
                                break;
                            case 1:
                                s = "进行中"
                                c = "label-warning";
                                break;
                            case 2:
                                s = "已完成"
                                c = "label-success";
                                break;
                            case 3:
                                s = "已删除";
                                c = "label-danger"
                                break;
                            default :
                        }
                        return '<span class="' + c + ' label label-default">' + s + '</span>';
                    }
                    }
                ],
                "search": [
                    {"column": "id"},
                    {"column": "text"},
                    {"column": "ctime", "date": true, "placeholder": "创建时间起讫"},
                    {
                        column: "status", select: true, "placeholder": "全部状态",
                        data: [
                            {value: 0, text: "初始状态"},
                            {value: 1, text: "进行中"},
                            {value: 2, text: "已完成"},
                            {value: 3, text: "已删除"}
                        ]
                    }
                ],
                "buttons": [
                    [
                        {
                            "text": "新增",
                            "css": "btn-success",
                            icon: "plus",
                            "method": function () {

                            }
                        },
                        {
                            "text": "修改",
                            "css": "btn-warning",
                            icon: "edit",
                            allowNull: false,
                            "method": function (datas) {
                                console.debug(datas[0]);
                            }
                        },
                        {
                            "text": "删除",
                            "css": "btn-danger",
                            icon: "trash",
                            "method": function (datas) {

                            }
                        }
                    ],
                    [
                        {
                            "text": "审核"
                        },
                        {
                            text: "上架"
                        },
                        {
                            text: "下架"
                        }
                    ]
                ]
            });
        });
    </script>
</head>

<body>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">

    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">×</button>
                <h3>Settings</h3>
            </div>
            <div class="modal-body">
                <p>Here settings can be configured...</p>
            </div>
            <div class="modal-footer">
                <a href="#" class="btn btn-default" data-dismiss="modal">Close</a>
                <a href="#" class="btn btn-primary" data-dismiss="modal">Save changes</a>
            </div>
        </div>
    </div>
</div>
<div class="ch-container-main">
    <div class="row">
        <div id="content" class="col-lg-12">
            <div>
                <ul class="breadcrumb">
                    <li>
                        <a href="#">主页</a>
                    </li>
                    <li>
                        <a href="#">表格</a>
                    </li>
                </ul>
            </div>
            <table id="example"></table>
        </div>
    </div>
</div>
<jsp:include page="externalJS.jsp" flush="true"/>
</body>
</html>
