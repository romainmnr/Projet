
(function($) {

  $(document).ready(function() {

	 
	  /***************************
	   *        Function 
	   **************************/

	  
		function login(){

			$('#log_in_btn').empty();
			$('#log_in_btn').html('<i class="fa fa-refresh fa-2x fa-spin fa-fw"></i>');
			$.ajax({
				url: 'ConnectionServlet',
				type: 'POST', 
				dataType: 'JSON',
				data: $('#login-form').serialize(),
				success: function (data) { 
					if(data.header.statut == "200"){
						$('#log_in_btn').empty();
						$('#log_in_btn').html('<i class="fa fa-check fa-2x"></i>');
						window.location.replace('index.jsp');
					}else{
						notify('danger','Error - Failed to login - '+data.data.msg);
						$('#log_in_btn').empty();
						$('#log_in_btn').html('Log in');
					}
					
				},
				error: function (jqXHR, textStatus, errorThrown) {
					notify('danger','Error - Failed to login ');
					$('#log_in_btn').empty();
					$('#log_in_btn').html('Log in');
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
                    align: 'left'
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
	  
	  function resizeSidebarContent(){
		  var winHeight = $(window).height(); 
		  var headerHeight = $('#sidebar-top').height();
		  $('#side-sontent-scroll').height(winHeight - headerHeight);
			  
	  }
	  
	  
	  /***************************
	   *        On click event 
	   **************************/

	  $('#log_in_btn').click(function(e){
		  e.preventDefault();
		  login();
	  });

    


  });

})(jQuery);
