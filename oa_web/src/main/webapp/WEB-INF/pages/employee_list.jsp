<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="top.jsp"/>

<link rel="stylesheet" type="text/css" href="/css/employee.css">
<section id="content" class="table-layout animated fadeIn">
    <div class="tray tray-center">
        <div class="content-header">
            <h2> 员工列表 </h2>
            <p class="lead"></p>
        </div>
        <div class="admin-form theme-primary mw1000 center-block" style="padding-bottom: 175px;">
            <div class="panel  heading-border">
                <div class="panel-menu">
                    <div class="row">
                        <div class="hidden-xs hidden-sm col-md-3">
                            <div class="btn-group">
                                <button type="button" class="btn btn-default light">
                                    <i class="fa fa-refresh"></i>
                                </button>
                                <button type="button" class="btn btn-default light">
                                    <i class="fa fa-trash"></i>
                                </button>
                                <button type="button" class="btn btn-default light">
                                    <i class="fa fa-plus" onclick="javascript:window.location.href='/employee/to_add';"></i>
                                </button>
                            </div>
                        </div>
                        <div class="col-xs-12 col-md-9 text-right">
                            <div class="btn-group">
                                <%--<span>第${requestScope.pagemsg.currPage }/ ${requestScope.pagemsg.totalPage}页</span>--%>
                                <%--<span>总记录数：${requestScope.pagemsg.totalCount }  每页显示:${requestScope.pagemsg.pageSize}</span>--%>
                                <c:if test="${requestScope.pagemsg.currPage != 1}">
                                    <%--<a href="${pageContext.request.contextPath }/employee/list?currentPage=1">[首页]</a>--%>
                                    <a href="${pageContext.request.contextPath }/employee/list?currentPage=${requestScope.pagemsg.currPage-1}" style="font-size:36px;text-decoration: none;">◀</a>
                                </c:if>

                                <c:if test="${requestScope.pagemsg.currPage != requestScope.pagemsg.totalPage}">
                                    <a href="${pageContext.request.contextPath }/employee/list?currentPage=${requestScope.pagemsg.currPage+1}" style="font-size:36px;text-decoration: none;">▶</a>
                                    <%--<a href="${pageContext.request.contextPath }/employee/list?currentPage=${requestScope.pagemsg.totalPage}">[尾页]</a>--%>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="panel-body pn">
                    <table id="message-table" class="table admin-form theme-warning tc-checkbox-1">
                        <thead>
                        <tr class="">
                            <th class="text-center hidden-xs">Select</th>
                            <th class="hidden-xs">工号</th>
                            <th class="hidden-xs">姓名</th>
                            <th class="hidden-xs">所属部门</th>
                            <th class="hidden-xs">职务</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${requestScope.pagemsg.lists}" var="emp">
                            <tr class="message-unread">
                                <td class="hidden-xs">
                                    <label class="option block mn">
                                        <input type="checkbox" name="mobileos" value="FR">
                                        <span class="checkbox mn"></span>
                                    </label>
                                </td>
                                <td>${emp.sn}</td>
                                <td>${emp.name}</td>
                                <td class="text-center fw600">${emp.department.name}</td>
                                <td class="hidden-xs">
                                    <span class="badge badge-warning mr10 fs11">${emp.post}</span>
                                </td>
                                <td>
                                    <a href="/employee/to_update?sn=${emp.sn}">编辑</a>
                                    <%--<a href="/employee/remove?sn=${emp.sn}">删除</a>--%>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</section>

<jsp:include page="bottom.jsp"/>











