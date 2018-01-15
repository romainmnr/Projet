
(function($) {

	$(document).ready(function() {

		/***************************
		 *        Function 
		 **************************/
		
		
		/****************************************
		 * 		Host Only network  function
		 ************************************** */
		function sendEMail(){
			swal({
				  title: 'Are you sure?', 
				  type: 'warning',
				  showCancelButton: true,
				  confirmButtonColor: '#3085d6',
				  cancelButtonColor: '#d33',
				  confirmButtonText: 'Yes, send it!',
					  showLoaderOnConfirm: true,
					  preConfirm: function (email) {
					    return new Promise(function (resolve, reject) {
					    	var name = $("#MailName").val();
					    	var surname = $("#MailSurname").val();
					    	var text = $("#MailText").val();
					    	var email = $("#MailEmailToAnswer").val();
					    	$.ajax({
								url: 'SendMail',
								type: 'POST', 
								dataType:'json',
								data: $('.js-value-form').serialize() + "&Name="+name+"&Surname="+surname+"&Text="+text+"&Email="+email,
								success: function (data) { 
									if(data.header.statut == "200"){ 
										//TODO Verifier la bonne suppression du reseau
										hostOnlyMap = data.data.HostOnlyNetworkServer;  
										$("#MailName").val('');
										$("#MailSurname").val('');
										$("#MailText").val('');
										$("#MailEmailToAnswer").val('');
										swal( 'Sent!', 'Message sent.', 'success' );
									}else{ 
										notify('danger','Error : ['+ data.header.statut +'] SendMail');
										swal( 'Not sent!',  'An error has occured.',  'error' );
									}
									 
								},
								error: function (jqXHR, textStatus, errorThrown) { 
									notify('danger','Error : '+ jqXHR.status+' ['+errorThrown+'] SendMail');
									swal( 'Not sent!',  'An error has occured.',  'error' );
								}
							});
					    })
					  },
					  allowOutsideClick: false
					})
			
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
		$('#btn-sendMail').click(function(e){
			e.preventDefault();
			sendEMail();
				
		});

		/***************************
		 *        Main API 
		 **************************/
		 
		$('.loader-block').show();
	});

})(jQuery);
