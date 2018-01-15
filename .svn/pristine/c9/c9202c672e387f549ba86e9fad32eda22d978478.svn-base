
(function($) {

	$(document).ready(function() {
		/***************************
		 *        Variable 
		 **************************/
		var refreshInterval 	= 10;
		var autoRefresh 		= true;
		var inTransaction 	= false;
		var toggle 			= false;
		var autoRefreshLauncher;


		/**************************************
		 *        Preview and state 
		 ***************************************/

		function getPreviewAndState(isLoader){
			if(!inTransaction){
				inTransaction = true;
				if(isLoader){$('.preview-block').addClass("block-opt-refresh");}

				$.ajax({
					url: 'PreviewStateMachine',
					type: 'POST', 
					dataType:'json',
					data: $('.js-value-form').serialize(),
					success: function (data) { 
						if(data.header.statut == "200"){
							$("#vm-state-machine").empty();
							$("#vm-state-machine").html("<i class=\"fa "+ data.data.state +" \" aria-hidden=\"true\"></i>&nbsp;"+ data.data.state );

							if(data.data.preview == null){
								$("#js-preview-img").attr("src","assets/img/photos/nosignal.jpg"); 
							}else{
								$("#js-preview-img").attr("src",data.data.preview); 
							}

							$('.preview-block').removeClass("block-opt-refresh");
							if(isLoader){notify("success","Preview updated!");}
							inTransaction = false;
						}else{
							if(isLoader){notify('warning','Error ['+data.header.statut+'] getPreviewAndState');}
							$('.preview-block').removeClass("block-opt-refresh"); 
							inTransaction = false;
						}

					},
					error: function (data) {
						if(isLoader){notify('warning','Error ['+data.header.statut+'] getPreviewAndState');}
						$('.preview-block').removeClass("block-opt-refresh"); 
						inTransaction = false;
					}
				}); 
			}
		}
		/**************************************
		 *        Start and Stop 
		 ***************************************/
		function startMachine(){
			inTransaction = true;
			$('.loader').show();
			$.ajax({
				url: 'StartMachine',
				type: 'POST', 
				dataType:'json',
				data: $('.js-value-form').serialize(),
				success: function (data) { 
					inTransaction = false;
					$('.loader').hide();

					if(data.header.statut == "200"){ 
						getPreviewAndState();
						notify('success','Machine being started');
					}else{ 
						notify('danger','Error : ['+ data.header.statut +'] Machine not started !');
					}

				},
				error: function (jqXHR, textStatus, errorThrown) {
					inTransaction = false; 
					$('.loader').hide();
					notify('danger','Error : '+ jqXHR.status+' ['+errorThrown+'] Machine not started !');

				}
			}); 
			
		}
		
		
		
		function stopMachine(){
			inTransaction = true;
			$('.loader').show();
			$.ajax({
				url: 'StopMachine',
				type: 'POST', 
				dataType:'json',
				data: $('#stop-machine-form').serialize(),
				success: function (data) { 
					inTransaction = false;
					jQuery('#stopMachine-modal').modal('hide'); 
					$('.loader').hide();
					if(data.header.statut == "200"){ 
						getPreviewAndState();  
						notify('success','Machine being stopped');
					}else{
						notify('danger','Error : ['+ data.header.statut +'] Machine not started !');
					} 
				},
				error: function (jqXHR, textStatus, errorThrown) {
					jQuery('#stopMachine-modal').modal('hide');
					inTransaction = false; 
					$('.loader').hide();
					notify('danger','Error : '+ jqXHR.status+' ['+errorThrown+'] Machine not stopped !');
				}
			}); 
		}
		
		
		/**************************************
		 *        Delete  and create 
		 ***************************************/
		function deleteMachine(){
			inTransaction = true;
			$('.loader').show();
			$.ajax({
				url: 'DeleteMachine',
				type: 'POST', 
				data: $('#delete-vm-form').serialize(),
				success: function (data) { 
					inTransaction = false;
					jQuery('#deleteMachine-modal').modal('hide');
					notify('success','Machine deleted');
					$('.loader').hide(); 
					window.location.replace("index.jsp");
				},
				error: function (jqXHR, textStatus, errorThrown) {
					inTransaction = false; 
					jQuery('#deleteMachine-modal').modal('hide');
					notify('danger','Error : '+ jqXHR.status+' ['+errorThrown+'] Machine not deleted !');
					$('.loader').hide();
				}
			}); 
		}

		
		/**************************************
		 *        Configure 
		 ***************************************/
		function configureMachine(){
			inTransaction = true;
			$('.loader').show();
			$.ajax({
				url: 'ConfigureMachine',
				type: 'POST', 
				data: $('#cfg-vm-form').serialize(),
				success: function (data) { 
					inTransaction = false;
					$('.loader').hide();
					jQuery('#configureMachine-modal').modal('hide');
					notify('success','Settings saved !');
					location.reload();
				},
				error: function (jqXHR, textStatus, errorThrown) {
					inTransaction = false; 
					$('.loader').hide();
					notify('danger','Error : '+ jqXHR.status+' ['+errorThrown+'] Settings not saved !');

				}
			}); 
		}
		
		/**************************************
		 *        Storage 
		 ***************************************/
		
		function showStorageTree(data){
			$('.js-tree-storage').empty();
			jQuery('.js-tree-storage').treeview({
				data: data.data.storageTree,
				color: '#555',
				expandIcon: 'fa fa-plus',
				collapseIcon: 'fa fa-minus',
				nodeIcon: 'fa fa-hdd-o text-primary',
				onhoverColor: '#f9f9f9',
				selectedColor: '#555',
				selectedBackColor: '#f1f1f1',
				showBorder: false,
				levels: 3,
				onNodeSelected: function(event, data) {
					showStorageInfos(data);
				},
				onNodeUnselected: function(event,data){
					hideStorageInfos();
				}
			});
		}

		function getStorageTree(){

			$('.loader-storage').show();
			$.ajax({
				url: 'ConfigureStorage',
				type: 'POST', 
				dataType:'json',
				data: $('.js-value-form').serialize()+"&fn=getStorageTree&param=null",
				success: function (data) { 

					$('.loader-storage').hide();


					if(data.header.statut == "200"){ 
						setControllerAvailable(data.data.controller);
						showStorageTree(data);


					}else{ 
						notify('danger','Error : ['+ data.header.statut +'] getStorageTree');
					}

				},
				error: function (jqXHR, textStatus, errorThrown) {

					$('.loader-storage').hide();
					notify('danger','Error : '+ jqXHR.status+' ['+errorThrown+'] getStorageTree');

				}
			}); 
		}

		function showStorageInfos(data){

			var node = data.text.substring(0,3);
			$('#storage-infos').empty();
			if(node == "Con"){
				$('#storage-infos').append("<h3 id=\"controllerName\">"+data.text.substring(13) +"<h3><br>");
				$('#storage-infos').append("<button id=\"btn-add-opticalDisk\" class=\"btn btn-default\" type=\"button\"><i class=\"si si-disc\"></i></button>");
				$('#storage-infos').append("<button data-toggle=\"modal\"  data-target=\"#createHDD-modal\" id=\"btn-add-hardDisk\" class=\"btn btn-default\" type=\"button\"><i class=\"fa fa-hdd-o\"></i></button>");
				$('#storage-infos').append("<button id=\"btn-delete-controller\" class=\"btn btn-danger\" type=\"button\" ><i class=\"fa fa-times\"></i></button>");



				$('#btn-delete-controller').click(function(e){
					e.preventDefault();
					swal({
						title: 'Are you sure?',
						type: 'warning',
						showCancelButton: true,
						confirmButtonColor: '#3085d6',
						cancelButtonColor: '#d33',
						confirmButtonText: 'Yes, delete it!'
					}).then(function () {
						deleteController();
						hideStorageInfos();
					})

				});
			}else{
				$('#storage-infos').html("drive : "+data.text+"<br>");
			}

		}
		function hideStorageInfos(){
			$('#storage-infos').empty(); 

		}
		function setControllerAvailable(data){
			$.each(data,function(key,val){
				switch(key){
				case "IDE":
					$('#new-controller-ide').addClass("disable-controller");
					break;
				case "SATA":
					$('#new-controller-sata').addClass("disable-controller");
					break;
				case "USB":
					$('#new-controller-usb').addClass("disable-controller");
					break;
				case "FLOPPY":
					$('#new-controller-floppy').addClass("disable-controller");
					break;
				case "SAS":
					$('#new-controller-sas').addClass("disable-controller");
					break;
				case "SCSI":
					$('#new-controller-scsi').addClass("disable-controller");
					break;
				default:
					break;
				}
			});
		}



		function createController(ctrl){ 
			$('.loader-storage').show();  
			$.ajax({
				url: 'ConfigureStorage',
				type: 'POST', 
				dataType:'json',
				data: $('.js-value-form').serialize() + "&fn=addCtrl&param="+ctrl,
				success: function (data) {  
					$('.loader-storage').hide();  
					if(data.header.statut == "200"){ 
						setControllerAvailable(data.data.controller); 
						showStorageTree(data); 
					}else{ 
						notify('danger','Error : ['+ data.header.statut +'] createController');
					} 
					
				},
				error: function (jqXHR, textStatus, errorThrown) { 
					$('.loader-storage').hide();
					notify('danger','Error : '+ jqXHR.status+' ['+errorThrown+'] createController'); 
					
				}
			}); 
		}

		function deleteController(){
			$('.loader-storage').show();
			var ctrl = $('#controllerName').text();
			$.ajax({
				url: 'ConfigureStorage',
				type: 'POST', 
				dataType:'json',
				data: $('.js-value-form').serialize() + "&fn=removeCtrl&param="+ctrl,
				success: function (data) { 
					$('.loader-storage').hide(); 
					if(data.header.statut == "200"){ 
						setControllerAvailable(data.data.controller); 
						showStorageTree(data); 
					}else{ 
						notify('danger','Error : ['+ data.header.statut +'] deleteController');
						swal( 'Oops...', 'Something went wrong!', 'error' );
					} 
				},
				error: function (jqXHR, textStatus, errorThrown) { 
					$('.loader-storage').hide();
					notify('danger','Error : '+ jqXHR.status+' ['+errorThrown+'] deleteController'); 
					swal( 'Oops...', 'Something went wrong!', 'error' );
				}
			}); 
		}
		
		function createHDD(){
			$('.loader-storage').show();
			$('#createHDD-modal div.block').addClass('block-opt-refresh');
			var ctrl = $('#controllerName').text();
			$.ajax({
				url: 'ConfigureStorage',
				type: 'POST', 
				dataType:'json',
				data: $('.js-value-form').serialize() +"&"+$('#js-form-createHDD').serialize()+ "&fn=addDrive&param="+ctrl,
				success: function (data) { 
					$('.loader-storage').hide(); 
					if(data.header.statut == "200"){ 
						jQuery('#createHDD-modal').modal('hide');
						setControllerAvailable(data.data.controller); 
						showStorageTree(data); 
					}else{ 
						notify('danger','Error : ['+ data.header.statut +'] createHDD' );
						swal( 'Oops...', 'Something went wrong!', 'error' );
					} 
					$('#createHDD-modal div.block').removeClass('block-opt-refresh');
				},
				error: function (jqXHR, textStatus, errorThrown) { 
					$('.loader-storage').hide();
					notify('danger','Error : '+ jqXHR.status+' ['+errorThrown+'] createHDD'); 
					$('#createHDD-modal div.block').removeClass('block-opt-refresh');
					swal( 'Oops...', 'Something went wrong!', 'error' );
					
				}
			});  
		}

		/**********************
		 * 		SNAPSHOT
		 * *******************
		 */
		
		function getTreeSnapshot(){
			$('#block-snapshot').addClass('block-opt-refresh');
			$.ajax({
				url: 'Snapshot',
				type: 'POST', 
				dataType:'json',
				data: $('.js-value-form').serialize() + "&fn=getSnapshots&param=",
				success: function (data) { 
					 
					if(data.header.statut == "200"){  
						$('.js-tree-snapshot').find('ul').empty();
						if(jQuery.isEmptyObject(data.data.snapshot)){
							var div = $('.js-tree-snapshot').find('ul'); 
							var content ="<li class=\"list-snapshot list-group-item node-\" >";
							 
							content += "<span class=\"icon node-icon fa fa-times text-city\"></span>";
							content += 	"No snapshot"					
							content +=  "</li>";
							div.append(content);
						}else{
							showTreeSnapshot(data.data.snapshot,0); 
						}
						eventSnapshot();
					}else{ 
						notify('danger','Error : ['+ data.header.statut +'] getTreeSnapshot' ); 
						var div = $('.js-tree-snapshot').find('ul'); 
						var content ="<li class=\"list-snapshot list-group-item node-\" >";
						 
						content += "<span class=\"icon node-icon fa fa-times text-city\"></span>";
						content += 	"Error when getting snapshot tree"					
						content +=  "</li>";
						div.append(content);
					} 
					$('#block-snapshot').removeClass('block-opt-refresh');
				},
				error: function (jqXHR, textStatus, errorThrown) { 
					notify('danger','Error : '+ jqXHR.status+' ['+errorThrown+'] getTreeSnapshot'); 
					var div = $('.js-tree-snapshot').find('ul'); 
					var content ="<li class=\"list-snapshot list-group-item node-\" >";
					 
					content += "<span class=\"icon node-icon fa fa-times text-city\"></span>";
					content += 	"Error when getting snapshot tree"					
					content +=  "</li>";
					div.append(content);
					$('#block-snapshot').removeClass('block-opt-refresh');
				}
			});
		}
		
		function showTreeSnapshot(data, idx){
			var div = $('.js-tree-snapshot').find('ul');
			$.each(data,function(key,val){
				if("id" != key){
					var content ="<li id=\""+key.toString()+"\"class=\"list-snapshot list-group-item node-\" >";
					for(var i = 0; i<idx;i++){
						content +="<span class=\"indent\"></span> ";
					}
					content += "<span class=\"icon node-icon fa fa-camera-retro text-city\"></span>";
					content += key.toString();						
					content +=  "</li>";
					div.append(content);
					showTreeSnapshot(val,idx+1);
				} 
			});
		}
		
		function takeSnapshot(){
			$('#block-snapshot').addClass('block-opt-refresh');
			$.ajax({
				url: 'Snapshot',
				type: 'POST', 
				dataType:'json',
				data: $('.js-value-form').serialize() + "&fn=takeSnapshot&param=",
				success: function (data) { 
					 
					if(data.header.statut == "200"){  
						$('.js-tree-snapshot').find('ul').empty();
						showTreeSnapshot(data.data.snapshot,0); 
						eventSnapshot();
					}else{ 
						notify('danger','Error : ['+ data.header.statut +'] takeSnapshot' ); 
					} 
					$('#block-snapshot').removeClass('block-opt-refresh');
				},
				error: function (jqXHR, textStatus, errorThrown) { 
					notify('danger','Error : '+ jqXHR.status+' ['+errorThrown+'] takeSnapshot'); 
					$('#block-snapshot').removeClass('block-opt-refresh');
				}
			});
		}
		
		function deleteSnapshot(){
			var snap = $('li.list-snapshot.selected').attr('id');
			$('#block-snapshot').addClass('block-opt-refresh');
			$.ajax({
				url: 'Snapshot',
				type: 'POST', 
				dataType:'json',
				data: $('.js-value-form').serialize() + "&fn=deleteSnap&param="+snap,
				success: function (data) { 
					 
					if(data.header.statut == "200"){  
						$('.js-tree-snapshot').find('ul').empty();
						showTreeSnapshot(data.data.snapshot,0); 
						eventSnapshot();
					}else{ 
						notify('danger','Error : ['+ data.header.statut +'] deleteSnapshot' ); 
					} 
					$('#block-snapshot').removeClass('block-opt-refresh');
				},
				error: function (jqXHR, textStatus, errorThrown) { 
					notify('danger','Error : '+ jqXHR.status+' ['+errorThrown+'] deleteSnapshot'); 
					$('#block-snapshot').removeClass('block-opt-refresh');
				}
			});
		}
		function restoreSnapshot(){
			var snap = $('li.list-snapshot.selected').attr('id');
			$('#block-snapshot').addClass('block-opt-refresh');
			$.ajax({
				url: 'Snapshot',
				type: 'POST', 
				dataType:'json',
				data: $('.js-value-form').serialize() + "&fn=restoreSnap&param="+snap,
				success: function (data) { 
					 
					if(data.header.statut == "200"){ 
						$('.js-tree-snapshot').find('ul').empty();
						showTreeSnapshot(data.data.snapshot,0); 
						eventSnapshot();
					}else{ 
						notify('danger','Error : ['+ data.header.statut +'] restoreSnap' ); 
					} 
					$('#block-snapshot').removeClass('block-opt-refresh');
				},
				error: function (jqXHR, textStatus, errorThrown) { 
					notify('danger','Error : '+ jqXHR.status+' ['+errorThrown+'] restoreSnap'); 
					$('#block-snapshot').removeClass('block-opt-refresh');
				}
			});
		}

		function eventSnapshot(){
			$("li.list-snapshot").css("background", "");
			$("li.list-snapshot").removeClass("selected");
			$('#btn-delete-snap').prop("disabled",true);
			$('#btn-restore-snap').prop("disabled",true);

			$("li.list-snapshot").click(function(){
				$("li.list-snapshot").css("background", "");
				$("li.list-snapshot").removeClass("selected");
			    $(this).css("background", "#f1f1f1");
			    $(this).addClass("selected");
			    $('#btn-delete-snap').prop("disabled",false);
				$('#btn-restore-snap').prop("disabled",false);
			});
		}

		/**************************************
		 *        Other function
		 ***************************************/

		function changeInterval(int){
			clearInterval(autoRefreshLauncher);
			if(int == 0){ 
				autoRefresh = false;
			}else{

				autoRefresh = true; 
				autoRefreshLauncher = setInterval(function () { mainAPI(); },int*1000); 


			}

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
				delay: 6000,
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
		$('#detail-btn').click(function() {
			$('#detail-btn').addClass('active-vm-tab');
			$('#console-btn').removeClass('active-vm-tab');
			$('#snapshot-btn').removeClass('active-vm-tab');
			$('#details').show();
			$('#console').hide();
			$('#snapshot').hide();
		});

		$('#console-btn').click(function() {
			$('#detail-btn').removeClass('active-vm-tab');
			$('#console-btn').addClass('active-vm-tab');
			$('#snapshot-btn').removeClass('active-vm-tab');
			$('#details').hide();
			$('#console').show();
			$('#snapshot').hide();
		});

		$('#snapshot-btn').click(function() {
			$('#detail-btn').removeClass('active-vm-tab');
			$('#console-btn').removeClass('active-vm-tab');
			$('#snapshot-btn').addClass('active-vm-tab');
			$('#details').hide();
			$('#console').hide();
			$('#snapshot').show();
		});


		$('#btn-preview-refresh').click(function(e) {
			e.preventDefault();
			getPreviewAndState(true); 
		});

		$('#btn-change-interval').click(function(e) {
			e.preventDefault();
			changeInterval($('#btn-change-interval').text()); 
		});

		$('#start-btn').click(function(e) {
			e.preventDefault();
			startMachine(); 
		});

		$('#btn-delete-machine').click(function(e) {
			e.preventDefault();
			deleteMachine(); 
		});
		$('#start-btn-dropdown').click(function(e) {
			e.preventDefault();
			startMachine(); 
		});
		$('#btn-stop-machine').click(function(e){
			e.preventDefault();
			stopMachine();
		});
		$('#btn-create-machine').click(function(e){
			e.preventDefault();
			createMachine();
		});
		$('#btn-save-cfg-vm').click(function(e){
			e.preventDefault();
			configureMachine();
		});
		$('#btn-createHDD').click(function(e){
			e.preventDefault();
			createHDD();
		});
		
		$('#button-refresh-MAC-0').click(function(e){
			e.preventDefault();
			refreshMAC(0);
		});
		
		$('#button-refresh-MAC-1').click(function(e){
			e.preventDefault();
			refreshMAC(1);
		});
		
		$('#button-refresh-MAC-2').click(function(e){
			e.preventDefault();
			refreshMAC(2);
		});
		
		$('#button-refresh-MAC-3').click(function(e){
			e.preventDefault();
			refreshMAC(3);
		});
		
		function refreshMAC(i){
			$('#icon-refresh-MAC-'+i.toString()).addClass('fa-fw');
			$('#icon-refresh-MAC-'+i.toString()).addClass('fa-spin');
			$.ajax({
				url: 'ConfigureStorage',
				type: 'POST', 
				dataType:'json',
				data: $('.js-value-form').serialize()+"&fn=refreshMAC&param="+i,
				success: function (data) { 
					if(data.header.statut == "200"){ 
						$('#cfg-network-adapter'+i.toString()+'-MAC').val(data.data.MAC);
						$('#icon-refresh-MAC-'+i.toString()).removeClass('fa-fw');
						$('#icon-refresh-MAC-'+i.toString()).removeClass('fa-spin');
					}else{ 
						notify('danger','Error : ['+ data.header.statut +'] RefreshMAC' );
						swal( 'Oops...', 'Something went wrong!', 'error' );
						$('#icon-refresh-MAC-'+i.toString()).removeClass('fa-fw');
						$('#icon-refresh-MAC-'+i.toString()).removeClass('fa-spin');
					} 
				},
				error: function (jqXHR, textStatus, errorThrown) { 
					$('.loader-storage').hide();
					notify('danger','Error : '+ jqXHR.status+' ['+errorThrown+'] RefreshMAC'); 
					swal( 'Oops...', 'Something went wrong!', 'error' );
					$('#icon-refresh-MAC-'+i.toString()).removeClass('fa-fw');
					$('#icon-refresh-MAC-'+i.toString()).removeClass('fa-spin');
				}
			});  
		}



		//Change interval 

		$('#btn-change-interval-0').click(function(e){
			e.preventDefault();
			$('#li-change-interval-5').removeClass("active-interval");
			$('#li-change-interval-10').removeClass("active-interval");
			$('#li-change-interval-20').removeClass("active-interval");
			$('#li-change-interval-0').removeClass("active-interval"); 
			$('#li-change-interval-0').addClass("active-interval");
			changeInterval(0);
		});
		$('#btn-change-interval-5').click(function(e){
			e.preventDefault();
			$('#li-change-interval-5').removeClass("active-interval");
			$('#li-change-interval-10').removeClass("active-interval");
			$('#li-change-interval-20').removeClass("active-interval");
			$('#li-change-interval-0').removeClass("active-interval");
			changeInterval(5);
			$('#li-change-interval-5').addClass("active-interval");
		});
		$('#btn-change-interval-10').click(function(e){
			e.preventDefault();
			$('#li-change-interval-5').removeClass("active-interval");
			$('#li-change-interval-10').removeClass("active-interval");
			$('#li-change-interval-20').removeClass("active-interval");
			$('#li-change-interval-0').removeClass("active-interval");
			changeInterval(10);
			$('#li-change-interval-10').addClass("active-interval");
		});
		$('#btn-change-interval-20').click(function(e){
			e.preventDefault();
			$('#li-change-interval-5').removeClass("active-interval");
			$('#li-change-interval-10').removeClass("active-interval");
			$('#li-change-interval-20').removeClass("active-interval");
			$('#li-change-interval-0').removeClass("active-interval");
			changeInterval(20);
			$('#li-change-interval-20').addClass("active-interval");
		});


		//add storage controller 
		$('#new-controller-ide').click(function(e){
			e.preventDefault();
			createController("IDE");
		});
		$('#new-controller-sata').click(function(e){
			e.preventDefault();
			createController("SATA");
		});
		$('#new-controller-usb').click(function(e){
			e.preventDefault();
			createController("USB");
		});
		$('#new-controller-floppy').click(function(e){
			e.preventDefault();
			createController("FLOPPY");
		});
		$('#new-controller-sas').click(function(e){
			e.preventDefault();
			createController("SAS");
		});
		$('#new-controller-scsi').click(function(e){
			e.preventDefault();
			createController("SCSI");
		});
		
		
		
		
		
		
		$('#btn-take-snap').click(function(e){
			e.preventDefault(); 
			takeSnapshot();
		});
		
		$('#btn-delete-snap').click(function(e){
			e.preventDefault(); 
			deleteSnapshot();
		});
		$('#btn-restore-snap').click(function(e){
			e.preventDefault(); 
			restoreSnapshot();
		});

		$('#btn-delete-snap').prop("disabled",true);
		$('#btn-restore-snap').prop("disabled",true);
	

		/***************************
		 *        Main API 
		 **************************/
		function mainAPI(){ 
			if(autoRefresh){ 
				getPreviewAndState(); 
			} 
		}
		getPreviewAndState();
		getStorageTree();
		getTreeSnapshot();
		autoRefreshLauncher = setInterval(function () { mainAPI(); },refreshInterval*1000);  




	});

})(jQuery);
