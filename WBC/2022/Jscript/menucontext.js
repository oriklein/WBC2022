

function showToolbar()
{
// AddItem(id, text, hint, location, alternativeLocation);
// AddSubItem(idParent, text, hint, location, linktarget);

	menu = new Menu();
	menu.addItem("a", "Attendee", "Attendee",  null, null);
	menu.addItem("c", "Contributor", "Contributor",  null, null);
	menu.addItem("d", "Doner", "Doner",  null, null);
	

	menu.addSubItem("a", "link-1", null,  "#", "");
	menu.addSubItem("a", "link-2", null,  "#", "");
	menu.addSubItem("a", "link-3", null,  "#", "");
	

	menu.addSubItem("c", "link-1", null,  "#", "");
	menu.addSubItem("c", "link-2", null,  "#", "");
	menu.addSubItem("c", "link-3", null,  "#", "");
	menu.addSubItem("c", "link-4", null,  "#", "");

	menu.addSubItem("d", "link-1", null,  "#", "");
	menu.addSubItem("d", "link-2", null,  "#", "");
	menu.addSubItem("d", "link-3", null,  "#", "");
	menu.addSubItem("d", "link-4", null,  "#", "");

	menu.showMenu();
}

function showToolbar()
{
// AddItem(id, text, hint, location, alternativeLocation);
// AddSubItem(idParent, text, hint, location, linktarget);

	menu = new Menu();
	menu.addItem("a", "Attendee", "Attendee",  null, null);
	menu.addItem("c", "Contributor", "Contributor",  null, null);
	menu.addItem("d", "Doner", "Doner",  null, null);
	

	menu.addSubItem("a", "link-1", null,  "#", "");
	menu.addSubItem("a", "link-2", null,  "#", "");
	menu.addSubItem("a", "link-3", null,  "#", "");
	

	menu.addSubItem("c", "link-1", null,  "#", "");
	menu.addSubItem("c", "link-2", null,  "#", "");
	menu.addSubItem("c", "link-3", null,  "#", "");
	menu.addSubItem("c", "link-4", null,  "#", "");

	menu.addSubItem("d", "link-1", null,  "#", "");
	menu.addSubItem("d", "link-2", null,  "#", "");
	menu.addSubItem("d", "link-3", null,  "#", "");
	menu.addSubItem("d", "link-4", null,  "#", "");

	menu.showMenu();
}