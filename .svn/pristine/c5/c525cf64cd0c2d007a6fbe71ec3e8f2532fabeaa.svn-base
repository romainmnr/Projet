
(function($) {

	$(document).ready(function() {


		/***************************
		 *        Function 
		 **************************/

		function getServer(){
			$('#srv-block').addClass("block-opt-refresh");
			$.ajax({
				url: 'PingServer',
				type: 'POST', 
				dataType:'json',
				success: function (data) { 
					$('#table-srv-body').empty(); 
					$.each(data,function(key1,val2){
						var row ="";
						row += "<tr>";
						row += "<td class=\"text-center\">"+val2.id+"</td>";
						row += "<td class=\"text-center\">"+val2.name+"</td>";
						row += "<td id=\"hidden-sidebar-o\" class=\"text-center\">"+val2.ip+"</td>";
						row += "<td id=\"hidden-sidebar-o\" class=\"text-center \">"+val2.port+"</td>";
						if(val2.enabled){
							row += "<td class=\"text-center\"><span class=\"label label-success\"><i class=\"fa fa-check\"></i></span></td>";
						}else{
							row += "<td class=\"text-center\"><span class=\"label label-danger\"><i class=\"fa fa-times\"></i></span></td>";
						}
						if(val2.state){
							row += "<td class=\"text-center\"><i class=\"fa fa-circle green\" aria-hidden=\"true\"></i></td>";
						}else{
							row += "<td class=\"text-center\"><i class=\"fa fa-circle red\" aria-hidden=\"true\"></i></td>";
						}

						row += "<td class=\"text-center\">"+val2.time+"ms</td>";
						row += "<td id=\"hidden-sidebar-o\" class=\"text-center\">"+
						"<div class=\"btn-group\">"+
						"<button onClick=\"toogleState("+val2.id+");\" class=\"btn btn-xs btn-default\" type=\"button\" data-toggle=\"tooltip\" data-original-title=\"Enable/disable server\">"+
						"<i class=\"fa fa-pencil\"></i>"+
						"</button>"+
						"</div>"+	 
						"</td>";
						row += "<tr>";
						$('#table-srv-body').append(row);
					});


					$('#srv-block').removeClass("block-opt-refresh");
					$('#menu-btn').click(function(e){
						e.preventDefault();
						if($('#page-container').hasClass('sidebar-o') || $('#page-container').hasClass('sidebar-o-xs')){
							$('th#hidden-sidebar-o').hide();
							$('td#hidden-sidebar-o').hide();
						}else{
							$('th#hidden-sidebar-o').show();
							$('td#hidden-sidebar-o').show();
						}
						
					});
				},
				error: function (data) {
					$('#srv-block').removeClass("block-opt-refresh");
					notify("danger","Unable to get server");
				}
			});
		}
		
		function getVM(){
			$('#vm-block').addClass("block-opt-refresh");
			$.ajax({
				url: 'SidebarContent',
				type: 'POST', 
				dataType:'json',
				success: function (data) { 
					$('#table-vm-body').empty(); 
					var i = 0;
					$.each(data,function(key,val){
						$.each(val.vms,function(key1,val1){
							i++;
							var row ="";
							row += "<tr>";
							row += "<td class=\"text-center\">"+val1.idVm+"</td>"; 
							row += "<td><img src=\"assets/img/icon-os-vb/"+val1.ico+"\" class=\"vm-sidebar-ico\" onerror=\"this.src='assets/img/icon-os/unknown.svg';\"/></td>"
							row += "<td><a href=\"vm.jsp?srvId="+val.id+"&idVm="+val1.name+"\">"+val1.name+"</a></td>";
							row += "<td>"+val1.os+"</td>";

							row += "<tr>";
							$('#table-vm-body').append(row);
						});
					
					});

					$('#nb-of-vm').text(i);
					$('#vm-block').removeClass("block-opt-refresh");
					
				},
				error: function (data) {
					$('#vm-block').removeClass("block-opt-refresh");
					notify("danger","Unable to get server");
				}
			});
		}


		function notify(type, msg){
			var ico = '';

			if(type== 'danger'){
				ico = 'fa fa-times';
			}else if(type == 'success'){
				ico = 'fa fa -check';
			}else if( type== 'warning'){
				ico = 'fa fa-warning';
			}else{
				ico = '';
			}

			jQuery.notify({
				icon: ico,
				message: msg
			},
			{
				element: 'body',
				type: type,
				allow_dismiss: true,
				newest_on_top: true,
				showProgressbar: false,
				placement: {
					from: 'top',
					align: 'right'
				},
				offset: 20,
				spacing: 10,
				z_index: 1033,
				delay: 3000,
				timer: 1000,
				animate: {
					enter: 'animated fadeIn',
					exit: 'animated fadeOutDown'
				}
			});
		}



		/***************************
		 *        On click event 
		 **************************/
		$('#btn-refresh-srv').click(function(e){
			e.preventDefault();
			getServer();
		});
		$('#btn-refresh-vm').click(function(e){
			e.preventDefault();
			getVM();
		});
		


		/***************************
		 *        Main API 
		 **************************/
		getServer();
		getVM();

	});

})(jQuery);
