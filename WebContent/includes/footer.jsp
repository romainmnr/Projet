<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path2 = "";
	if (request.getSession().getAttribute("path") != null) {
		path2 = (String) request.getSession().getAttribute("path");
	}
%>

<!-- Core JS: jQuery, Bootstrap, slimScroll, scrollLock, Appear, CountTo, Placeholder, Cookie and App.js -->
<script src="<%=path2%>assets/js/core/jquery.min.js"></script>
<script src="<%=path2%>assets/js/core/bootstrap.min.js"></script>
<script src="<%=path2%>assets/js/core/jquery.slimscroll.min.js"></script>
<script src="<%=path2%>assets/js/core/jquery.scrollLock.min.js"></script>
<script src="<%=path2%>assets/js/core/jquery.appear.min.js"></script>
<script src="<%=path2%>assets/js/core/jquery.countTo.min.js"></script>
<script src="<%=path2%>assets/js/core/jquery.placeholder.min.js"></script>
<script src="<%=path2%>assets/js/core/js.cookie.min.js"></script>
<script src="<%=path2%>assets/js/app.js"></script>
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/highcharts-more.js"></script>

<script src="https://code.highcharts.com/modules/solid-gauge.js"></script>
<!-- Custom JS -->
<script src="<%=path2%>assets/js/js-sidebar.js"></script>
<%@ include file="/includes/modals/createMachine-modal.jsp"%>
<!-- Plugins -->
<script src="<%=path2%>assets/js/plugins/bootstrap-wizard/jquery.bootstrap.wizard.min.js"></script>
<script src="<%=path2%>assets/js/plugins/jquery-validation/jquery.validate.min.js"></script>
<script src="<%=path2%>assets/js/plugins/bootstrap-notify/bootstrap-notify.min.js"></script>
<script src="<%=path2%>assets/js/plugins/select2/select2.full.min.js"></script>
<script src="<%=path2%>assets/js/plugins/masked-inputs/jquery.maskedinput.min.js"></script>
<script src="<%=path2%>assets/js/plugins/ion-rangeslider/js/ion.rangeSlider.min.js"></script>
<script src="<%=path2%>assets/js/plugins/bootstrap-treeview/bootstrap-treeview.min.js"></script>
<script src="<%=path2%>assets/js/plugins/sweetalert2/sweetalert2.min.js"></script>
<script src="<%=path2%>assets/js/plugins/datatables/jquery.dataTables.min.js"></script>
<!-- Page JS Code -->
<script src="<%=path2%>assets/js/pages/base_forms_wizard.js"></script> 
<script src="<%=path2%>assets/js/pages/base_tables_datatables.js"></script>

<script>
	jQuery(function() {
		App.initHelpers([ 'select2', 'masked-inputs', 'rangeslider', 'notify', 'slimscroll' ]);
	});	
	
	var width_container = $("#page-container").width();
</script>

