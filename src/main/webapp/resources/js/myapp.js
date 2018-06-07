$(function() {
	
	
	
	
	
	// solving the active menu problem
	switch (menu) {
	
	case 'Home':
		$('#home').addClass('active');
		break;
	case 'Search':
		$('#reports').addClass('active');
		$('#search').addClass('active');
		break;
	case 'User Management':
		$('#usermanagement').addClass('active');
		break;
	case 'Main Search':
		$('#reports').addClass('active');
		$('#searchmain').addClass('active');
		break;
	case 'Reports':
		$('#reports').addClass('active');
		break;		
	default:
		if (menu == "Home")
			break;
		$('#home').addClass('active');
		
		break;
	}
});
	// 