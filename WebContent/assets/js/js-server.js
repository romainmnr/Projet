
(function($) {

	$(document).ready(function() {

		var hostOnlyMap;
		var NATMap

		/***************************
		 *        Function 
		 **************************/
		
		
		/****************************************
		 * 		Host Only network  function
		 ************************************** */
		function deleteHostOnlyNetwork(){
			swal({
				  title: 'Are you sure?', 
				  type: 'warning',
				  showCancelButton: true,
				  confirmButtonColor: '#3085d6',
				  cancelButtonColor: '#d33',
				  confirmButtonText: 'Yes, delete it!',
					  showLoaderOnConfirm: true,
					  preConfirm: function (email) {
					    return new Promise(function (resolve, reject) {
							var nameSelectedNetwork = $('#HostOnlyNetworkServer').find(":selected").val(); 
					    	$.ajax({
								url: 'ConfigureNetworkServer',
								type: 'POST', 
								dataType:'json',
								data: $('.js-value-form').serialize() + "&fn=deleteHostOnlyNetwork&param="+nameSelectedNetwork,
								success: function (data) { 
									if(data.header.statut == "200"){ 
										//TODO Verifier la bonne suppression du reseau
										hostOnlyMap = data.data.HostOnlyNetworkServer;  
										$("#HostOnlyNetworkServer option[value='"+nameSelectedNetwork+"']").remove();
										swal( 'Deleted!', 'This network has been deleted.', 'success' );
									}else{ 
										notify('danger','Error : ['+ data.header.statut +'] deleteHostOnlyNetwork');
										swal( 'Not deleted!',  'This network has not been deleted.',  'error' );
									}
									 
								},
								error: function (jqXHR, textStatus, errorThrown) { 
									notify('danger','Error : '+ jqXHR.status+' ['+errorThrown+'] deleteHostOnlyNetwork');
									swal( 'Not deleted!',  'This network has not been deleted.',  'error' ); 
								}
							});
					    })
					  },
					  allowOutsideClick: false
					})
			
		}
		 
		
		function createHostOnlyNetwork(){
			swal({
				  title: 'Are you sure?', 
				  type: 'question',
				  showCancelButton: true,
				  confirmButtonColor: '#3085d6',
				  cancelButtonColor: '#d33',
				  confirmButtonText: 'Yes, create it!',
				  showLoaderOnConfirm: true,
				  preConfirm: function (email) {
				    return new Promise(function (resolve, reject) {
				    	$.ajax({
							url: 'ConfigureNetworkServer',
							type: 'POST', 
							dataType:'json',
							data: $('.js-value-form').serialize() + "&fn=createHostOnlyNetwork",
							success: function (data) { 
								if(data.header.statut == "200"){ 
				
									$('#HostOnlyNetworkServer').empty(); 
									hostOnlyMap = data.data.HostOnlyNetworkServer;  
									$.each(data.data.HostOnlyNetworkServer,function(key,val){  
										if(typeof val.Name != "undefined"){
											$('#HostOnlyNetworkServer').append('<option value="'+val.Name+'">'+val.ShortName+'</option>');
										} 
									});  
									swal( 'Created!', 'This network has been created.',  'success' );
								}else{ 
									notify('danger','Error : ['+ data.header.statut +'] createHostOnlyNetwork');
									swal( 'Not created!',  'This network has not been created.',  'error' );
								} 
							},
							error: function (jqXHR, textStatus, errorThrown) {
								notify('danger','Error : '+ jqXHR.status+' ['+errorThrown+'] createHostOnlyNetwork');
								swal( 'Not created!',  'This network has not been created.',  'error' ); 
							}
						});
				    })
				  },
				  allowOutsideClick: false
				}).then(function () {
					swal( 'Not created!', 'This network has not been created.',  'error' );
				})
			
		}
		
		function getHostOnlyNetwork(){
			$('#btn-modif-HostOnlyNetwork-server').prop("disabled",true);
			$.ajax({
				url: 'ConfigureNetworkServer',
				type: 'POST', 
				dataType:'json',
				data: $('.js-value-form').serialize() + "&fn=getHostOnlyNetwork",
				success: function (data) { 
					if(data.header.statut == "200"){ 
						hostOnlyMap = data.data.HostOnlyNetworkServer;  
						
					}else{ 
						notify('danger','Error : ['+ data.header.statut +'] getHostOnlyNetwork');
					} 
					$('.loader-block').hide();
				},
				error: function (jqXHR, textStatus, errorThrown) {
					notify('danger','Error : '+ jqXHR.status+' ['+errorThrown+'] getHostOnlyNetwork');
					$('.loader-block').hide();
				}
			});
		}
		
		function getNATNetwork(){
			$('#btn-modif-NATNetwork-server').prop("disabled",true);
			$.ajax({
				url: 'ConfigureNetworkServer',
				type: 'POST', 
				dataType:'json',
				data: $('.js-value-form').serialize() + "&fn=getNATNetwork",
				success: function (data) { 
					if(data.header.statut == "200"){ 
						NATMap = data.data.NATNetworkServer;  
						
					}else{ 
						notify('danger','Error : ['+ data.header.statut +'] getNATNetwork');
					} 
					$('.loader-block').hide();
				},
				error: function (jqXHR, textStatus, errorThrown) {
					notify('danger','Error : '+ jqXHR.status+' ['+errorThrown+'] getNATNetwork');
					$('.loader-block').hide();
				}
			});
		}
		
		function modifHostOnlyNetwork(){
			$('.loader-block').show();
			var select = $('#HostOnlyNetworkServer').find(':selected').val();
			$.ajax({
				url: 'ConfigureNetworkServer',
				type: 'POST', 
				dataType:'json',
				data: $('.js-value-form').serialize() +"&"+ $('.js-form-modif-hostOnly').serialize()+ "&cfgsrv-hostOnly-name="+select+"&fn=modifHostOnlyNetwork",
				success: function (data) { 
					if(data.header.statut == "200"){ 
						hostOnlyMap = data.data.HostOnlyNetworkServer;  
						$('#modif-HostOnlyNetwork-server-modal').modal('hide');
						
					}else{ 
						notify('danger','Error : ['+ data.header.statut +'] modifHostOnlyNetwork');
					} 
					$('.loader-block').hide();
				},
				error: function (jqXHR, textStatus, errorThrown) {
					notify('danger','Error : '+ jqXHR.status+' ['+errorThrown+'] modifHostOnlyNetwork');
					$('.loader-block').hide();
				}
			});
			
			
		}
		
		
		/****************************************
		 * 		Nat network function
		 ************************************** */
		function createNATNetwork(){
			swal({
				  title: 'Are you sure?', 
				  type: 'question',
				  showCancelButton: true,
				  confirmButtonColor: '#3085d6',
				  cancelButtonColor: '#d33',
				  confirmButtonText: 'Yes, create it!',
				  showLoaderOnConfirm: true,
				  preConfirm: function (email) {
				    return new Promise(function (resolve, reject) {
				    	$.ajax({
							url: 'ConfigureNetworkServer',
							type: 'POST', 
							dataType:'json',
							data: $('.js-value-form').serialize() + "&fn=createNATNetwork&"+$('.js-form-create-NAT').serialize(),
							success: function (data) { 
								if(data.header.statut == "200"){ 
				
									$('#NATNetworkServer').empty(); 
									NATMap = data.data.NATNetworkServer;  
									$.each(data.data.NATNetworkServer,function(key,val){  
										if(typeof val.Name != "undefined"){
											$('#NATNetworkServer').append('<option value="'+val.Name+'">'+val.Name+'</option>');
										} 
									}); 
									$('#create-NATNetwork-server-modal').modal('hide');
									swal( 'Created!', 'This network has been created.',  'success' );
								}else{ 
									notify('danger','Error : ['+ data.header.statut +'] createNATNetwork');
									swal( 'Not created!',  'This network has not been created.',  'error' );
								} 
							},
							error: function (jqXHR, textStatus, errorThrown) {
								notify('danger','Error : '+ jqXHR.status+' ['+errorThrown+'] createNATNetwork');
								swal( 'Not created!',  'This network has not been created.',  'error' ); 
							}
						});
				    })
				  },
				  allowOutsideClick: false
				}).then(function () {
					swal( 'Not created!', 'This network has not been created.',  'error' );
				})
			
		}
		
		function deleteNATNetwork(){
			swal({
				  title: 'Are you sure?', 
				  type: 'warning',
				  showCancelButton: true,
				  confirmButtonColor: '#3085d6',
				  cancelButtonColor: '#d33',
				  confirmButtonText: 'Yes, delete it!',
					  showLoaderOnConfirm: true,
					  preConfirm: function (email) {
					    return new Promise(function (resolve, reject) {
					    	var nameSelectedNetwork = $('#NATNetworkServer').find(":selected").val();
					    	$.ajax({
								url: 'ConfigureNetworkServer',
								type: 'POST', 
								dataType:'json',
								data: $('.js-value-form').serialize() + "&fn=deleteNATNetwork&param="+nameSelectedNetwork,
								success: function (data) { 
									if(data.header.statut == "200"){ 
										$('#NATNetworkServer').empty(); 
										NATMap = data.data.NATNetworkServer;  
										$.each(data.data.NATNetworkServer,function(key,val){  
											if(typeof val.Name != "undefined"){
												$('#NATNetworkServer').append('<option value="'+val.Name+'">'+val.Name+'</option>');
											} 
										}); 
										swal( 'Deleted!', 'This network has been deleted.', 'success' );
									}else{ 
										notify('danger','Error : ['+ data.header.statut +'] deleteHostOnlyNetwork');
										swal( 'Not deleted!',  'This network has not been deleted.',  'error' );
									}
									 
								},
								error: function (jqXHR, textStatus, errorThrown) { 
									notify('danger','Error : '+ jqXHR.status+' ['+errorThrown+'] deleteHostOnlyNetwork');
									swal( 'Not deleted!',  'This network has not been deleted.',  'error' ); 
								}
							});
					    })
					  },
					  allowOutsideClick: false
					})
		}
		
		function modifNATNetwork(){
			swal({
				  title: 'Are you sure?', 
				  type: 'warning',
				  showCancelButton: true,
				  confirmButtonColor: '#3085d6',
				  cancelButtonColor: '#d33',
				  confirmButtonText: 'Yes, modify it!',
					  showLoaderOnConfirm: true,
					  preConfirm: function (email) {
					    return new Promise(function (resolve, reject) {
							var select = $('#NATNetworkServer').find(':selected').val();
							$.ajax({
								url: 'ConfigureNetworkServer',
								type: 'POST', 
								dataType:'json',
								data: $('.js-value-form').serialize() +"&"+ $('.js-form-modif-NAT').serialize()+ "&param="+select+"&fn=modifNATNetwork",
								success: function (data) { 
									if(data.header.statut == "200"){ 
										NATMap = data.data.NATNetworkServer;
										$('#NATNetworkServer').empty(); 
										$.each(data.data.NATNetworkServer,function(key,val){  
											if(typeof val.Name != "undefined"){
												$('#NATNetworkServer').append('<option value="'+val.Name+'">'+val.Name+'</option>');
											} 
										}); 
										$('#modif-NATNetwork-server-modal').modal('hide');
										swal( 'Modified!', 'This network has been modified.', 'success' );
									}else{ 
										notify('danger','Error : ['+ data.header.statut +'] deleteNATNetwork');
										swal( 'Not modified!',  'This network has not been modified.',  'error' );
									}
								},
								error: function (jqXHR, textStatus, errorThrown) { 
									notify('danger','Error : '+ jqXHR.status+' ['+errorThrown+'] modifNATNetwork');
									swal( 'Not modified!',  'This network has not been modified.',  'error' ); 
								}
							});
					    })
					  },
					  allowOutsideClick: false
					});
		}
		
		
		/****************************************
		 * 				Other function
		 ************************************** */
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
		 *           event 
		 **************************/
		$('#btn-delete-HostOnlyNetwork-server').click(function(e){
			e.preventDefault();
			deleteHostOnlyNetwork();
				
		});
		
		$('#btn-delete-NATNetwork-server').click(function(e){
			e.preventDefault();
			deleteNATNetwork();
				
		});
		
		$('#btn-create-HostOnlyNetwork-server').click(function(e){
			e.preventDefault();
			createHostOnlyNetwork();
					 
		});
		$('#cfgsrv-hostOnly-dhcp-enable').change(function(e){
			e.preventDefault();
			if($("#cfgsrv-hostOnly-dhcp-enable").is(':checked')){
				$('#cfgsrv-hostOnly-dhcp-address').prop('disabled', false);
				$('#cfgsrv-hostOnly-dhcp-mask').prop('disabled', false);
				$('#cfgsrv-hostOnly-dhcp-lowerAdd').prop('disabled', false);
				$('#cfgsrv-hostOnly-dhcp-upperAdd').prop('disabled', false);
				$('#cfgsrv-hostOnly-dhcp-enable').prop('checked', true);
			} else{
				$('#cfgsrv-hostOnly-dhcp-address').prop('disabled', true);
				$('#cfgsrv-hostOnly-dhcp-mask').prop('disabled', true);
				$('#cfgsrv-hostOnly-dhcp-lowerAdd').prop('disabled', true);
				$('#cfgsrv-hostOnly-dhcp-upperAdd').prop('disabled', true);
				$('#cfgsrv-hostOnly-dhcp-enable').prop('checked', false);
			}
			    
		});

		$('#NATNetworkServer').change(function(e){
			e.preventDefault();
			$('#btn-modif-NATNetwork-server').prop("disabled",false);
			$('#btn-delete-NATNetwork-server').prop("disabled",false);
			var select = $('#NATNetworkServer').find(':selected').val();
			$.each(NATMap,function(key,val){
				if(key == select){
					$('#cfgsrv-NATNetwork-name').val(val.Name);
					if(val.IPv6 == "true"){
						$('#cfgsrv-NATNetwork-supportIPv6').prop('checked', true);
						$('#cfgsrv-NATNetwork-CIDR').val(val.CIDRv6);
					}else{
						$('#cfgsrv-NATNetwork-CIDR').val(val.CIDRv4);
					}
					
					$('#cfgsrv-NATNetwork-IPv6Route').prop('checked', val.DefaultIPv6Route);
					$('#cfgsrv-NATNetwork-DHCP').prop('checked', val.DHCP);
					if($('#cfgsrv-NATNetwork-supportIPv6').val() == "true"){
						$('#cfgsrv-NATNetwork-IPv6Route').prop("disabled",false);
					}else{
						$('#cfgsrv-NATNetwork-IPv6Route').prop("disabled",false);
					}
				}
				
			});
			
		});
		
		$('#btn-save-mofi-hostOnly').click(function(e){
			e.preventDefault();
			modifHostOnlyNetwork();
		});
		
		$('#btn-save-mofi-nat').click(function(e){
			e.preventDefault();
			modifNATNetwork();
			
		});
		
		$('#cfgsrv-NATNetwork-supportIPv6').change(function(e){
			if($(this).val() == "true"){
				$('#cfgsrv-NATNetwork-IPv6Route').prop("disabled",false);
			}else{
				$('#cfgsrv-NATNetwork-IPv6Route').prop("disabled",true);
			}
		});
		
		$('#btn-create-nat').click(function(e){
			e.preventDefault();
			
				createNATNetwork();
			
		});
		
		$('#HostOnlyNetworkServer').change(function(e){
			e.preventDefault();
			$('#btn-modif-HostOnlyNetwork-server').prop("disabled",false);
			var select = $('#HostOnlyNetworkServer').find(':selected').val();
			$.each(hostOnlyMap,function(key,val){
				if(val.Name == select){
					$('#cfgsrv-hostOnly-ipv4').val(val.IPv4Address);
					$('#cfgsrv-hostOnly-ipv4Mask').val(val.IPv4NetworkMask);
					$('#cfgsrv-hostOnly-ipv6').val(val.IPv6Address);
					$('#cfgsrv-hostOnly-ipv6MaskLength').val(val.IPv6NetworkMask);
					
					if(val.DHCPEnabled == true){
						$('#cfgsrv-hostOnly-dhcp-enable').prop('checked', true);
						
						$('#cfgsrv-hostOnly-dhcp-address').prop('disabled', false);
						$('#cfgsrv-hostOnly-dhcp-mask').prop('disabled', false);
						$('#cfgsrv-hostOnly-dhcp-lowerAdd').prop('disabled', false);
						$('#cfgsrv-hostOnly-dhcp-upperAdd').prop('disabled', false);
						
						$('#cfgsrv-hostOnly-dhcp-address').val(val.DHCPServerIpAddress);
						$('#cfgsrv-hostOnly-dhcp-mask').val(val.DHCPNetworkMask);
						$('#cfgsrv-hostOnly-dhcp-lowerAdd').val(val.DHCPLowerIp);
						$('#cfgsrv-hostOnly-dhcp-upperAdd').val(val.DHCPUpperIp);
					}else{
						$('#cfgsrv-hostOnly-dhcp-enable').prop('checked', false);
						
						$('#cfgsrv-hostOnly-dhcp-address').val(val.DHCPServerIpAddress);
						$('#cfgsrv-hostOnly-dhcp-mask').val(val.DHCPNetworkMask);
						$('#cfgsrv-hostOnly-dhcp-lowerAdd').val(val.DHCPLowerIp);
						$('#cfgsrv-hostOnly-dhcp-upperAdd').val(val.DHCPUpperIp);
						
						$('#cfgsrv-hostOnly-dhcp-address').prop('disabled', true);
						$('#cfgsrv-hostOnly-dhcp-mask').prop('disabled', true);
						$('#cfgsrv-hostOnly-dhcp-lowerAdd').prop('disabled', true);
						$('#cfgsrv-hostOnly-dhcp-upperAdd').prop('disabled', true);
					}
				}
			});
			
		});
		$('#btn-save-mofi-hostOnly').click(function(e){
			e.preventDefault();
			modifHostOnlyNetwork();
		});


		/***************************
		 *        Main API 
		 **************************/
		 
		$('#modif-HostOnlyNetwork-server-modal').modal({backdrop: 'static', keyboard: false});
		$('#modif-HostOnlyNetwork-server-modal').modal('hide'); 
		$('.loader-block').show();
		getHostOnlyNetwork();
		getNATNetwork();

  

	});

})(jQuery);
