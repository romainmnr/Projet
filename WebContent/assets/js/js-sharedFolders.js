
(function($) {

	$(document).ready(function() {

		/***************************
		 *        Function 
		 **************************/
		
		
		/****************************************
		 * 		Host Only network  function
		 ************************************** */
		function createSharedFolder(){
			swal({
				  title: 'Are you sure?', 
				  type: 'warning',
				  showCancelButton: true,
				  confirmButtonColor: '#3085d6',
				  cancelButtonColor: '#d33',
				  confirmButtonText: 'Yes, create it!',
					  showLoaderOnConfirm: true,
					  preConfirm: function () {
					    return new Promise(function (resolve, reject) {
					    	$.ajax({
								url: 'ConfigureSharedFolders',
								type: 'POST', 
								dataType:'json',
								data: $('.js-value-form').serialize() + "&fn=createSharedFolder&" +$('.js-form-sharedFolder').serialize(),
								success: function (data) { 
									if(data.header.statut == "200"){ 
										//TODO Verifier la bonne suppression du reseau
										sharedFolders = data.data.sharedFolders;  
										$('#table-shareFolders').empty();
							        	$.each(data.data.SharedFolders,function(key,val){
							        		if (key!="nbSharedFolder"){
								        		var folderContent = "<tr>"+
																	"<td class=\"text-center\">"+val.name+"</td>"+
																	"<td>"+val.path+"</td>";
								        		if(val.automount == "true"){
								        			folderContent += "<td class=\"hidden-xs\"><span class=\"label label-success\">Enabled</span></td>";
												}else{
													folderContent += "<td class=\"hidden-xs\"><span class=\"label label-danger\">Disabled</span></td>";
												}
												if(val.writable == "true"){
													folderContent += "<td class=\"text-center\">Full</td>";
												}else{
													folderContent += "<td class=\"text-center\">Read Only</td>";
												}
												folderContent += "<td class=\"text-center\">"+
																	"<div class=\"btn-group\">"+
																		"<div id=\""+val.name+"\" class=\"btn-delete-sharedFolder\">"+
																			"<button type=\"button\" data-toggle=\"modal\" class=\"btn btn-default\">"+
																				"<i class=\"fa fa-minus\"></i>"+
																			"</button>"+
																		"</div>"+
																	"</div>"+
																"</td>"+
															"</tr>";
												$('#table-shareFolders').append(folderContent);
							        		}
											$('#sharedFolder-modal').modal('hide');
							        	});
										swal( 'Created!', 'The shared folder was succefully created.', 'success' );
									}else{ 
										notify('danger','Error : ['+ data.header.statut +'] createSharedFolder');
										swal( 'Not created!',  'An error has occured.',  'error' );
									}
									 
								},
								error: function (jqXHR, textStatus, errorThrown) { 
									notify('danger','Error : '+ jqXHR.status+' ['+errorThrown+'] createSharedFolder');
									swal( 'Not created!',  'An error has occured.',  'error' );
								}
							});
					    })
					  },
					  allowOutsideClick: false
					});
			
		}
		
		function deleteSharedFolder(namefolder){
			swal({
				  title: 'Are you sure?', 
				  type: 'warning',
				  showCancelButton: true,
				  confirmButtonColor: '#3085d6',
				  cancelButtonColor: '#d33',
				  confirmButtonText: 'Yes, delete it!',
					  showLoaderOnConfirm: true,
					  preConfirm: function () {
					    return new Promise(function (resolve, reject) {
					    	$.ajax({
								url: 'ConfigureSharedFolders',
								type: 'POST', 
								dataType:'json',
								data: $('.js-value-form').serialize() + "&fn=deleteSharedFolder&param="+namefolder,
								success: function (data) { 
									if(data.header.statut == "200"){ 
										sharedFolders = data.data.sharedFolders;  
										$('#table-shareFolders').empty();
							        	$.each(data.data.SharedFolders,function(key,val){
							        		if (key!="nbSharedFolder"){
								        		var folderContent = "<tr>"+
																	"<td class=\"text-center\">"+val.name+"</td>"+
																	"<td>"+val.path+"</td>";
								        		if(val.automount == "true"){
								        			folderContent += "<td class=\"hidden-xs\"><span class=\"label label-success\">Enabled</span></td>";
												}else{
													folderContent += "<td class=\"hidden-xs\"><span class=\"label label-danger\">Disabled</span></td>";
												}
												if(val.writable == "true"){
													folderContent += "<td class=\"text-center\">Full</td>";
												}else{
													folderContent += "<td class=\"text-center\">Read Only</td>";
												}
												folderContent += "<td class=\"text-center\">"+
																		"<div class=\"btn-group\">"+
																			"<div id=\""+val.name+"\" class=\"btn-delete-sharedFolder\">"+
																				"<button type=\"button\" data-toggle=\"modal\" class=\"btn btn-default\">"+
																					"<i class=\"fa fa-minus\"></i>"+
																				"</button>"+
																			"</div>"+
																		"</div>"+
																	"</td>"+
																"</tr>";
												$('#table-shareFolders').append(folderContent);
							        		}
											$('.btn-delete-sharedFolder').click(function(e){
												e.preventDefault(); 
												deleteSharedFolder(this.id);
											});
							        	});
										swal( 'Deleted!', 'The shared folder was deleted.', 'success' );
									}else{ 
										notify('danger','Error : ['+ data.header.statut +'] deleteSharedFolder');
										swal( 'Not created!',  'An error has occured.',  'error' );
									}
									 
								},
								error: function (jqXHR, textStatus, errorThrown) { 
									notify('danger','Error : '+ jqXHR.status+' ['+errorThrown+'] deleteSharedFolder');
									swal( 'Not created!',  'An error has occured.',  'error' );
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
		$('#btn-create-shared-folder').click(function(e){
			e.preventDefault();
			createSharedFolder();
				
		});
		
		$('.btn-delete-sharedFolder').click(function(e){
			e.preventDefault(); 
			deleteSharedFolder(this.id);
		});
		

		/***************************
		 *        Main API 
		 **************************/
	});

})(jQuery);
