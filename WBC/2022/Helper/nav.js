function newImage(arg) {
	if (document.images) {
		rslt = new Image();
		rslt.src = arg;
		return rslt;
	}
}

function changeImages() {
	if (document.images && (preloadFlag == true)) {
		for (var i=0; i<changeImages.arguments.length; i+=2) {
			document[changeImages.arguments[i]].src = changeImages.arguments[i+1];
		}
	}
}

var preloadFlag = false;
function preloadImages() {
	if (document.images) {
		//home_head_over = newImage("images/home_head-over.jpg");
		research_head_over = newImage("images/research_head_05-over.jpg");
		research_head_overb = newImage("images/research_head_05b-over.jpg");
		//education_head_over = newImage("images/education_head_05-over");
		mentor_head_over = newImage("images/mentor_head_05-over.jpg");
		mentor_head_overb = newImage("images/mentor_head_05b-over.jpg");
		consulting_head_over = newImage("images/consulting_head_05-over.jpg");
		about_head_over = newImage("images/about_head_05-over.jpg");
		//contact_head_over = newImage("images/contact_head_05-over.jpg");
		consulting_head_inset_over = newImage("images/consulting_head_inset-over.jpg");
		nav_home_over = newImage("images/nav_home-over.gif");
		nav_research_over = newImage("images/nav_research-over.gif");
		nav_education_over = newImage("images/nav_education-over.gif");
		nav_mentoring_over = newImage("images/nav_mentoring-over.gif");
		nav_consulting_over = newImage("images/nav_consulting-over.gif");
		nav_about_over = newImage("images/nav_about-over.gif");
		nav_contact_over = newImage("images/nav_contact-over.gif");
		preloadFlag = true;
	}
}

function openFAQAns(filename)
{
	var newWin = window.open(filename,'myWin','width=600,height=400,left=0,top=0,scrollbars=yes');
	newWin.focus();
}